use std::collections::HashMap;

#[derive(Debug, serde::Deserialize, serde::Serialize)]
struct Call {
    mrpc: String,
    call: String,
    args: serde_json::Value,
    id: u32,
}

#[derive(Debug, serde::Serialize, serde::Deserialize)]
struct Response {
    mrpc: String,
    result: serde_json::Value,
    id: u32,
}

#[derive(Debug, serde::Serialize, serde::Deserialize)]
struct Error {
    mrpc: String,
    error: serde_json::Value,
    id: u32,
}

impl Error {
    fn message(msg: &str, id: u32) -> Self {
        Error {
            mrpc: "1.0".to_string(),
            error: serde_json::json!({"message": msg}),
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
        if req.mrpc != "1.0" {
            return Some(
                serde_json::to_string(&Error::message("unsupported mrpc version", req.id)).unwrap(),
            );
        }
        let Some(handler) = self.handlers.get(&req.call) else {
            return Some(serde_json::to_string(&Error::message("unknown method", req.id)).unwrap());
        };
        match handler(req.args) {
            Ok(result) => match serde_json::to_string(&Response {
                mrpc: req.mrpc,
                result,
                id: req.id,
            }) {
                Ok(response) => Some(response),
                Err(_) => Some(
                    serde_json::to_string(&Error::message(
                        "response could not be serialized",
                        req.id,
                    ))
                    .unwrap(),
                ),
            },
            Err(e) => Some(
                serde_json::to_string(&Error::message(&format!("handler error: {}", e), req.id))
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
