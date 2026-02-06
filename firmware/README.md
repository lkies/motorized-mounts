# Firmware for Stepper Driver Board

The stepper driver board precisely generates the pulses and other electrical signals required to address the stepper drivers / stepsticks. It also handles backlash and hysteresis compensation.

## Flashing Pre-Compiled Firmware

1. Install [`esptool`](https://pypi.org/project/esptool/) for example using pip:

    ```shell
    pip install esptool
    ```

2. Erase the flash memory of the controller board using:

    ```shell
    esptool --chip esp32s3 erase_flash
    ```

    If you have multiple serial devices connected, you may also need to specify the port using `--port COM[X]` on Windows or `--port /dev/ttyUSB[X]` on Linux.

3. Flash the image using:

    ```shell
    esptool --chip esp32s3 write_flash 0x0 firmware.bin
    ```

    The same note about the port applies here as well.

## Building from Source

0. _Use Linux, don't try to do this on Windows. And if you plan on doing actual development work rather than building once, consider working on the WSL file system instead of Windows. This significantly reduce compile times._
1. Install the Rust toolchain with [rustup](https://rustup.rs/) or your system's package manager.
2. Install [espup](https://github.com/esp-rs/espup) as described in the guide. _Note: Since [`rust-toolchain.toml`](rust-toolchain.toml) overwrites the toolchain to `esp` (which is not installed at this point) you need to run `cargo install espup --locked` in a different directory or temperarily remove the `rust-toolchain.toml` file to be able to run cargo._
3. Install [espflash](https://crates.io/crates/espflash) and [ldproxy](https://crates.io/crates/ldproxy) with:

    ```shell
    cargo install espflash ldproxy
    ```

4. Build the firmware with:

    ```shell
    cargo build
    ```

    ... or flash and run it with:

    ```shell
    cargo run
    ```

    If you use WSL, you will need to forward the serial port to WSL with [usbipd](https://learn.microsoft.com/en-us/windows/wsl/connect-usb).

5. Optionally, make a flashable image by running:

    ```shell
    espflash save-image --chip esp32s3 target/xtensa-esp32s3-espidf/debug/stepper-driver-board firmware.bin --merge
    ```

    This will create a [`firmware.bin`](firmware.bin) file than can be flashed with [esptool](https://pypi.org/project/esptool/) later.
    Note that the paths assume that you are running this from the `firmware` directory.
