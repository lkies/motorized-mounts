use critical_section::Mutex;
use esp_idf_svc::hal::gpio::{AnyOutputPin, Level, Output, PinDriver};
use esp_idf_svc::nvs::EspDefaultNvs;
use esp_idf_svc::sys::EspError;
use esp_idf_svc::timer::{EspTimer, EspTimerService, EspTimerServiceType};
use std::cell::RefCell;
use std::sync::Arc;
use std::time::Duration;

type OutputDriver<'a> = PinDriver<'a, AnyOutputPin, Output>;

#[derive(Clone, Copy)]
enum Direction {
    Forward,
    Backward,
}

impl Direction {
    fn from_positions(current: i64, target: i64) -> Self {
        if target > current {
            Direction::Forward
        } else {
            Direction::Backward
        }
    }
    fn level(&self) -> Level {
        match self {
            Direction::Forward => Level::High,
            Direction::Backward => Level::Low,
        }
    }
    fn value(&self) -> i64 {
        match self {
            Direction::Forward => 1,
            Direction::Backward => -1,
        }
    }
}

struct StepperState<'a> {
    step_pin: OutputDriver<'a>,
    dir_pin: OutputDriver<'a>, // high for forward, low for backward
    timer: Option<EspTimer<'a>>,
    current_position: i64,
    initial_position: i64,
    direction: Direction,
    stop_accel: i64,
    start_decel: i64,
    target_position: i64,
    current_delay: f32,
    leg_speed: f32,
    max_speed: f32,
    leg_accel: f32,
    max_accel: f32,
    accel_dur: f32,
}

static ESP_TIME: esp_idf_svc::systime::EspSystemTime = esp_idf_svc::systime::EspSystemTime {};

fn timer_callback(stepper_state: &Arc<Mutex<RefCell<StepperState>>>) {
    critical_section::with(|cs| {
        let mut state = stepper_state.borrow_ref_mut(cs);
        // target reached
        if state.current_position == state.target_position {
            state.timer.as_ref().unwrap().cancel().unwrap();
            return;
        }

        state.step_pin.set_high().unwrap();
        state.step_pin.set_low().unwrap();

        state.current_position += state.direction.value();

        // acceleration profiles based on:
        // `Austin, D. (2005). Generate stepper-motor speed profiles in real time. Embedded Systems Programming, 1.`
        // mirror link https://forum.arduino.cc/uploads/short-url/zjHgyg6fRVqaXu8Tn7HBI6RikMC.pdf

        // still accelerating
        let mut new_timer_delay = Option::None;
        if (state.stop_accel - state.current_position) * state.direction.value() > 0 {
            let n = (state.current_position - state.initial_position) * state.direction.value();
            state.current_delay -= 2.0 * state.current_delay / (4 * n + 1) as f32;
            new_timer_delay = Some(state.current_delay);
        }
        // first cruise step
        else if state.stop_accel == state.current_position {
            state.current_delay = 1.0 / state.leg_speed;
            new_timer_delay = Some(state.current_delay);
        }
        // rest of cruise
        else if (state.start_decel - state.current_position) * state.direction.value() > 0 {
        }
        // decelerating
        else if (state.target_position - state.current_position) * state.direction.value() > 0 {
            let n: i64 = (state.current_position - state.target_position) * state.direction.value();
            state.current_delay -= 2.0 * state.current_delay / (4 * n + 1) as f32;
            new_timer_delay = Some(state.current_delay);
        }

        if let Some(delay) = new_timer_delay {
            state
                .timer
                .as_ref()
                .unwrap()
                .every(Duration::from_secs_f32(delay))
                .unwrap();
        }
    })
}

pub struct Stepper<'a> {
    state: Arc<Mutex<RefCell<StepperState<'a>>>>,
}

// TODO should the move functions need a mutable reference to self?
impl<'a> Stepper<'a> {
    pub const DEFAULT_MAX_SPEED: f32 = 1000.0;
    pub const DEFAULT_MAX_ACCEL: f32 = 1e10;

    pub fn new<T: EspTimerServiceType>(
        step_pin: AnyOutputPin,
        dir_pin: AnyOutputPin,
        timer_service: &EspTimerService<T>,
    ) -> Result<Self, EspError> {
        let state = Arc::new(Mutex::new(RefCell::new(StepperState {
            step_pin: PinDriver::output(step_pin)?,
            dir_pin: PinDriver::output(dir_pin)?,
            timer: None,
            current_position: 0,
            target_position: 0,
            direction: Direction::Forward,
            initial_position: 0,
            stop_accel: 0,
            start_decel: 0,
            current_delay: 0.0,
            leg_speed: 0.0,
            max_speed: Self::DEFAULT_MAX_SPEED,
            leg_accel: 0.0,
            max_accel: Self::DEFAULT_MAX_ACCEL,
            accel_dur: 0.0,
        })));
        let state_copy = state.clone();
        critical_section::with(|cs| -> Result<(), EspError> {
            let mut state = state.borrow_ref_mut(cs);
            state.timer = Some(unsafe {
                timer_service.timer_nonstatic(move || {
                    timer_callback(&state_copy);
                })
            }?);
            Ok(())
        });
        Ok(Self { state })
    }

    pub fn position(&self) -> i64 {
        critical_section::with(|cs| self.state.borrow_ref(cs).current_position)
    }

    pub fn target(&self) -> i64 {
        critical_section::with(|cs| self.state.borrow_ref(cs).target_position)
    }

    pub fn max_speed(&self) -> f32 {
        critical_section::with(|cs| self.state.borrow_ref(cs).max_speed)
    }

    pub fn set_max_speed(&self, speed: f32) {
        critical_section::with(|cs| {
            let mut state = self.state.borrow_ref_mut(cs);
            state.max_speed = speed;
        });
    }

    pub fn max_accel(&self) -> f32 {
        critical_section::with(|cs| self.state.borrow_ref(cs).max_accel)
    }

    pub fn set_max_accel(&self, accel: f32) {
        critical_section::with(|cs| {
            let mut state = self.state.borrow_ref_mut(cs);
            state.max_accel = accel;
        });
    }

    pub fn move_to(
        &self,
        target_position: i64,
        speed: Option<f32>,
        accel: Option<f32>,
    ) -> Duration {
        critical_section::with(|cs| -> Duration {
            let mut state = self.state.borrow_ref_mut(cs);

            let steps_to_move = (target_position - state.current_position).abs();
            if steps_to_move == 0 {
                return Duration::ZERO;
            }

            state.initial_position = state.current_position;
            state.target_position = target_position;

            let direction = Direction::from_positions(state.current_position, target_position);
            state.direction = direction;
            state.dir_pin.set_level(direction.level()).unwrap();
            let dir_val = direction.value();

            state.leg_speed = speed.unwrap_or(state.max_speed).min(state.max_speed);
            state.leg_accel = accel.unwrap_or(state.max_accel).min(state.max_accel);
            state.current_delay = 1.0 / (state.leg_accel.sqrt().min(state.leg_speed));

            let accel_steps = (state.leg_speed.powi(2) / (2.0 * state.leg_accel)) as i64;

            // TODO maybe use the helper here?
            if steps_to_move < 2 * accel_steps {
                // leg to short to fully accelerate
                state.stop_accel = state.current_position + dir_val * steps_to_move / 2;
                state.start_decel = state.stop_accel;
                state.accel_dur = (steps_to_move as f32 / state.leg_accel).sqrt();
                state.leg_speed = state.leg_accel * state.accel_dur;
            } else {
                state.stop_accel = state.current_position + dir_val * accel_steps;
                state.start_decel = target_position - dir_val * accel_steps;
                state.accel_dur = state.leg_speed / state.max_accel;
            }

            let total_duration = 2.0 * state.accel_dur
                + (state.start_decel - state.stop_accel).abs() as f32 / state.leg_speed;

            state
                .timer
                .as_ref()
                .unwrap()
                .every(Duration::from_secs_f32(state.current_delay))
                .unwrap();
            Duration::from_secs_f32(total_duration)
        })
    }

    pub fn stop(&self) {
        critical_section::with(|cs| {
            let mut state = self.state.borrow_ref_mut(cs);
            state.target_position = state.current_position;
        });
    }

    pub fn steps_remaining(&self) -> i64 {
        critical_section::with(|cs| {
            let state = self.state.borrow_ref(cs);
            (state.target_position - state.current_position).abs()
        })
    }

    pub fn time_remaining(&self) -> Duration {
        critical_section::with(|cs| -> Duration {
            let state = self.state.borrow_ref(cs);
            let steps_remaining = (state.target_position - state.current_position).unsigned_abs();
            let dir = state.direction.value();

            if steps_remaining == 0 {
                return Duration::ZERO;
            }
            if state.leg_speed == 0.0 || state.leg_accel == 0.0 {
                return Duration::MAX;
            }
            // decelerating
            if (state.start_decel - state.current_position) * dir < 0 {
                return Duration::from_secs_f32(1.0 / (state.current_delay * state.leg_accel));
            }
            let mut duration = state.accel_dur;
            // cruising
            if (state.stop_accel - state.current_position) * dir < 0 {
                return Duration::from_secs_f32(
                    duration
                        + (state.start_decel - state.current_position).abs() as f32
                            / state.leg_speed,
                );
            }
            duration += (state.start_decel - state.stop_accel).abs() as f32 / state.leg_speed;
            // accelerating
            Duration::from_secs_f32(
                duration + (state.leg_speed - 1.0 / state.current_delay).max(0.0) / state.leg_accel,
            )
        })
    }

    pub fn set_home(&self) {
        critical_section::with(|cs| {
            let mut state = self.state.borrow_ref_mut(cs);
            state.current_position = 0;
            state.target_position = 0;
        });
    }

    pub fn initial_position(&self, pos: i64) {
        critical_section::with(|cs| {
            let mut state = self.state.borrow_ref_mut(cs);
            state.current_position = pos;
            state.target_position = pos;
        });
    }

    pub fn wait(&self) -> Result<(), String> {
        if self.steps_remaining() == 0 {
            return Ok(());
        }

        const SLEEP_MARGIN: Duration = Duration::from_millis(1);
        loop {
            let remaining = self.time_remaining();
            let sleep_time = (remaining * 3) / 4;
            if sleep_time < SLEEP_MARGIN {
                break;
            }
            std::thread::sleep(sleep_time);
        }
        loop {
            if self.steps_remaining() == 0 {
                break;
            }
        }
        Ok(())
    }

    pub fn leg_duration(steps: i64, speed: f32, accel: f32) -> (f32, f32) {
        let mut accel_steps = (speed.powi(2) / (2.0 * accel)) as i64;
        let accel_duration = if steps < 2 * accel_steps {
            accel_steps = steps / 2;
            (steps as f32 / accel).sqrt()
        } else {
            speed / accel
        };
        let total_duration = 2.0 * accel_duration + (steps - 2 * accel_steps) as f32 / speed;

        (total_duration, accel_duration)
    }
}
