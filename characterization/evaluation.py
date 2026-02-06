from dataclasses import dataclass
from functools import cached_property
from pathlib import Path
from typing import Callable, NamedTuple

import numpy as np
import pandas as pd
from lab_control import Measurement
from scipy import optimize, special, stats


@dataclass(frozen=True)
class CharacterizationMeasurement:
    file: Path
    _calibration_function: Callable[[float], float] | None = None

    @cached_property
    def name(self) -> str:
        return self.file.name.split("_")[0]

    @staticmethod
    def fix_glitch(df: pd.DataFrame, threshold_fraction: float = 0.025, max_samples: int = 5) -> None:
        min_val, max_val = df["qpd_voltage_mV"].min(), df["qpd_voltage_mV"].max()
        threshold = min_val + (max_val - min_val) * threshold_fraction
        col_index = df.columns.get_loc("qpd_voltage_mV")
        for i in reversed(range(max_samples)):
            if df.iloc[i, col_index] > threshold:
                df.iloc[i, col_index] = df.iloc[i + 1, col_index]

    @cached_property
    def measurement(self) -> Measurement:
        meas = Measurement.load(self.file)
        self.fix_glitch(meas.df)
        return meas

    @cached_property
    def num_cycles(self) -> int:
        return self.measurement.meta["user"]["cycles"]

    @cached_property
    def translation_to_angle(self) -> float:
        return 180 / np.pi / self.measurement.meta["user"]["calibration"]["mirror_lever_m"]

    @cached_property
    def input_to_angle(self) -> float:
        return self.measurement.meta["user"]["input_to_translation"] * self.translation_to_angle

    @cached_property
    def input_ptp(self) -> float:
        return np.ptp(self.df_aux["input_deg"])

    # auxiliary dataframe for intermediate calculations
    @cached_property
    def df_aux(self) -> pd.DataFrame:
        df = self.measurement.df.reset_index()
        assert len(df) % self.measurement.meta["user"]["cycles"] == 0

        samples_per_cycle = len(df) // self.num_cycles
        df["cycle"] = np.repeat(np.arange(self.num_cycles, dtype=int), samples_per_cycle)

        df["is_forward"] = np.diff(df["motor_input"], prepend=0) > 0
        df.loc[0, "is_forward"] = df.loc[df.index[-1], "is_forward"]

        df["input_deg"] = df["motor_input"] * self.input_to_angle
        return df

    @staticmethod
    def backlash_integral(inputs: np.ndarray, outputs: np.ndarray, num_cycles: int, raw_output=False) -> float:
        indices = np.arange(-1, len(inputs))
        integral = -np.trapezoid(outputs[indices], x=inputs[indices])
        if raw_output:
            return float(integral / np.ptp(outputs) / num_cycles)
        input_amplitude = np.ptp(inputs)
        return float(input_amplitude / 2 - np.sqrt(input_amplitude**2 / 4 - integral / num_cycles))

    @classmethod
    def remove_backlash(
        cls, df: pd.DataFrame, input_col: str, output_col: str, num_cycles: int, raw_output: bool = False
    ) -> pd.DataFrame:
        backlash = cls.backlash_integral(df[input_col].values, df[output_col].values, num_cycles, raw_output)

        res = pd.DataFrame(
            {
                input_col: np.where(df["is_forward"], df[input_col], df[input_col] + backlash),
                output_col: df[output_col],
                "is_forward": df["is_forward"],
                "cycle": df["cycle"],
            }
        )

        min_input = np.min(df[input_col])  # noqa: F841
        max_input = np.max(df[input_col])  # noqa: F841
        return res.query(
            f"({input_col} >= @min_input + @backlash) and is_forward or ({input_col} <= @max_input) and not is_forward"
        )

    @cached_property
    def calibration_function(self) -> Callable[[float], float]:
        if self._calibration_function is not None:
            return self._calibration_function

        without_backlash = self.remove_backlash(
            self.df_aux, "input_deg", "qpd_voltage_mV", self.num_cycles, raw_output=True
        )

        def fit_func(y, ys, y0, xs, x0):
            return xs * special.erfinv((y - y0) / ys) + x0

        x_scale = np.ptp(without_backlash["input_deg"])
        y_scale = np.ptp(without_backlash["qpd_voltage_mV"])

        params, _ = optimize.curve_fit(
            fit_func, without_backlash["qpd_voltage_mV"], without_backlash["input_deg"], p0=[y_scale, 0, x_scale, 0]
        )
        return lambda x: fit_func(x, *params)

    @cached_property
    def df_cal(self) -> pd.DataFrame:
        df = self.df_aux[["input_deg", "cycle", "is_forward"]].copy()
        df["output_deg"] = self.calibration_function(self.df_aux["qpd_voltage_mV"])
        return df

    @cached_property
    def df_comp(self) -> pd.DataFrame:
        return self.remove_backlash(self.df_cal, "input_deg", "output_deg", self.num_cycles)


class UncertainValue(NamedTuple):
    value: float
    lower: float
    upper: float
    confidence_interval: float

    def summary(self) -> str:
        return f"{self.value:.3e} ({self.confidence_interval*100:.1f}% CI: [{self.lower:.3e}, {self.upper:.3e}])"

    @property
    def max_deviation(self) -> float:
        return max(abs(self.value - self.lower), abs(self.value - self.upper))

    def __str__(self) -> str:
        exponent = int(np.floor(np.log10(np.abs(self.value))))
        factor = 10**exponent
        return f"({self.value/factor:.3f}±{self.max_deviation/factor:.3f})e{exponent}"

    def __mul__(self, value):
        return UncertainValue(
            value=self.value * value,
            lower=self.lower * value,
            upper=self.upper * value,
            confidence_interval=self.confidence_interval,
        )


@dataclass(frozen=True)
class Characterization:
    short_meas_file: Path
    long_meas_file: Path
    interval: float = 0.95
    confidence_interval: float = 0.95
    bootstrap_samples: int = 10000
    random_seed: int = 42

    @cached_property
    def short_meas(self) -> CharacterizationMeasurement:
        meas = CharacterizationMeasurement(self.short_meas_file, self.long_meas.calibration_function)
        assert meas.measurement.meta["user"]["meas_type"] == "short"
        return meas

    @cached_property
    def long_meas(self) -> CharacterizationMeasurement:
        meas = CharacterizationMeasurement(self.long_meas_file)
        assert meas.measurement.meta["user"]["meas_type"] == "long"
        return meas

    @cached_property
    def name(self) -> str:
        assert self.short_meas.name == self.long_meas.name
        return self.short_meas.name

    def quantile_interval_ptp(self, data: np.ndarray) -> float:
        lower, upper = np.quantile(data, [(1 - self.interval) / 2, 1 - (1 - self.interval) / 2])
        return upper - lower

    @staticmethod
    def segment_deviations(df: pd.DataFrame, evaluation_range: float) -> np.ndarray:
        min_in, max_in = -evaluation_range / 2, evaluation_range / 2
        segments = df.query(f"input_deg >= {min_in} and input_deg <= {max_in}").groupby(["cycle", "is_forward"])
        segment_residuals = []
        for _, segment in segments:
            mean = np.polynomial.Polynomial.fit(segment["input_deg"], segment["output_deg"], deg=1)
            segment_residuals.append(segment["output_deg"] - mean(segment["input_deg"]))
        return np.concatenate(segment_residuals)

    def bootstrap(self, data: np.ndarray, func: Callable[[np.ndarray], float]) -> UncertainValue:
        generator = np.random.default_rng(self.random_seed)
        value = func(data)
        bootstrapped_values = [
            func(generator.choice(data, size=len(data), replace=True)) for _ in range(self.bootstrap_samples)
        ]
        lower_bound, upper_bound = np.quantile(
            bootstrapped_values, [(1 - self.confidence_interval) / 2, 1 - (1 - self.confidence_interval) / 2]
        )
        return UncertainValue(
            value=value, lower=lower_bound, upper=upper_bound, confidence_interval=self.confidence_interval
        )

    def min_increment(self, evaluation_range: float) -> UncertainValue:
        residuals = self.segment_deviations(self.short_meas.df_comp, evaluation_range)
        return self.bootstrap(residuals, self.quantile_interval_ptp)

    def backlash(self, evaluation_range: float) -> UncertainValue:
        min_in, max_in = -evaluation_range / 2, evaluation_range / 2
        cycles = self.long_meas.df_cal.query(f"input_deg >= {min_in} and input_deg <= {max_in}").groupby("cycle")

        backlashes = [
            CharacterizationMeasurement.backlash_integral(cycle["input_deg"].values, cycle["output_deg"].values, 1)
            for _, cycle in cycles
        ]

        compensated_backlash = (
            self.long_meas.measurement.meta["user"]["compensated_backlash"] * self.long_meas.translation_to_angle
        )
        mean = np.mean(backlashes) + compensated_backlash
        n = len(backlashes)
        dev = stats.t.ppf((1 + self.confidence_interval) / 2, n - 1) * np.std(backlashes, ddof=1) / np.sqrt(n)
        return UncertainValue(
            value=mean, lower=mean - dev, upper=mean + dev, confidence_interval=self.confidence_interval
        )

    def nonlinearity(self, evaluation_range: float) -> UncertainValue:
        residuals = self.segment_deviations(self.long_meas.df_cal, evaluation_range)
        return self.bootstrap(residuals, self.quantile_interval_ptp)

    @staticmethod
    def gaussian_kernel_interpolator(x, y, bandwidth):
        return np.vectorize(
            lambda x_new: np.sum(y * np.exp(-((x_new - x) ** 2) / (2 * bandwidth**2)))
            / np.sum(np.exp(-((x_new - x) ** 2) / (2 * bandwidth**2)))
        )

    def backlash_variation(self, evaluation_range: float) -> UncertainValue:
        df_cal = self.long_meas.df_cal
        bandwidth = np.abs(np.mean(np.diff(df_cal["output_deg"]) * (-1) ** df_cal["is_forward"].iloc[1:]))

        def make_interpolator(df: pd.DataFrame, pred: str) -> Callable[[float], float]:
            values = df.query(pred)
            return self.gaussian_kernel_interpolator(values["input_deg"], values["output_deg"], bandwidth=bandwidth)

        forward_interpolator = make_interpolator(df_cal, "is_forward")
        backward_interpolator = make_interpolator(df_cal, "not is_forward")

        min_in, max_in = -evaluation_range / 2, evaluation_range / 2
        subset = df_cal.query(f"input_deg >= {min_in} and input_deg <= {max_in}")
        residuals = np.where(
            subset["is_forward"],
            subset["output_deg"] - forward_interpolator(subset["input_deg"]),
            subset["output_deg"] - backward_interpolator(subset["input_deg"]),
        )

        return self.bootstrap(residuals, self.quantile_interval_ptp)

    def unidirectional_repeatability(self, evaluation_range: float) -> UncertainValue:
        lower, upper = -evaluation_range / 2, evaluation_range / 2
        subset = self.long_meas.df_cal.query(f"input_deg >= {lower} and input_deg <= {upper}")

        deviations = []
        for _, group in subset.groupby(["input_deg", "is_forward"]):
            mean_output = group["output_deg"].mean()
            deviations.extend(group["output_deg"] - mean_output)

        return self.bootstrap(np.array(deviations), self.quantile_interval_ptp)

    def summary(self, short_evaluation_range: float, long_evaluation_range: float) -> dict:
        return {
            "name": self.name,
            "min_increment": self.min_increment(short_evaluation_range),
            "unidirectional_repeatability": self.unidirectional_repeatability(long_evaluation_range),
            "nonlinearity": self.nonlinearity(long_evaluation_range),
            "backlash": self.backlash(long_evaluation_range),
            "backlash_variation": self.backlash_variation(long_evaluation_range),
        }
