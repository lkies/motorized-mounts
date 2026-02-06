use anyhow::Result;
use std::time::Duration;

use esp_idf_svc::{hal::uart::UartDriver, io::Write};

pub struct UartLineDriver<'a> {
    uart: UartDriver<'a>,
    line: String,
}

impl<'a> UartLineDriver<'a> {
    pub fn new(uart: UartDriver<'a>) -> Self {
        Self {
            uart,
            line: String::new(),
        }
    }

    pub fn read_line(&mut self, timeout: Duration) -> Option<String> {
        let mut byte: [u8; 1] = [0; 1];
        let timeout_ticks = esp_idf_svc::hal::delay::TickType::from(timeout).ticks();
        loop {
            let res = self.uart.read(&mut byte, timeout_ticks);
            let Ok(num_bytes) = res else {
                return None;
            };
            if num_bytes == 0 {
                continue;
            }
            if byte[0] == b'\n' {
                let line = std::mem::take(&mut self.line);
                return Some(line);
            }
            self.line.push(byte[0] as char);
        }
    }

    pub fn write_line(&mut self, line: &str) -> Result<()> {
        self.uart.write_all(line.as_bytes())?;
        self.uart.write_all(b"\n")?;
        self.uart.flush()?;
        Ok(())
    }
}
