<a id="rpc"></a>

# rpc

Minimalist RPC implementation over a bidirectional line stream like a serial port or TCP socket

<a id="rpc.BidirectionalLineStream"></a>

## BidirectionalLineStream Objects

```python
class BidirectionalLineStream(ABC)
```

Abstract base class for a bidirectional line stream. Implementations should be able to read and write lines.

<a id="rpc.BidirectionalLineStream.read_line"></a>

#### read\_line

```python
@abstractmethod
def read_line() -> str
```

Read a line from the stream and return it as a string

**Returns**:

- `str` - The line read from the stream

<a id="rpc.BidirectionalLineStream.write_line"></a>

#### write\_line

```python
@abstractmethod
def write_line(line: str)
```

Write a line to the stream

<a id="rpc.BidirectionalLineStream.close"></a>

#### close

```python
@abstractmethod
def close()
```

Close the underlying transport

<a id="rpc.SerialBLS"></a>

## SerialBLS Objects

```python
class SerialBLS(BidirectionalLineStream)
```

A bidirectional line stream with a serial port as the backend

<a id="rpc.SerialBLS.__init__"></a>

#### \_\_init\_\_

```python
def __init__(serial_port: Serial, print_non_json=False)
```

Create a new SerialBLS instance from a serial port

**Arguments**:

- `serial_port` _Serial_ - The serial port to use
- `print_non_json` _bool, optional_ - Print non-json (non protocol) lines to stdout. Defaults to False.

<a id="rpc.SerialBLS.connect"></a>

#### connect

```python
@staticmethod
def connect(port: str, baudrate: int, print_non_json=False) -> Self
```

Connect to a serial port and return a SerialBLS instance

**Arguments**:

- `port` _str_ - The port to connect to
- `baudrate` _int_ - The baudrate to use
- `print_non_json` _bool, optional_ - Print non-json (non protocol) lines to stdout. Defaults to False.
  

**Returns**:

- `SerialBLS` - The SerialBLS instance

<a id="rpc.SocketBLS"></a>

## SocketBLS Objects

```python
class SocketBLS(BidirectionalLineStream)
```

A bidirectional line stream with a socket as the backend

<a id="rpc.SocketBLS.__init__"></a>

#### \_\_init\_\_

```python
def __init__(sock: socket.socket, print_non_json: bool = False)
```

Create a new SocketBLS instance from a socket

**Arguments**:

- `sock` _socket.socket_ - The socket to use
- `print_non_json` _bool, optional_ - Print non-json (non protocol) lines to stdout. Defaults to False.

<a id="rpc.SocketBLS.connect"></a>

#### connect

```python
@staticmethod
def connect(host: str, port: int, print_non_json: bool = False) -> Self
```

Connect to a socket and return a SocketBLS instance

**Arguments**:

- `host` _str_ - The host to connect to
- `port` _int_ - The port to connect to
- `print_non_json` _bool, optional_ - Print non-json (non protocol) lines to stdout. Defaults to False.
  

**Returns**:

- `SocketBLS` - The SocketBLS instance

<a id="rpc.RpcClient"></a>

## RpcClient Objects

```python
class RpcClient()
```

A client class over which to call procedures on a remote server

<a id="rpc.RpcClient.__init__"></a>

#### \_\_init\_\_

```python
def __init__(bls: BidirectionalLineStream)
```

Create a new RpcClient instance

**Arguments**:

- `bls` _BidirectionalLineStream_ - The bidirectional line stream to use

<a id="rpc.RpcClient.read_response"></a>

#### read\_response

```python
def read_response(id: int) -> dict
```

Read a response from the server (or from the internal response buffer) with the specified id

All other responses read while awaiting the specified id are stored internally

**Arguments**:

- `id` _int_ - The id of the response to read

<a id="rpc.RpcClient.call"></a>

#### call

```python
def call(method: str, *args) -> Any
```

Call a remote procedure with the specified method name and arguments

**Arguments**:

- `method` _str_ - The name of the method to call
- `*args` - The arguments to pass to the method
  

**Returns**:

- `Any` - The result of the remote procedure call
  

**Raises**:

- `ValueError` - If the remote procedure call server returns an error or the procedure errors

<a id="rpc.RpcClient.register"></a>

#### register

```python
def register(method: Callable) -> Callable
```

Wrap a stub method so that it is called remotely via this instance

Since this is a method that takes a function and returns a function, it can be used as a decorator.
The stub must have type hints for all arguments as true types and not strings.
The types will be checked when calling and the wrapped method will raise if the types are incorrect before attempting to call the remote procedure.
Generic aliases eg list[int] will only check the base type (list) and not the inner type (int).

**Arguments**:

- `method` _Callable_ - The method to wrap
  

**Returns**:

- `Callable` - The wrapped method

<a id="rpc.RpcProxy"></a>

## RpcProxy Objects

```python
class RpcProxy()
```

This class can be inherited from by a class made up of stub methods to wrap them for remote procedure calls

On initialization all methods that do not start with an underscore will be replaced by a wrapped version that calls the respective
method on the remote that is passed in the constructor.

<a id="rpc.RpcProxy.__init__"></a>

#### \_\_init\_\_

```python
def __init__(client: RpcClient)
```

Create a new RpcProxy instance

**Arguments**:

- `client` _RpcClient_ - The client to use for remote procedure calls

