# Mechanical Designs for Motorized Mounts

This directory contains the CAD files for the mirror actuators. For completeness’ sake the four original designs are included here, but **it is recommended that you use the [`pancake-direct-v2`](pancake-direct-v2) design**.

## Designs

The available designs are:

- [`cheap-geared`](cheap-geared): Geared design using the 28BYJ48 "cheap stepper" motors with 1:3 gear reduction.
- [`cheap-direct`](cheap-direct): Direct drive design using the 28BYJ48 "cheap stepper" motors.
- [`pancake-geared`](pancake-geared): Geared design using the NEMA 14 "pancake" stepper motors with 1:3 gear reduction.
- [`pancake-direct`](pancake-direct): Direct drive design using the NEMA 14 "pancake" stepper motors.
- [**`pancake-direct-v2`**](pancake-direct-v2): Similar design to `pancake-direct` but optimized for easier printing and assembly.

<br>

![Mount Models](../images/models/models.drawio.png)

## Transmission Ratios

When using the driver board, we specify the desired position in terms of microsteps, even though what we really care about is the angle of the mirror. The final ratio $r$ between microsteps and mirror angle is the result of the proportionalities of all the individual parts:

$$r = r_d \cdot r_m \cdot r_g \cdot r_s \cdot r_l$$

Where:

- $r_d$ (unitless) is driver ratio or microstep setting, i.e., the number of full steps per pulse of the step pin.
- $r_m$ (unitless) is the motor ratio, i.e., the number of full steps per revolution of the motor shaft.
- $r_g$ (unitless) is the gear ratio, i.e., the number of revolutions of the adjustment screw per revolution of the motor shaft.
- $r_s$ (in $\text{m}$) is the screw pitch, i.e., the screw translation for one revolution.
- $r_l$ (in $\text{deg/m}$) is the lever ratio, i.e., the mirror rotation per unit of screw translation.

The values for these ratios for the different designs are as follows.

| Design | $r$ ($\text{µdeg/microstep}$) | $r_d$ | $r_m$ | $r_g$ | $r_s$ ($\text{µm}$) | $r_l$ ($\text{deg/mm}$) |
| - | - | - | - | - | - | - |
| `cheap-geared` | ~9.40 | 1/8 | 1/2048 | 1/3 | 250 |  ~1.85 |
| `cheap-direct` | ~28.2 | 1/8 | 1/2048 | 1 | 250 |  ~1.85 |
| `pancake-geared` | ~48.1 | 1/8 | 1/400 | 1/3 | 250 |  ~1.85 |
| `pancake-direct` | ~144 | 1/8 | 1/400 | 1 | 250 |  ~1.85 |

The microstep setting can easily be changed, but I kept it at 8 microsteps per full step. The mirror mounts used have a thread pitch of $250\text{ µm/rev}$, and the lever length of the mirror is also always $31\text{ mm}$. The motor ratio for the cheap stepper may depend on your model, some have a slightly different gearing, which differs by half a percent.

It is important to note that these numbers by themselves make no statement about the performance of the different designs. At best, they are an upper limit on the resolution, however, it is not of much consequence.
