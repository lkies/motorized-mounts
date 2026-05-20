use std::collections::HashMap;

#[derive(Debug, serde::Deserialize, serde::Serialize)]
struct Call {
    jsonrpc: String,
    method: String,
    params: serde_json::Value,
    id: u32,
}

#[derive(Debug, serde::Serialize, serde::Deserialize)]
struct Response {
    jsonrpc: String,
    result: serde_json::Value,
    id: u32,
}

#[derive(Debug, serde::Serialize, serde::Deserialize)]
struct Error {
    jsonrpc: String,
    error: serde_json::Value,
    id: u32,
}

impl Error {
    fn message(code: i32, msg: &str, id: u32) -> Self {
        Error {
            jsonrpc: "2.0".to_string(),
            error: serde_json::json!({"code": code, "message": msg}),
            id,
        }
    }
}

type RpcFunc<'a> = Box<dyn Fn(serde_json::Value) -> Result<serde_json::Value, String> + 'a>;

pub struct Dispatcher<'a> {
    handlers: HashMap<String, RpcFunc<'a>>,
}

impl<'a> Dispatcher<'a> {
    pub fn new() -> Self {
        Dispatcher {
            handlers: HashMap::new(),
        }
    }

    pub fn register(&mut self, handler: (String, RpcFunc<'a>)) {
        let (name, func) = handler;
        self.handlers.insert(name, func);
    }

    pub fn dispatch(&self, request: String) -> Option<String> {
        let req: Call = serde_json::from_str(&request).ok()?;
        if req.jsonrpc != "2.0" {
            return Some(
                serde_json::to_string(&Error::message(
                    -32600,
                    "unsupported jsonrpc version",
                    req.id,
                ))
                .unwrap(),
            );
        }
        let Some(handler) = self.handlers.get(&req.method) else {
            return Some(
                serde_json::to_string(&Error::message(-32601, "unknown method", req.id)).unwrap(),
            );
        };
        match handler(req.params) {
            Ok(result) => match serde_json::to_string(&Response {
                jsonrpc: req.jsonrpc,
                result,
                id: req.id,
            }) {
                Ok(response) => Some(response),
                Err(_) => Some(
                    serde_json::to_string(&Error::message(
                        -32603,
                        "response could not be serialized",
                        req.id,
                    ))
                    .unwrap(),
                ),
            },
            Err(e) => Some(
                serde_json::to_string(&Error::message(
                    1000,
                    &format!("handler error: {}", e),
                    req.id,
                ))
                .unwrap(),
            ),
        }
    }
}

macro_rules! handler {
    // without question mark
    ($name:expr, $func:ident()) => {(
        $name.to_string(),
        Box::new(move |_| {
            serde_json::to_value($func()).map_err(|e| e.to_string())
        }))
    };
    ($name:expr, $func:ident($arg:ident)) => {(
        $name.to_string(),
        Box::new(move |args| {
            let [$arg] = serde_json::from_value(args).map_err(|e| e.to_string())?;
            serde_json::to_value($func($arg)).map_err(|e| e.to_string())
        }))
    };
    ($name:expr, $func:ident($($arg:ident),*)) => {(
        $name.to_string(),
        Box::new(move |args| {
            let ($($arg),*) = serde_json::from_value(args).map_err(|e| e.to_string())?;
            serde_json::to_value($func($($arg),*)).map_err(|e| e.to_string())
        }))
    };
    ($func:ident($($arg:ident),*)) => {
        crate::rpc::handler!(stringify!($func), $func($($arg),*))
    };
    // without question mark for functions that return a result
    ($name:expr, $func:ident()?) => {(
        $name.to_string(),
        Box::new(move |_| {
            serde_json::to_value($func()?).map_err(|e| e.to_string())
        }))
    };
    ($name:expr, $func:ident($arg:ident)?) => {(
        $name.to_string(),
        Box::new(move |args| {
            let [$arg] = serde_json::from_value(args).map_err(|e| e.to_string())?;
            serde_json::to_value($func($arg)?).map_err(|e| e.to_string())
        }))
    };
    ($name:expr, $func:ident($($arg:ident),*)?) => {(
        $name.to_string(),
        Box::new(move |args| {
            let ($($arg),*) = serde_json::from_value(args).map_err(|e| e.to_string())?;
            serde_json::to_value($func($($arg),*)?).map_err(|e| e.to_string())
        }))
    };
    ($func:ident($($arg:ident),*)?) => {
        crate::rpc::handler!(stringify!($func), $func($($arg),*)?)
    };
}
pub(crate) use handler;
