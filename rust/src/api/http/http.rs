use serde::{Deserialize, Serialize};
use wreq::Client;
use wreq_util::Emulation;

#[derive(Deserialize)]
pub struct RustHttpRequest {
    pub method: String,
    pub url: String,
    pub headers: Option<Vec<(String, String)>>,
    pub emulation: Option<Emulation>,
    pub body_bytes: Option<Vec<u8>>,
}

#[derive(Serialize)]
pub struct RustHttpResponse {
    pub status: u16,
    pub headers: Vec<(String, String)>,
    pub body: Vec<u8>,
}

pub async fn rust_http_request(req: RustHttpRequest) -> anyhow::Result<RustHttpResponse> {
    let client = if let Some(ref emu) = req.emulation {
        Client::builder().emulation(emu).build()?
    } else {
        Client::new()
    };

    let mut builder = client.request(req.method.parse()?, req.url);

    if let Some(headers) = &req.headers {
        for (k, v) in headers {
            builder = builder.header(k, v);
        }
    }

    if let Some(bytes) = &req.body_bytes {
        builder = builder.body(bytes.clone());
    }

    let res = builder.send().await?;
    let status = res.status().as_u16();
    let headers = res
        .headers()
        .iter()
        .map(|(k, v)| (k.to_string(), v.to_str().unwrap_or("").to_string()))
        .collect::<Vec<_>>();

    let body = res.bytes().await?.to_vec();

    Ok(RustHttpResponse {
        status,
        headers,
        body,
    })
}
