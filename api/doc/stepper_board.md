<a id="stepper_board"></a>

# stepper\_board

RPC stub class for the stepper driver board.

<a id="stepper_board.LARGE_FLOAT"></a>

#### LARGE\_FLOAT

Large "effectively infinite" float because json doesn't support inf

<a id="stepper_board.Number"></a>

#### Number

A number can be an int or a float

<a id="stepper_board.StepperBoard"></a>

## StepperBoard Objects

```python
class StepperBoard(rpc.RpcProxy)
```

<a id="stepper_board.StepperBoard.move_to"></a>

#### move\_to

```python
def move_to(index: int, target: int, speed: Number = LARGE_FLOAT) -> None
```

Move a stepper with given index to a target position at a given speed, blocking until the move is complete

**Arguments**:

- `index` _int_ - The index of the stepper to move
- `target` _int_ - The target position to move to
- `speed` _Number, optional_ - The speed to move at. Defaults to LARGE_FLOAT.

<a id="stepper_board.StepperBoard.wait"></a>

#### wait

```python
def wait(index: int) -> None
```

Wait for a stepper with given index to finish moving

**Arguments**:

- `index` _int_ - The index of the stepper to wait for

<a id="stepper_board.StepperBoard.set_target"></a>

#### set\_target

```python
def set_target(index: int, target: int, speed: Number = LARGE_FLOAT) -> None
```

Set the target position of a stepper with given index, non-blocking version of move_to

**Arguments**:

- `index` _int_ - The index of the stepper to set the target of
- `target` _int_ - The target position to set
- `speed` _Number, optional_ - The speed to move at. Defaults to LARGE_FLOAT.

<a id="stepper_board.StepperBoard.stop"></a>

#### stop

```python
def stop(index: int) -> None
```

Stop a stepper with given index

**Arguments**:

- `index` _int_ - The index of the stepper to stop

<a id="stepper_board.StepperBoard.set_home"></a>

#### set\_home

```python
def set_home(index: int) -> None
```

Set the current position of a stepper with given index as the home (zero) position

**Arguments**:

- `index` _int_ - The index of the stepper to set the home of

<a id="stepper_board.StepperBoard.position"></a>

#### position

```python
def position(index: int) -> int
```

Get the current position of a stepper with given index

**Arguments**:

- `index` _int_ - The index of the stepper to get the position of
  

**Returns**:

- `int` - The current position of the stepper

<a id="stepper_board.StepperBoard.target"></a>

#### target

```python
def target(index: int) -> int
```

Get the target position of a stepper with given index

**Arguments**:

- `index` _int_ - The index of the stepper to get the target of
  

**Returns**:

- `int` - The target position of the stepper

<a id="stepper_board.StepperBoard.steps_remaining"></a>

#### steps\_remaining

```python
def steps_remaining(index: int) -> int
```

Get the number of steps remaining for a stepper with given index to reach its target

**Arguments**:

- `index` _int_ - The index of the stepper to get the steps remaining of
  

**Returns**:

- `int` - The number of steps remaining for the stepper to reach its target

<a id="stepper_board.StepperBoard.time_remaining"></a>

#### time\_remaining

```python
def time_remaining(index: int) -> float
```

Get the approximate time remaining for a stepper with given index to reach its target

**Arguments**:

- `index` _int_ - The index of the stepper to get the time remaining of
  

**Returns**:

- `float` - The approximate time remaining for the stepper to reach its target, the time will sometimes be slightly overestimated

<a id="stepper_board.StepperBoard.max_speed"></a>

#### max\_speed

```python
def max_speed(index: int) -> float
```

Get the maximum speed of a stepper with given index

**Arguments**:

- `index` _int_ - The index of the stepper to get the maximum speed of
  

**Returns**:

- `float` - The maximum speed of the stepper

<a id="stepper_board.StepperBoard.set_max_speed"></a>

#### set\_max\_speed

```python
def set_max_speed(index: int, speed: Number) -> None
```

Set the maximum speed of a stepper with given index

**Arguments**:

- `index` _int_ - The index of the stepper to set the maximum speed of
- `speed` _Number_ - The maximum speed to set

<a id="stepper_board.StepperBoard.max_accel"></a>

#### max\_accel

```python
def max_accel(index: int) -> float
```

Get the maximum acceleration of a stepper with given index

**Arguments**:

- `index` _int_ - The index of the stepper to get the maximum acceleration of
  

**Returns**:

- `float` - The maximum acceleration of the stepper

<a id="stepper_board.StepperBoard.set_max_accel"></a>

#### set\_max\_accel

```python
def set_max_accel(index: int, speed: Number) -> None
```

Set the maximum acceleration of a stepper with given index

**Arguments**:

- `index` _int_ - The index of the stepper to set the maximum acceleration of
- `speed` _Number_ - The maximum acceleration to set

<a id="stepper_board.StepperBoard.move_to_vec"></a>

#### move\_to\_vec

```python
def move_to_vec(targets: list[int],
                mode: str,
                speed: Number = LARGE_FLOAT) -> None
```

Move all steppers to the given target positions at the given speed, blocking until all steppers have reached their targets

**Arguments**:

- `targets` _list[int]_ - The target positions to move to. If the list is shorter than the number of steppers the list will be padded with zeros
- `mode` _str_ - Joint movement mode:
  - "individual_max": Each stepper moves to its target at its maximum speed, the steppers generally finish at different times
  - "joint_max": The steppers speeds are adjusted so that the path is linearly interpolated and they all finish at the same time. The speed is determined by the max speed of the stepper that takes the longest time to reach its target.
  - "joint_euclid": The steppers speeds are adjusted so that the path is linearly interpolated and they all finish at the same time. The euclidean norm of the speeds must be specified.
  - "joint_cheby": The steppers speeds are adjusted so that the path is linearly interpolated and they all finish at the same time. The chebyshev norm (max of the absolute values) of the speeds must be specified.
- `speed` _Number, optional_ - Speed for "joint_euclid" and "joint_cheby" modes. Defaults to LARGE_FLOAT.

<a id="stepper_board.StepperBoard.wait_vec"></a>

#### wait\_vec

```python
def wait_vec() -> None
```

Wait for all steppers to finish moving

<a id="stepper_board.StepperBoard.set_target_vec"></a>

#### set\_target\_vec

```python
def set_target_vec(targets: list[int],
                   mode: str,
                   speed: Number = LARGE_FLOAT) -> None
```

Set the target positions of all steppers, non-blocking version of move_to_vec

**Arguments**:

- `targets` _list[int]_ - The target positions to set. If the list is shorter than the number of steppers the list will be padded with zeros
- `mode` _str_ - Joint movement mode:
  - "individual_max": Each stepper moves to its target at its maximum speed, the steppers generally finish at different times
  - "joint_max": The steppers speeds are adjusted so that the path is linearly interpolated and they all finish at the same time. The speed is determined by the max speed of the stepper that takes the longest time to reach its target.
  - "joint_euclid": The steppers speeds are adjusted so that the path is linearly interpolated and they all finish at the same time. The euclidean norm of the speeds must be specified.
  - "joint_cheby": The steppers speeds are adjusted so that the path is linearly interpolated and they all finish at the same time. The chebyshev norm (max of the absolute values) of the speeds must be specified.
- `speed` _Number, optional_ - Speed for "joint_euclid" and "joint_cheby" modes. Defaults to LARGE_FLOAT.

<a id="stepper_board.StepperBoard.stop_vec"></a>

#### stop\_vec

```python
def stop_vec() -> None
```

Stop all steppers

<a id="stepper_board.StepperBoard.set_home_vec"></a>

#### set\_home\_vec

```python
def set_home_vec() -> None
```

Set the current positions of all steppers as the home (zero) positions

<a id="stepper_board.StepperBoard.position_vec"></a>

#### position\_vec

```python
def position_vec() -> list[int]
```

Get the current positions of all steppers

**Returns**:

- `list[int]` - The current positions of all steppers

<a id="stepper_board.StepperBoard.target_vec"></a>

#### target\_vec

```python
def target_vec() -> list[int]
```

Get the target positions of all steppers

**Returns**:

- `list[int]` - The target positions of all steppers

<a id="stepper_board.StepperBoard.steps_remaining_vec"></a>

#### steps\_remaining\_vec

```python
def steps_remaining_vec() -> list[int]
```

Get the number of steps remaining for all steppers to reach their targets

**Returns**:

- `list[int]` - The number of steps remaining for all steppers to reach their targets

<a id="stepper_board.StepperBoard.time_remaining_vec"></a>

#### time\_remaining\_vec

```python
def time_remaining_vec() -> float
```

Get the approximate time remaining until all steppers reach their targets

**Returns**:

- `float` - The approximate time remaining until all steppers reach their targets, the time will sometimes be slightly overestimated

<a id="stepper_board.StepperBoard.max_speed_vec"></a>

#### max\_speed\_vec

```python
def max_speed_vec() -> list[float]
```

Get the maximum speeds of all steppers

**Returns**:

- `list[float]` - The maximum speeds of all steppers

<a id="stepper_board.StepperBoard.max_accel_vec"></a>

#### max\_accel\_vec

```python
def max_accel_vec() -> list[float]
```

Get the maximum accelerations of all steppers

**Returns**:

- `list[float]` - The maximum accelerations of all steppers

<a id="stepper_board.StepperBoard.enabled"></a>

#### enabled

```python
def enabled() -> bool
```

Query whether the physical stepper drivers (stepsticks) are enabled

If the drivers are disabled they will no longer drive any (holding) current. The stepper board will refuse to move the stepper until the drivers are enabled again.

**Returns**:

- `bool` - True if the drivers are enabled, False if they are disabled

<a id="stepper_board.StepperBoard.set_enabled"></a>

#### set\_enabled

```python
def set_enabled(enable: bool) -> None
```

Enable or disable the physical stepper drivers (stepsticks)

If the drivers are disabled they will no longer drive any (holding) current. The stepper board will refuse to move the stepper until the drivers are enabled again.

**Arguments**:

- `enable` _bool_ - True to enable the drivers, False to disable them

<a id="stepper_board.StepperBoard.microsteps"></a>

#### microsteps

```python
def microsteps() -> int
```

Get the number of microsteps per full step (step pulses required per full step) that the stepper drivers are currently configured for

**Returns**:

- `int` - The number of microsteps per full step

<a id="stepper_board.StepperBoard.set_microsteps"></a>

#### set\_microsteps

```python
def set_microsteps(microsteps: int) -> None
```

Set the number of microsteps per full step (step pulses required per full step) that the stepper drivers should be configured for

**Arguments**:

- `microsteps` _int_ - The number of microsteps per full step. Must be one of [2, 4, 8, 16]

<a id="stepper_board.StepperBoard.timeout"></a>

#### timeout

```python
def timeout() -> int
```

Get the auto-shutdown timeout in seconds, if the board receives no commands for this duration it will disable the stepper drivers

**Returns**:

- `int` - The auto-shutdown timeout in seconds, 0 means no timeout

<a id="stepper_board.StepperBoard.set_timeout"></a>

#### set\_timeout

```python
def set_timeout(timeout: int) -> None
```

Set the auto-shutdown timeout in seconds, if the board receives no commands for this duration it will disable the stepper drivers

**Arguments**:

- `timeout` _int_ - The auto-shutdown timeout in seconds, 0 means no timeout

<a id="stepper_board.StepperBoard.compensation"></a>

#### compensation

```python
def compensation() -> str
```

Get the current compensation type

The available compensation types are:
- "none": No compensation is applied
- "backlash": Backlash compensation is applied. When the stepper changes direction the stepper will add an additional number of steps to the target position according to the specified backlash value
- "hysteresis": Hysteresis compensation is applied. The driver will always approach the target position from a given offset determined by the specified hysteresis value

**Returns**:

- `str` - The current compensation type

<a id="stepper_board.StepperBoard.set_compensation"></a>

#### set\_compensation

```python
def set_compensation(compensation_type: str) -> None
```

Set the compensation type

The available compensation types are:
- "none": No compensation is applied
- "backlash": Backlash compensation is applied. When the stepper changes direction the stepper will add an additional number of steps to the target position according to the specified backlash value
- "hysteresis": Hysteresis compensation is applied. The driver will always approach the target position from a given offset determined by the specified hysteresis value

**Arguments**:

- `compensation_type` _str_ - The compensation type to set

<a id="stepper_board.StepperBoard.backlash"></a>

#### backlash

```python
def backlash(index: int) -> int
```

Get the backlash compensation value for a stepper with given index

**Arguments**:

- `index` _int_ - The index of the stepper to get the backlash compensation value of
  

**Returns**:

- `int` - The backlash compensation value

<a id="stepper_board.StepperBoard.set_backlash"></a>

#### set\_backlash

```python
def set_backlash(index: int, value: int) -> None
```

Set the backlash compensation value for a stepper with given index

**Arguments**:

- `index` _int_ - The index of the stepper to set the backlash compensation value of
- `value` _int_ - The backlash compensation value to set

<a id="stepper_board.StepperBoard.hysteresis"></a>

#### hysteresis

```python
def hysteresis(index: int) -> int
```

Get the hysteresis compensation value for a stepper with given index

**Arguments**:

- `index` _int_ - The index of the stepper to get the hysteresis compensation value of
  

**Returns**:

- `int` - The hysteresis compensation value

<a id="stepper_board.StepperBoard.set_hysteresis"></a>

#### set\_hysteresis

```python
def set_hysteresis(index: int, value: int) -> None
```

Set the hysteresis compensation value for a stepper with given index

**Arguments**:

- `index` _int_ - The index of the stepper to set the hysteresis compensation value of
- `value` _int_ - The hysteresis compensation value to set

<a id="stepper_board.StepperBoard.reset_config"></a>

#### reset\_config

```python
def reset_config() -> None
```

Reset the configuration of the stepper board to default values

