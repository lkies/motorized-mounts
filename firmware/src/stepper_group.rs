use crate::stepper::Stepper;
use std::time::Duration;

pub struct StepperGroup<'a, const COUNT: usize> {
    pub steppers: [Stepper<'a>; COUNT],
}

#[derive(Clone, Copy)]
pub enum JointSpeed {
    IndividualMax,
    JointMax,
    JointEuclid(f32),
    JointCheby(f32),
}

impl<'a, const COUNT: usize> StepperGroup<'a, COUNT> {
    pub fn new(steppers: [Stepper<'a>; COUNT]) -> Self {
        Self { steppers }
    }

    fn get_member_arr<T: Default + Copy>(&self, func: impl Fn(&Stepper<'a>) -> T) -> [T; COUNT] {
        critical_section::with(|_cs| {
            let mut arr = [T::default(); COUNT];
            for (i, stepper) in self.steppers.iter().enumerate() {
                arr[i] = func(stepper)
            }
            arr
        })
    }

    pub fn position(&self) -> [i64; COUNT] {
        self.get_member_arr(Stepper::position)
    }

    pub fn target(&self) -> [i64; COUNT] {
        self.get_member_arr(Stepper::target)
    }

    pub fn max_speed(&self) -> [f32; COUNT] {
        self.get_member_arr(Stepper::max_speed)
    }

    pub fn max_accel(&self) -> [f32; COUNT] {
        self.get_member_arr(Stepper::max_accel)
    }

    fn move_helper(
        &self,
        target_positions: [i64; COUNT],
        joint_limit: Option<f32>,
        individual_limit: Option<f32>,
    ) -> Duration {
        let mut diffs = [0; COUNT];
        let positions = self.position();
        for i in 0..COUNT {
            diffs[i] = (target_positions[i] - positions[i]).abs();
        }

        let mut max_speeds = self.max_speed();
        if let Some(individual_limit) = individual_limit {
            for max_speed in max_speeds.iter_mut() {
                *max_speed = max_speed.min(individual_limit);
            }
        }

        let max_accels = self.max_accel();

        let euclidian_diff: f32 = (diffs.iter().map(|x| x.pow(2)).sum::<i64>() as f32).sqrt();
        let speed = joint_limit.unwrap_or(max_speeds.iter().map(|x| x * x).sum::<f32>().sqrt());

        // syncronize speeds
        let mut speeds = [0.0; COUNT];
        let mut overspeed_fraction = 1.0f32;
        for i in 0..COUNT {
            speeds[i] = speed * diffs[i] as f32 / euclidian_diff;
            overspeed_fraction = overspeed_fraction.max(speeds[i] / max_speeds[i])
        }
        for speed in speeds.iter_mut() {
            *speed /= overspeed_fraction;
        }

        // syncronize accels
        let mut min_acc_over_dist = f32::INFINITY;
        let mut acc_over_dists = [0.0; COUNT];
        for i in 0..COUNT {
            acc_over_dists[i] = max_accels[i] / diffs[i] as f32;
            min_acc_over_dist = min_acc_over_dist.min(acc_over_dists[i]);
        }
        let mut accels = [0.0; COUNT];
        for i in 0..COUNT {
            accels[i] = max_accels[i] * min_acc_over_dist / acc_over_dists[i];
        }

        self.move_simultaneus(&target_positions, &speeds, &accels)
    }

    pub fn move_simultaneus(
        &self,
        target_positions: &[i64; COUNT],
        speeds: &[f32; COUNT],
        accels: &[f32; COUNT],
    ) -> Duration {
        let mut max_duration = Duration::ZERO;
        for i in 0..COUNT {
            let dur =
                self.steppers[i].move_to(target_positions[i], Some(speeds[i]), Some(accels[i]));
            max_duration = max_duration.max(dur);
        }
        max_duration
    }

    pub fn move_to(&self, target_positions: [i64; COUNT], speed: JointSpeed) -> Duration {
        if target_positions == self.position() {
            return Duration::ZERO;
        }
        match speed {
            JointSpeed::IndividualMax => {
                self.move_simultaneus(&target_positions, &self.max_speed(), &self.max_accel())
            }
            JointSpeed::JointMax => self.move_helper(target_positions, None, None),
            JointSpeed::JointEuclid(speed) => self.move_helper(target_positions, Some(speed), None),
            JointSpeed::JointCheby(speed) => self.move_helper(target_positions, None, Some(speed)),
        }
    }

    pub fn wait(&self) -> Result<(), String> {
        for stepper in self.steppers.iter() {
            stepper.wait()?;
        }
        Ok(())
    }

    pub fn time_remaining(&self) -> Duration {
        critical_section::with(|_cs| {
            let mut max_time = Duration::ZERO;
            for stepper in self.steppers.iter() {
                let time = stepper.time_remaining();
                if time > max_time {
                    max_time = time;
                }
            }
            max_time
        })
    }

    pub fn steps_remaining(&self) -> [i64; COUNT] {
        critical_section::with(|_cs| {
            let mut steps = [0; COUNT];
            for (i, stepper) in self.steppers.iter().enumerate() {
                steps[i] = stepper.steps_remaining();
            }
            steps
        })
    }

    pub fn stop(&self) {
        critical_section::with(|_cs| {
            for stepper in self.steppers.iter() {
                stepper.stop();
            }
        });
    }
}
