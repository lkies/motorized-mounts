#![allow(unused)]

use anyhow::Result;
use esp_idf_svc::hal::gpio::AnyIOPin;
use esp_idf_svc::hal::gpio::OutputPin;
use esp_idf_svc::hal::peripherals::Peripherals;
use esp_idf_svc::hal::task::thread;
use esp_idf_svc::hal::uart::UartDriver;
use esp_idf_svc::io::vfs::BlockingStdIo;
use esp_idf_svc::io::Read;
use esp_idf_svc::io::Write;
use esp_idf_svc::timer::EspTimer;
use esp_idf_svc::timer::EspTimerService;
use std::io::BufRead;
use std::time::Duration;
use tokio::io::AsyncBufReadExt;

mod exposed_functions;
mod rpc;
mod serial;
mod stepper;
mod stepper_group;
use stepper::Stepper;

static ESP_TIME: esp_idf_svc::systime::EspSystemTime = esp_idf_svc::systime::EspSystemTime {};

fn main() -> Result<()> {
    // It is necessary to call this function once. Otherwise some patches to the runtime
    // implemented by esp-idf-sys might not link properly. See https://github.com/esp-rs/esp-idf-template/issues/71
    esp_idf_svc::sys::link_patches();

    // Bind the log crate to the ESP Logging facilities
    esp_idf_svc::log::EspLogger::initialize_default();

    let peripherals = Peripherals::take()?;

    macro_rules! out {
        ($pin:ident) => {
            peripherals.pins.$pin.downgrade_output()
        };
    }

    let min_delay = Duration::from_micros(150);
    let timer_service = EspTimerService::new()?;

    let mut board = exposed_functions::StepperBoard::new(
        out!(gpio8),
        // out!(gpio12),
        // out!(gpio11),
        // out!(gpio47),
        stepper_group::StepperGroup::new([
            Stepper::new(out!(gpio16), out!(gpio15), &timer_service)?,
            Stepper::new(out!(gpio7), out!(gpio6), &timer_service)?,
            Stepper::new(out!(gpio5), out!(gpio4), &timer_service)?,
            Stepper::new(out!(gpio20), out!(gpio19), &timer_service)?,
        ]),
    )?;

    let mut dispatcher = rpc::Dispatcher::new();

    exposed_functions::init_stepper_rpc(&board, &mut dispatcher)?;

    let mut uart_driver = UartDriver::new(
        peripherals.uart0,
        peripherals.pins.gpio43,
        peripherals.pins.gpio44,
        Option::<AnyIOPin>::None,
        Option::<AnyIOPin>::None,
        &Default::default(),
    )?;

    let mut uart_line_driver = serial::UartLineDriver::new(uart_driver);
    let mut last_command = ESP_TIME.now();

    loop {
        let res = uart_line_driver.read_line(Duration::from_secs(1));
        let Some(command) = res else {
            let timeout = board.get_timeout();
            if !timeout.is_zero() && ESP_TIME.now() - last_command >= timeout && board.get_enabled()
            {
                // only disable if currently enabled, since disabling writes to nvs
                // and we don't want to do that every second when its not necessary
                board.set_enabled(false).unwrap();
            }
            continue;
        };
        last_command = ESP_TIME.now();
        log::info!("Read: {}", command);
        let res = dispatcher.dispatch(command);
        if let Some(res) = res {
            uart_line_driver.write_line(&res)?;
        }
    }
    Ok(())
}
