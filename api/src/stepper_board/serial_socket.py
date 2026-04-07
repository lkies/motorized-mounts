"""Expose a serial device as a TCP socket."""

import argparse
import socket
import threading
from typing import NoReturn

from serial import Serial


class SerialSocketBridge:
    """Bridge raw traffic between a serial port and TCP socket."""

    def __init__(self, serial_port: str, baudrate: int, host: str, port: int):
        """Create a new SerialSocketBridge instance.

        Args:
            serial_port (str): Serial device path, e.g. COM3 or /dev/ttyUSB0
            baudrate (int): Serial baudrate
            host (str): TCP host/interface to bind
            port (int): TCP port to bind
        """
        self.serial_port = serial_port
        self.baudrate = baudrate
        self.host = host
        self.port = port

    def serve_forever(self) -> NoReturn:
        """Run the bridge server until interrupted."""
        with Serial(self.serial_port, self.baudrate, timeout=0.1) as serial_port:
            with socket.create_server((self.host, self.port), backlog=1, reuse_port=False) as server:
                print(f"Serial bridge active: {self.serial_port}@{self.baudrate} " f"-> tcp://{self.host}:{self.port}")
                server.settimeout(1.0)
                while True:
                    try:
                        conn, addr = server.accept()
                    except socket.timeout:
                        continue

                    print(f"Client connected: {addr[0]}:{addr[1]}")
                    try:
                        self._handle_client(serial_port, conn)
                    finally:
                        conn.close()
                        print("Client disconnected")

    def _handle_client(self, serial_port: Serial, conn: socket.socket):
        stop_event = threading.Event()

        serial_reader = threading.Thread(
            target=self._forward_serial_to_socket,
            args=(serial_port, conn, stop_event),
            daemon=True,
        )
        socket_reader = threading.Thread(
            target=self._forward_socket_to_serial,
            args=(serial_port, conn, stop_event),
            daemon=True,
        )

        serial_reader.start()
        socket_reader.start()

        serial_reader.join()
        stop_event.set()
        socket_reader.join(timeout=0.2)

    @staticmethod
    def _forward_serial_to_socket(serial_port: Serial, conn: socket.socket, stop_event: threading.Event):
        while not stop_event.is_set():
            chunk = serial_port.read(4096)
            if not chunk:
                continue
            try:
                conn.sendall(chunk)
            except OSError:
                stop_event.set()
                return

    @staticmethod
    def _forward_socket_to_serial(serial_port: Serial, conn: socket.socket, stop_event: threading.Event):
        while not stop_event.is_set():
            try:
                chunk = conn.recv(4096)
            except OSError:
                stop_event.set()
                return
            if chunk == b"":
                stop_event.set()
                return
            serial_port.write(chunk)
            serial_port.flush()


def main(argv: list[str] | None = None):
    """Entry point for the serial socket bridge CLI."""

    parser = argparse.ArgumentParser(description="Expose a serial device as a TCP socket.")
    parser.add_argument("serial_port", help="Serial device path, e.g. COM3 or /dev/ttyUSB0")
    parser.add_argument("--baudrate", type=int, default=115200, help="Serial baudrate (default: 115200)")
    parser.add_argument("--host", default="127.0.0.1", help="TCP host/interface to bind (default: 127.0.0.1)")
    parser.add_argument("--port", type=int, default=7000, help="TCP port to bind (default: 7000)")

    args = parser.parse_args(argv)
    bridge = SerialSocketBridge(
        serial_port=args.serial_port,
        baudrate=args.baudrate,
        host=args.host,
        port=args.port,
    )
    try:
        bridge.serve_forever()
    except KeyboardInterrupt:
        print("Shutting down serial bridge...")


if __name__ == "__main__":
    main()
