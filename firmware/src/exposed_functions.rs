use anyhow::Result;
use esp_idf_svc::hal::gpio::{AnyOutputPin, Level, Output, OutputPin, PinDriver};
use esp_idf_svc::nvs::{self, EspDefaultNvs, EspDefaultNvsPartition};
use esp_idf_svc::sys::EspError;
use std::time::Duration;

use crate::stepper_group::{JointSpeed, StepperGroup};
use crate::{rpc, stepper};
use critical_section::Mutex;
use std::borrow::Borrow;
use std::cell::RefCell;
use std::cmp::Ordering;

#[derive(Debug, Default, Clone, Copy, PartialEq, Eq)]
enum CompensationType {
    #[default]
    None,
    Backlash,
    Hysteresis,
}
#[derive(Clone, Copy)]
struct CompensationControl<const COUNT: usize> {
    compensation_type: CompensationType,
    backlash: [i64; COUNT],
    hysteresis: [i64; COUNT],
    upper_end: [bool; COUNT],
}

impl<const COUNT: usize> Default for CompensationControl<COUNT> {
    fn default() -> Self {
        Self {
            compensation_type: CompensationType::None,
            backlash: [0; COUNT],
            hysteresis: [0; COUNT],
            upper_end: [false; COUNT],
        }
    }
}

struct ControlPins<'a> {
    en: PinDriver<'a, AnyOutputPin, Output>,
    // pdn: PinDriver<'a, AnyOutputPin, Output>,
    // ms1: PinDriver<'a, AnyOutputPin, Output>,
    // ms2: PinDriver<'a, AnyOutputPin, Output>,
}

const MOTOR_COUNT: usize = 4;
pub struct StepperBoard<'a> {
    control_pins: Mutex<RefCell<ControlPins<'a>>>,
    group: StepperGroup<'a, MOTOR_COUNT>,
    compensations: Mutex<RefCell<CompensationControl<MOTOR_COUNT>>>,
    timeout: Mutex<RefCell<Duration>>,
    nvs: EspDefaultNvs,
}

fn nvs_get_f32(nvs: &EspDefaultNvs, index: usize, key: &str, default: f32) -> Result<f32> {
    let val = nvs.get_u32(format!("s{index}.{key}").as_str())?;
    Ok(val.map(f32::from_bits).unwrap_or(default))
}

fn nvs_set_f32(nvs: &EspDefaultNvs, index: usize, key: &str, value: f32) -> Result<()> {
    nvs.set_u32(format!("s{index}.{key}").as_str(), value.to_bits())?;
    Ok(())
}

fn nvs_get_i64(nvs: &EspDefaultNvs, index: usize, key: &str, default: i64) -> Result<i64> {
    let val = nvs.get_i64(format!("s{index}.{key}").as_str())?;
    Ok(val.unwrap_or(default))
}

fn nvs_set_i64(nvs: &EspDefaultNvs, index: usize, key: &str, value: i64) -> Result<()> {
    nvs.set_i64(format!("s{index}.{key}").as_str(), value)?;
    Ok(())
}

impl<'a> StepperBoard<'a> {
    pub fn new(
        en: impl OutputPin,
        // pdn: impl OutputPin,
        // ms1: impl OutputPin,
        // ms2: impl OutputPin,
        mut stepper_group: StepperGroup<'a, MOTOR_COUNT>,
    ) -> Result<Self> {
        let nvs = EspDefaultNvs::new(EspDefaultNvsPartition::take()?, "steppers", true)?;

        let mut pins = ControlPins {
            en: PinDriver::output(en.downgrade_output())?,
            // pdn: PinDriver::output(pdn.downgrade_output())?,
            // ms1: PinDriver::output(ms1.downgrade_output())?,
            // ms2: PinDriver::output(ms2.downgrade_output())?,
        };
        pins.en.set_high()?;
        // pins.pdn.set_low()?;
        // pins.ms1
        //     .set_level((nvs.get_u32("ms1")?.unwrap_or(0) != 0).into())?;
        // pins.ms2
        //     .set_level((nvs.get_u32("ms2")?.unwrap_or(0) != 0).into())?;

        let mut comps: CompensationControl<MOTOR_COUNT> = CompensationControl::default();
        for (i, stepper) in stepper_group.steppers.iter_mut().enumerate() {
            stepper.set_max_speed(nvs_get_f32(&nvs, i, "max_speed", stepper.max_speed())?);
            stepper.set_max_accel(nvs_get_f32(&nvs, i, "max_accel", stepper.max_accel())?);
            stepper.initial_position(nvs_get_i64(&nvs, i, "position", 0)?);
            comps.backlash[i] = nvs_get_i64(&nvs, i, "backlash", 0)?;
            comps.hysteresis[i] = nvs_get_i64(&nvs, i, "hysteresis", 0)?;
            comps.upper_end[i] = nvs_get_i64(&nvs, i, "upper_end", 0)? != 0;
        }
        comps.compensation_type = match nvs.get_u32("comp_type")?.unwrap_or(0) {
            1 => CompensationType::Backlash,
            2 => CompensationType::Hysteresis,
            _ => CompensationType::None,
        };
        let timeout = Duration::from_secs(nvs.get_u64("timeout")?.unwrap_or(300));

        let mut board = Self {
            control_pins: Mutex::new(RefCell::new(pins)),
            group: stepper_group,
            compensations: Mutex::new(RefCell::new(comps)),
            timeout: Mutex::new(RefCell::new(timeout)),
            nvs,
        };
        Ok(board)
    }

    pub fn get_enabled(&self) -> bool {
        critical_section::with(|cs| {
            let control_pins = self.control_pins.borrow_ref(cs);
            control_pins.en.is_set_low()
        })
    }

    pub fn set_enabled(&self, enable: bool) -> Result<(), String> {
        critical_section::with(|cs| {
            let mut control_pins = self.control_pins.borrow_ref_mut(cs);
            if enable {
                control_pins.en.set_low()
            } else {
                control_pins.en.set_high()
            }
            .map_err(|e| e.to_string())
        })?;
        if !enable {
            self.group.stop();
            for (i, stepper) in self.group.steppers.iter().enumerate() {
                let position = stepper.position();
                nvs_set_i64(&self.nvs, i, "position", position).map_err(|e| e.to_string())?;
                nvs_set_i64(&self.nvs, i, "upper_end", 0).map_err(|e| e.to_string())?;
            }
        };
        Ok(())
    }

    pub fn get_timeout(&self) -> Duration {
        critical_section::with(|cs| *self.timeout.borrow_ref(cs))
    }
}

fn verify_index(index: usize, len: usize) -> Result<(), String> {
    if index >= len {
        return Err("Index out of bounds".to_string());
    }
    Ok(())
}

fn verify_vec<T: Default + Copy, const N: usize>(data: Vec<T>) -> Result<[T; N], String> {
    if data.len() > N {
        return Err("Too many elements".to_string());
    }
    let mut arr = [T::default(); N];
    for (i, d) in data.into_iter().enumerate() {
        arr[i] = d;
    }
    Ok(arr)
}

fn verify_speed(speed: f32) -> Result<f32, String> {
    if speed.is_finite() && speed > 0.0 {
        Ok(speed)
    } else {
        Err("Speed must be positive and finite".to_string())
    }
}

fn verify_accel(accel: f32) -> Result<f32, String> {
    if !accel.is_nan() && accel > 0.0 {
        Ok(accel)
    } else {
        Err("Acceleration must be positive and not NaN".to_string())
    }
}

fn ensure_no_compensation(board: &StepperBoard) -> Result<(), String> {
    let compensation_type =
        critical_section::with(|cs| board.compensations.borrow_ref_mut(cs).compensation_type);
    if compensation_type != CompensationType::None {
        return Err("Function not supported when compensation is active".to_string());
    }
    Ok(())
}

fn parse_speed(mode: &str, speed: f32) -> Result<JointSpeed, String> {
    match mode {
        "individual_max" => Ok(JointSpeed::IndividualMax),
        "joint_max" => Ok(JointSpeed::JointMax),
        "joint_euclid" => Ok(JointSpeed::JointEuclid(verify_speed(speed)?)),
        "joint_cheby" => Ok(JointSpeed::JointCheby(verify_speed(speed)?)),
        _ => Err("Invalid mode".to_string()),
    }
}

fn ensure_enabled(board: &StepperBoard) -> Result<(), String> {
    critical_section::with(|cs| {
        let control_pins = board.control_pins.borrow_ref(cs);
        if control_pins.en.is_set_low() {
            Ok(())
        } else {
            Err("Steppers are disabled".to_string())
        }
    })
}

pub fn init_stepper_rpc<'a, 'b, 'c, 'd>(
    board: &'b StepperBoard<'a>,
    dispatcher: &'d mut rpc::Dispatcher<'c>,
) -> Result<()>
where
    'b: 'c,
{
    // action functions
    let move_to = |index: usize, target: i64, speed: f32| -> Result<(), String> {
        ensure_enabled(board)?;
        verify_index(index, board.group.steppers.len())?;
        verify_speed(speed)?;

        let mut target = target;
        let mut compensation = critical_section::with(|cs| *board.compensations.borrow_ref(cs));
        let steppers = &board.group.steppers;

        match compensation.compensation_type {
            CompensationType::None => {}
            CompensationType::Backlash => {
                let position = steppers[index].position();
                let virtual_position =
                    position - compensation.backlash[index] * compensation.upper_end[index] as i64;
                match target.cmp(&virtual_position) {
                    Ordering::Less => compensation.upper_end[index] = false,
                    Ordering::Greater => {
                        target += compensation.backlash[index];
                        compensation.upper_end[index] = true
                    }
                    Ordering::Equal => {
                        target = position;
                    }
                }
                critical_section::with(|cs| {
                    *board.compensations.borrow_ref_mut(cs) = compensation;
                })
            }
            CompensationType::Hysteresis => {
                let mut pre_position = target;
                if target != steppers[index].position() {
                    pre_position -= compensation.hysteresis[index];
                }

                board.group.steppers[index].move_to(pre_position, Some(speed), None);
                board.group.steppers[index].wait()?;
            }
        }

        let dur = board.group.steppers[index].move_to(target, Some(speed), None);
        board.group.steppers[index].wait()?;
        Ok(())
    };
    dispatcher.register(rpc::handler!(move_to(index, target, sps)?));

    let wait = |index: usize| -> Result<(), String> {
        verify_index(index, board.group.steppers.len())?;
        board.group.steppers[index].wait()?;
        Ok(())
    };
    dispatcher.register(rpc::handler!(wait(index)));

    let set_target = |index: usize, target: i64, speed: f32| -> Result<f32, String> {
        ensure_enabled(board)?;
        ensure_no_compensation(board)?;
        verify_index(index, board.group.steppers.len())?;
        verify_speed(speed)?;
        let dur = board.group.steppers[index].move_to(target, Some(speed), None);
        Ok(dur.as_secs_f32())
    };
    dispatcher.register(rpc::handler!(set_target(index, target, sps)?));

    let stop = |index: usize| -> Result<(), String> {
        verify_index(index, board.group.steppers.len())?;
        board.group.steppers[index].stop();
        Ok(())
    };
    dispatcher.register(rpc::handler!(stop(index)?));

    let set_home = |index: usize| -> Result<(), String> {
        verify_index(index, board.group.steppers.len())?;
        board.group.steppers[index].set_home();
        Ok(())
    };
    dispatcher.register(rpc::handler!(set_home(index)?));

    // status functions
    let position = |index: usize| -> Result<i64, String> {
        verify_index(index, board.group.steppers.len())?;
        let compensation = critical_section::with(|cs| *board.compensations.borrow_ref(cs));
        let mut position = board.group.steppers[index].position();
        if compensation.compensation_type == CompensationType::Backlash
            && compensation.upper_end[index]
        {
            position -= compensation.backlash[index];
        }
        Ok(position)
    };
    dispatcher.register(rpc::handler!(position(index)?));

    let target = |index: usize| -> Result<i64, String> {
        ensure_no_compensation(board)?;
        verify_index(index, board.group.steppers.len())?;
        Ok(board.group.steppers[index].target())
    };
    dispatcher.register(rpc::handler!(target(index)?));

    let steps_remaining = |index: usize| -> Result<i64, String> {
        verify_index(index, board.group.steppers.len())?;
        Ok(board.group.steppers[index].steps_remaining())
    };
    dispatcher.register(rpc::handler!(steps_remaining(index)?));

    let time_remaining = |index: usize| -> Result<f32, String> {
        verify_index(index, board.group.steppers.len())?;
        Ok(board.group.steppers[index].time_remaining().as_secs_f32())
    };
    dispatcher.register(rpc::handler!(time_remaining(index)?));

    // stepper configuration functions
    let max_speed = |index: usize| -> Result<f32, String> {
        verify_index(index, board.group.steppers.len())?;
        Ok(board.group.steppers[index].max_speed())
    };
    dispatcher.register(rpc::handler!(max_speed(index)?));

    let set_max_speed = |index: usize, speed: f32| -> Result<(), String> {
        verify_index(index, board.group.steppers.len())?;
        verify_speed(speed)?;
        board.group.steppers[index].set_max_speed(speed);
        nvs_set_f32(&board.nvs, index, "max_speed", speed).map_err(|e| e.to_string())?;
        Ok(())
    };
    dispatcher.register(rpc::handler!(set_max_speed(index, speed)?));

    let max_accel = |index: usize| -> Result<f32, String> {
        verify_index(index, board.group.steppers.len())?;
        Ok(board.group.steppers[index].max_accel())
    };
    dispatcher.register(rpc::handler!(max_accel(index)?));

    let set_max_accel = |index: usize, accel: f32| -> Result<(), String> {
        verify_index(index, board.group.steppers.len())?;
        verify_accel(accel)?;
        board.group.steppers[index].set_max_accel(accel);
        nvs_set_f32(&board.nvs, index, "max_accel", accel).map_err(|e| e.to_string())?;
        Ok(())
    };
    dispatcher.register(rpc::handler!(set_max_accel(index, accel)?));

    // vector functions
    let move_to_vec = |targets: Vec<i64>, mode: String, speed: f32| -> Result<(), String> {
        ensure_enabled(board)?;
        let mut target_positions = verify_vec::<i64, 4>(targets)?;
        let joint_speed = parse_speed(&mode, speed)?;

        // board.compensations.
        let mut compensation = critical_section::with(|cs| *board.compensations.borrow_ref(cs));
        let steppers = &board.group.steppers;
        match compensation.compensation_type {
            CompensationType::None => {}
            CompensationType::Backlash => {
                for i in 0..MOTOR_COUNT {
                    let position = steppers[i].position();
                    let virtual_position =
                        position - compensation.backlash[i] * compensation.upper_end[i] as i64;
                    match target_positions[i].cmp(&virtual_position) {
                        Ordering::Less => compensation.upper_end[i] = false,
                        Ordering::Greater => {
                            target_positions[i] += compensation.backlash[i];
                            compensation.upper_end[i] = true
                        }
                        Ordering::Equal => {
                            target_positions[i] = position;
                        }
                    }
                }
                critical_section::with(|cs| {
                    *board.compensations.borrow_ref_mut(cs) = compensation;
                })
            }
            CompensationType::Hysteresis => {
                let mut pre_positions = target_positions;
                for i in 0..MOTOR_COUNT {
                    if target_positions[i] != steppers[i].position() {
                        pre_positions[i] -= compensation.backlash[i];
                    }
                }
                board.group.move_to(pre_positions, joint_speed);
                board.group.wait()?;
            }
        }
        board.group.move_to(target_positions, joint_speed);
        board.group.wait()?;
        Ok(())
    };
    dispatcher.register(rpc::handler!(move_to_vec(targets, mode, sps)?));

    let set_target_vec = |targets: Vec<i64>, mode: String, speed: f32| -> Result<f32, String> {
        ensure_enabled(board)?;
        ensure_no_compensation(board)?;
        let target_positions = verify_vec::<i64, 4>(targets)?;
        let duration = board
            .group
            .move_to(target_positions, parse_speed(&mode, speed)?);
        Ok(duration.as_secs_f32())
    };
    dispatcher.register(rpc::handler!(set_target_vec(targets, mode, sps)?));

    let wait_vec = || -> Result<(), String> {
        board.group.wait()?;
        Ok(())
    };
    dispatcher.register(rpc::handler!(wait_vec()));

    let stop_vec = || board.group.stop();
    dispatcher.register(rpc::handler!(stop_vec()));

    let set_home_vec = || {
        board.group.wait();
        for stepper in board.group.steppers.iter() {
            stepper.set_home();
        }
    };
    dispatcher.register(rpc::handler!(set_home_vec()));

    // vector status functions
    let position_vec = || -> [i64; 4] {
        let mut position = board.group.position();
        let compensation = critical_section::with(|cs| *board.compensations.borrow_ref(cs));
        for (i, pos) in position.iter_mut().enumerate().take(MOTOR_COUNT) {
            if compensation.compensation_type == CompensationType::Backlash
                && compensation.upper_end[i]
            {
                *pos -= compensation.backlash[i];
            }
        }
        position
    };
    dispatcher.register(rpc::handler!(position_vec()));

    let target_vec = || -> [i64; 4] { board.group.target() };
    dispatcher.register(rpc::handler!(target_vec()));

    let steps_remaining_vec = || -> [i64; 4] { board.group.steps_remaining() };
    dispatcher.register(rpc::handler!(steps_remaining_vec()));

    let time_remaining_vec = || -> f32 { board.group.time_remaining().as_secs_f32() };
    dispatcher.register(rpc::handler!(time_remaining_vec()));

    // vector stepper configuration functions
    let max_speed_vec = || -> [f32; 4] { board.group.max_speed() };
    dispatcher.register(rpc::handler!(max_speed_vec()));

    let max_accel_vec = || -> [f32; 4] { board.group.max_accel() };
    dispatcher.register(rpc::handler!(max_accel_vec()));

    // board configuration functions
    let enabled = || -> bool { board.get_enabled() };
    dispatcher.register(rpc::handler!(enabled()));

    let set_enabled = |enable: bool| -> Result<(), String> { board.set_enabled(enable) };
    dispatcher.register(rpc::handler!(set_enabled(enable)?));

    let microsteps = || -> Result<i32, String> {
        Err("Microstep setting can not be specified on this board!".to_string())
        // let (ms1, ms2) = critical_section::with(|cs| {
        //     let pins = board.control_pins.borrow_ref(cs);
        //     (pins.ms1.is_set_high(), pins.ms2.is_set_high())
        // });
        // match (ms2, ms1) {
        //     (false, true) => 2,
        //     (true, false) => 4,
        //     (false, false) => 8,
        //     (true, true) => 16,
        // }
    };
    dispatcher.register(rpc::handler!(microsteps()?));

    let set_microsteps = |microsteps: i32| -> Result<(), String> {
        Err("Microstep setting can not be specified on this board!".to_string())
        // let (ms1, ms2) = match microsteps {
        //     2 => (true, false),
        //     4 => (false, true),
        //     8 => (false, false),
        //     16 => (true, true),
        //     _ => return Err("Invalid microsteps".to_string()),
        // };
        // critical_section::with(|cs| -> Result<(), EspError> {
        //     let mut pins = board.control_pins.borrow_ref_mut(cs);
        //     pins.ms1.set_level(ms1.into())?;
        //     pins.ms2.set_level(ms2.into())?;
        //     Ok(())
        // })
        // .map_err(|e| e.to_string())?;
        // let err = board.nvs.set_u32("ms1", ms1 as u32);
        // err.map_err(|e| e.to_string())?;
        // let err = board.nvs.set_u32("ms2", ms2 as u32);
        // err.map_err(|e| e.to_string())?;
        // Ok(())
    };
    dispatcher.register(rpc::handler!(set_microsteps(microsteps)?));

    let timeout = || -> u64 { board.get_timeout().as_secs() };
    dispatcher.register(rpc::handler!(timeout()));

    let set_timeout = |timeout: u64| -> Result<(), String> {
        critical_section::with(|cs| {
            *board.timeout.borrow_ref_mut(cs) = Duration::from_secs(timeout);
        });
        board
            .nvs
            .set_u64("timeout", timeout)
            .map_err(|e| e.to_string())
    };
    dispatcher.register(rpc::handler!(set_timeout(timeout)?));

    // compensation functions
    let compensation = || -> String {
        critical_section::with(|cs| {
            let compensation = board.compensations.borrow_ref(cs);
            match compensation.compensation_type {
                CompensationType::None => "none".to_string(),
                CompensationType::Backlash => "backlash".to_string(),
                CompensationType::Hysteresis => "hysteresis".to_string(),
            }
        })
    };
    dispatcher.register(rpc::handler!(compensation()));

    let set_compensation = |compensation_type: String| -> Result<(), String> {
        let (compensation_type, disc) = match compensation_type.as_str() {
            "none" => (CompensationType::None, 0),
            "backlash" => (CompensationType::Backlash, 1),
            "hysteresis" => (CompensationType::Hysteresis, 2),
            _ => return Err("Invalid compensation type".to_string()),
        };
        critical_section::with(|cs| {
            let mut compensation = board.compensations.borrow_ref_mut(cs);
            compensation.compensation_type = compensation_type;
        });
        board
            .nvs
            .set_u32("comp_type", disc)
            .map_err(|e| e.to_string())
    };
    dispatcher.register(rpc::handler!(set_compensation(compensation_type)?));

    let backlash = |index: usize| -> Result<i64, String> {
        verify_index(index, MOTOR_COUNT)?;
        critical_section::with(|cs| {
            let compensation = board.compensations.borrow_ref(cs);
            Ok(compensation.backlash[index])
        })
    };
    dispatcher.register(rpc::handler!(backlash(index)?));

    let set_backlash = |index: usize, value: i64| -> Result<(), String> {
        verify_index(index, MOTOR_COUNT)?;
        critical_section::with(|cs| {
            let mut compensation = board.compensations.borrow_ref_mut(cs);
            compensation.backlash[index] = value;
        });
        nvs_set_i64(&board.nvs, index, "backlash", value).map_err(|e| e.to_string())?;
        Ok(())
    };
    dispatcher.register(rpc::handler!(set_backlash(index, value)?));

    let hysteresis = |index: usize| -> Result<i64, String> {
        verify_index(index, MOTOR_COUNT)?;
        critical_section::with(|cs| {
            let compensation = board.compensations.borrow_ref(cs);
            Ok(compensation.hysteresis[index])
        })
    };
    dispatcher.register(rpc::handler!(hysteresis(index)?));

    let set_hysteresis = |index: usize, value: i64| -> Result<(), String> {
        verify_index(index, MOTOR_COUNT)?;
        critical_section::with(|cs| {
            let mut compensation = board.compensations.borrow_ref_mut(cs);
            compensation.hysteresis[index] = value;
        });
        nvs_set_i64(&board.nvs, index, "hysteresis", value).map_err(|e| e.to_string())?;
        Ok(())
    };
    dispatcher.register(rpc::handler!(set_hysteresis(index, value)?));

    // this needs to be last
    let reset_config = || -> Result<(), String> {
        critical_section::with(|cs| -> Result<(), EspError> {
            let mut control_pins = board.control_pins.borrow_ref_mut(cs);
            control_pins.en.set_high()?;
            // control_pins.pdn.set_low()?;
            // control_pins.ms1.set_low()?;
            // control_pins.ms2.set_low()?;
            Ok(())
        })
        .map_err(|e| e.to_string())?;
        // board.nvs.set_u32("ms1", 0).map_err(|e| e.to_string())?;
        // board.nvs.set_u32("ms2", 0).map_err(|e| e.to_string())?;

        for i in 0..MOTOR_COUNT {
            let speed = stepper::Stepper::DEFAULT_MAX_SPEED;
            board.group.steppers[i].set_max_speed(speed);
            nvs_set_f32(&board.nvs, i, "max_speed", speed).map_err(|e| e.to_string())?;

            let accel = stepper::Stepper::DEFAULT_MAX_ACCEL;
            board.group.steppers[i].set_max_accel(accel);
            nvs_set_f32(&board.nvs, i, "max_accel", accel).map_err(|e| e.to_string())?;

            board.group.steppers[i].set_home();
            nvs_set_i64(&board.nvs, i, "position", 0).map_err(|e| e.to_string())?;

            critical_section::with(|cs| {
                let mut compensation = board.compensations.borrow_ref_mut(cs);
                compensation.backlash[i] = 0;
                compensation.hysteresis[i] = 0;
                compensation.upper_end[i] = false;
            });
            nvs_set_i64(&board.nvs, i, "backlash", 0).map_err(|e| e.to_string())?;
            nvs_set_i64(&board.nvs, i, "hysteresis", 0).map_err(|e| e.to_string())?;
            nvs_set_i64(&board.nvs, i, "upper_end", 0).map_err(|e| e.to_string())?;
        }
        critical_section::with(|cs| {
            let mut compensation = board.compensations.borrow_ref_mut(cs);
            compensation.compensation_type = CompensationType::None;
        });
        board
            .nvs
            .set_u32("comp_type", 0)
            .map_err(|e| e.to_string())?;

        board
            .nvs
            .set_u64("timeout", 300)
            .map_err(|e| e.to_string())?;

        Ok(())
    };
    dispatcher.register(rpc::handler!(reset_config()?));

    Ok(())
}
