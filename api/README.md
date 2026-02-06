# Stepper Driver Board API

The driver board is controlled via a minimalistic JSON based remote procedure call (RPC) protocol.

You can install the package directly from this repository using PIP:

```bash
pip install git+https://github.com/lokies/motorized-mounts.git#subdirectory=api
```

The full API documentation for the stepper driver board is described in the [`stepper_board`](doc/stepper_board.md) module documentation. The RPC internals are described in the [`rpc`](doc/rpc.md) module.

## Connecting to the Board

The board is controlled through a [`StepperBoard`](doc/stepper_board.md#stepper_board.StepperBoard) instance. These need to be initialized with an [`RpcClient`](doc/rpc.md#rpc.RpcClient), which in turn needs to be initialized with a transport, like a [`SerialBLS`](doc/rpc.md#rpc.SerialBLS) or a [`SocketBLS`](doc/rpc.md#rpc.SocketBLS) instance. Since the board uses serial, we use a `SerialBLS`:

```python
from src.stepper_board import StepperBoard, RpcClient, SerialBLS

bls = SerialBLS.connect("COM3", 115200)
steppers = StepperBoard(RpcClient(bls))
# do stuff with the steppers...
bls.close()
```

The `SerialBLS` can also be used as a context manager to automatically close the wrapped serial port when done:

```python
with SerialBLS.connect("COM3", 115200) as bls:
    steppers = StepperBoard(RpcClient(bls))
    # do stuff with the steppers...
```

## Enabling the Stepper Drivers

The stepsticks plugged into the board all have an enable pin, which can be controlled with the [`set_enabled(enabled)`](doc/stepper_board.md#stepper_board.StepperBoard.set_enabled) method. When disabled, the drivers will not output any current through the motors. Conversely, if they are enabled, even if they are not moving, the drivers will still output the full current (or a reduced current if they have a power-down feature like the TMC2208s) to hold the motor in place. To prevent excessive heating of the motors and drivers and lengthen their lifespan, it is therefore recommended to shut them off when they are not needed.

To prevent accidental damage to the motors due to bad driver settings and overheating, the driver board will automatically disable the drivers after receiving no command for some time, the default is 300 seconds. The timeout can be changed with the [`set_timeout(timeout)`](doc/stepper_board.md#stepper_board.StepperBoard.set_timeout) method or disabled entirely by setting the timeout to zero. The current timeout and whether the steppers are enabled can be queried with the [`timeout()`](doc/stepper_board.md#stepper_board.StepperBoard.timeout) and [`enabled()`](doc/stepper_board.md#stepper_board.StepperBoard.enabled) methods.

When the motors are disabled, the driver board will store the current position of the steppers to non-volatile memory so the steppers do not lose their position when turned off.

## Movement Commands

There are multiple movement commands available to set the steppers position.

The simplest one is [`move_to(index, position, speed=MAX_SPEED)`](doc/stepper_board.md#stepper_board.StepperBoard.move_to), which moves a single stepper to a specific position in microsteps. As an optional third parameter, you can specify the speed in units of microsteps per second. If the speed is not specified or set larger than the allowed maximum speed, the stepper will move at its configured maximum speed.

To move multiple steppers at the same time, you can use the [`move_to_vec(positions, speed_mode, speed=MAX_SPEED)`](doc/stepper_board.md#stepper_board.StepperBoard.move_to_vec) method. The positions must be a list of the desired positions in microsteps. If fewer than four positions are specified, the remaining positions will be set to zero. The available speed modes are:

- `"individual_max"`: Each stepper moves at its own maximum speed.
- `"joint_max"`: The speeds of the steppers are adjusted so that they all finish at the same time, the speed is determined by the maximum speed of the stepper that takes the longest time to reach its target.
- `"joint_euclid"`: The speeds of the steppers are adjusted so that they all finish at the same time, the euclidean norm of the speeds must be specified in the `speed` parameter.
- `"joint_cheby"`: The speeds of the steppers are adjusted so that they all finish at the same time, the chebyshev norm (max of the absolute values) of the speeds must be specified in the `speed` parameter.

Both of these functions are blocking, i.e., they will only return once the steppers have reached their target positions.

Alternatively, the movement can be controlled asynchronously using the [`set_target(...)`](doc/stepper_board.md#stepper_board.StepperBoard.set_target) and [`set_target_vec(...)`](doc/stepper_board.md#stepper_board.StepperBoard.set_target_vec) functions in combination with [`wait(...)`](doc/stepper_board.md#stepper_board.StepperBoard.wait), [`wait_vec()`](doc/stepper_board.md#stepper_board.StepperBoard.wait_vec), [`stop(...)`](doc/stepper_board.md#stepper_board.StepperBoard.stop), [`stop_vec()`](doc/stepper_board.md#stepper_board.StepperBoard.stop_vec), [`steps_remaining(...)`](doc/stepper_board.md#stepper_board.StepperBoard.steps_remaining) [`steps_remaining_vec()`](doc/stepper_board.md#stepper_board.StepperBoard.steps_remaining_vec), [`time_remaining(...)`](doc/stepper_board.md#stepper_board.StepperBoard.time_remaining) and [`time_remaining_vec()`](doc/stepper_board.md#stepper_board.StepperBoard.time_remaining_vec) functions. **But note that when using these asynchronous functions, you can not use backlash or hysteresis compensation.**

## Configuration

The maximum motor speed and acceleration can be configured with the [`set_max_speed(index, speed)`](doc/stepper_board.md#stepper_board.StepperBoard.set_max_speed) and [`set_max_accel(index, accel)`](doc/stepper_board.md#stepper_board.StepperBoard.set_max_accel) methods. The maximum speed is specified in microsteps per second, and the acceleration in microsteps per second squared. The current maximum speed and acceleration can be queried with the [`max_speed(index)`](doc/stepper_board.md#stepper_board.StepperBoard.max_speed) and [`max_accel(index)`](doc/stepper_board.md#stepper_board.StepperBoard.max_accel) or [`max_speed_vec()`](doc/stepper_board.md#stepper_board.StepperBoard.max_speed_vec) and [`max_accel_vec()`](doc/stepper_board.md#stepper_board.StepperBoard.max_accel_vec) methods.

The speed is specified in microsteps per second, and the acceleration in microsteps per second squared.

The maximum speed and acceleration that a motor can be driven at before it starts losing steps depends on many factors. These include the motor itself, the load and load inertia, the supply voltage, the maximum drive current, and a few more.

To find the maximum speed, set the motor to a safe low acceleration and increase the speed until the motor starts losing steps. Then set the speed to a slightly lower value to allow for some margin. To find the maximum acceleration set the motor to the highest speed that it can reliably reach and increase the acceleration until the motor starts losing steps. Then, again, set the acceleration to a slightly lower value to allow for some margin.

## Backlash and Hysteresis Compensation

The driver board can be run in backlash or hysteresis compensation mode, which can be enabled with the [`set_compensation(mode)`](doc/stepper_board.md#stepper_board.StepperBoard.set_compensation) method, where mode is either `"backlash"`, `"hysteresis"` or `"none"`. For backlash compensation, backlash needs to be specified for each stepper with the [`set_backlash(index, steps)`](doc/stepper_board.md#stepper_board.StepperBoard.set_backlash) method, where steps is the backlash in microsteps. For hysteresis compensation, the hysteresis compensation needs to be specified for each stepper with the [`set_hysteresis(index, steps)`](doc/stepper_board.md#stepper_board.StepperBoard.set_hysteresis) method, where steps is the step offset in microsteps that the final position should be approached from. The compensation can only be set for all steppers at the same time. The current compensation mode, backlash, and hysteresis settings can be queried with the [`compensation()`](doc/stepper_board.md#stepper_board.StepperBoard.compensation), [`backlash(index)`](doc/stepper_board.md#stepper_board.StepperBoard.backlash,) and [`hysteresis(index)`](doc/stepper_board.md#stepper_board.StepperBoard.hysteresis) methods.

## Other Functions

The current position and target can be queried with the [`position(index)`](doc/stepper_board.md#stepper_board.StepperBoard.position) and [`target(index)`](doc/stepper_board.md#stepper_board.StepperBoard.target) methods or their vector equivalents [`position_vec()`](doc/stepper_board.md#stepper_board.StepperBoard.position_vec) and [`target_vec()`](doc/stepper_board.md#stepper_board.StepperBoard.target_vec).

The stored position of a single stepper, or all steppers at once, can be reset to zero with the [`set_home(index)`](doc/stepper_board.md#stepper_board.StepperBoard.set_home) and [`set_home_vec()`](doc/stepper_board.md#stepper_board.StepperBoard.set_home_vec) methods.

Finally, the configuration can be reset to the firmware defaults with the [`reset_config()`](doc/stepper_board.md#stepper_board.StepperBoard.reset_config) method.
