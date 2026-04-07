<a id="serial_socket"></a>

# serial\_socket

Expose a serial device as a TCP socket.

<a id="serial_socket.SerialSocketBridge"></a>

## SerialSocketBridge Objects

```python
class SerialSocketBridge()
```

Bridge raw traffic between a serial port and TCP socket.

<a id="serial_socket.SerialSocketBridge.__init__"></a>

#### \_\_init\_\_

```python
def __init__(serial_port: str, baudrate: int, host: str, port: int)
```

Create a new SerialSocketBridge instance.

**Arguments**:

- `serial_port` _str_ - Serial device path, e.g. COM3 or /dev/ttyUSB0
- `baudrate` _int_ - Serial baudrate
- `host` _str_ - TCP host/interface to bind
- `port` _int_ - TCP port to bind

<a id="serial_socket.SerialSocketBridge.serve_forever"></a>

#### serve\_forever

```python
def serve_forever() -> NoReturn
```

Run the bridge server until interrupted.

<a id="serial_socket.main"></a>

#### main

```python
def main(argv: list[str] | None = None)
```

Entry point for the serial socket bridge CLI.

