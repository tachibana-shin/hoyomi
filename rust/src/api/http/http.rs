use std::net::SocketAddr;
use std::{str::FromStr, sync::Arc};

use crate::api::http::utils::socket_addr::SocketAddrDigester;

use chrono::Duration;
use flutter_rust_bridge::{frb, DartFnFuture};
use wreq::dns::{Addrs, Name, Resolve, Resolving};
use wreq::redirect::Policy;
use wreq::tls::Certificate;
use wreq::{tls, CertStore};
use wreq::{Client, ClientBuilder, Proxy, Version};
use wreq_util::Emulation as rEmulation;

use crate::api::http::error::HttpError;

macro_rules! emulation_mapping {
    (
        $dto_name:ident => $target_name:ident {
            $($variant:ident),* $(,)?
        }
    ) => {
        #[derive(Debug, Clone, PartialEq, Eq)]
        pub enum $dto_name {
            $( $variant ),*
        }

        impl From<$dto_name> for $target_name {
            fn from(dto: $dto_name) -> Self {
                match dto {
                    $( $dto_name::$variant => $target_name::$variant ),*
                }
            }
        }
    };
}

emulation_mapping! {
    Emulation => rEmulation {
        Chrome100,
        Chrome101,
        Chrome104,
        Chrome105,
        Chrome106,
        Chrome107,
        Chrome108,
        Chrome109,
        Chrome110,
        Chrome114,
        Chrome116,
        Chrome117,
        Chrome118,
        Chrome119,
        Chrome120,
        Chrome123,
        Chrome124,
        Chrome126,
        Chrome127,
        Chrome128,
        Chrome129,
        Chrome130,
        Chrome131,
        Chrome132,
        Chrome133,
        Chrome134,
        Chrome135,
        Chrome136,

        SafariIos17_2,
        SafariIos17_4_1,
        SafariIos16_5,
        Safari15_3,
        Safari15_5,
        Safari15_6_1,
        Safari16,
        Safari16_5,
        Safari17_0,
        Safari17_2_1,
        Safari17_4_1,
        Safari17_5,
        Safari18,
        SafariIPad18,
        Safari18_2,
        SafariIos18_1_1,
        Safari18_3,
        Safari18_3_1,
        OkHttp3_9,
        OkHttp3_11,
        OkHttp3_13,
        OkHttp3_14,
        OkHttp4_9,
        OkHttp4_10,
        OkHttp4_12,
        OkHttp5,
        Edge101,
        Edge122,
        Edge127,
        Edge131,
        Edge134,
        Firefox109,
        Firefox117,
        Firefox128,
        Firefox133,
        Firefox135,
        FirefoxPrivate135,
        FirefoxAndroid135,
        Firefox136,
        FirefoxPrivate136,
    }
}

struct StaticResolver {
    address: SocketAddr,
}

impl Resolve for StaticResolver {
    fn resolve(&self, _: Name) -> Resolving {
        let addrs: Addrs = Box::new(vec![self.address].clone().into_iter());
        Box::pin(futures_util::future::ready(Ok(addrs)))
    }
}

struct DynamicResolver {
    resolver: Arc<dyn Fn(String) -> DartFnFuture<Vec<String>> + 'static + Send + Sync>,
}

impl Resolve for DynamicResolver {
    fn resolve(&self, name: Name) -> Resolving {
        let resolver = self.resolver.clone();
        Box::pin(async move {
            let ip = resolver(name.as_str().to_owned()).await;
            let ip = ip
                .into_iter()
                .map(|ip| {
                    let ip_digested = ip.digest_ip();
                    SocketAddr::from_str(ip_digested.as_str()).map_err(|e| {
                        HttpError::HttpUnknownError(format!(
                            "Invalid IP address: {ip_digested}. {e:?}"
                        ))
                    })
                })
                .filter_map(Result::ok)
                .collect::<Vec<SocketAddr>>();

            let addrs: Addrs = Box::new(ip.into_iter());

            Ok(addrs)
        })
    }
}

pub enum ProxySettings {
    NoProxy,
    CustomProxyList(Vec<CustomProxy>),
}

pub struct CustomProxy {
    pub url: String,
    pub condition: ProxyCondition,
}

pub enum ProxyCondition {
    Http,
    Https,
    All,
}

pub enum RedirectSettings {
    NoRedirect,
    LimitedRedirects(i32),
}

pub struct TimeoutSettings {
    pub timeout: Option<Duration>,
    pub connect_timeout: Option<Duration>,
    pub keep_alive_timeout: Option<Duration>,
    pub keep_alive_ping: Option<Duration>,
}

pub struct TlsSettings {
    pub trust_root_certificates: bool,
    pub trusted_root_certificates: Vec<Vec<u8>>,
    pub verify_certificates: bool,
    pub min_tls_version: Option<TlsVersion>,
    pub max_tls_version: Option<TlsVersion>,
    pub sni: bool,
}

pub struct DnsSettings {
    pub overrides: Option<Vec<(String, Vec<String>)>>,
    pub fallback: Option<String>,
    pub resolver: Option<Arc<dyn Fn(String) -> DartFnFuture<Vec<String>> + 'static + Send + Sync>>,
}

pub enum TlsVersion {
    Tls1_2,
    Tls1_3,
}

#[derive(Clone, Copy)]
pub enum HttpVersionPref {
    Http10,
    Http11,
    Http2,
    All,
}

pub struct RustHttpRequest {
    pub method: String,
    pub url: String,
    pub headers: Option<Vec<(String, String)>>,
    pub emulation: Option<Emulation>,
    pub redirect_settings: Option<RedirectSettings>,
    pub body_bytes: Option<Vec<u8>>,

    pub http_version_pref: Option<HttpVersionPref>,
    pub timeout_settings: Option<TimeoutSettings>,
    pub throw_on_status_code: Option<bool>,
    pub proxy_settings: Option<ProxySettings>,
    pub tls_settings: Option<TlsSettings>,
    pub dns_settings: Option<DnsSettings>,
    pub user_agent: Option<String>,
}

pub struct RustHttpResponse {
    pub status: u16,
    pub headers: Vec<(String, String)>,
    pub body: Vec<u8>,
}

#[frb()]
pub async fn rust_http_request(req: RustHttpRequest) -> anyhow::Result<RustHttpResponse> {
    let mut client: ClientBuilder = Client::builder();
    if let Some(emu) = req.emulation {
        let emulation: rEmulation = emu.into();
        client = client.emulation(emulation);
    };

    if let Some(proxy_settings) = req.proxy_settings {
        match proxy_settings {
            ProxySettings::NoProxy => client = client.no_proxy(),
            ProxySettings::CustomProxyList(proxies) => {
                for proxy in proxies {
                    let proxy = match proxy.condition {
                        ProxyCondition::Http => Proxy::http(&proxy.url),
                        ProxyCondition::Https => Proxy::https(&proxy.url),
                        ProxyCondition::All => Proxy::all(&proxy.url),
                    }
                    .map_err(|e| {
                        HttpError::HttpUnknownError(format!("Error creating proxy: {e:?}"))
                    })?;
                    client = client.proxy(proxy);
                }
            }
        }
    }

    // if let Some(cookie_settings) = req.cookie_settings {
    //     client = client.cookie_store(cookie_req.store_cookies);
    // }

    if let Some(redirect_settings) = req.redirect_settings {
        client = match redirect_settings {
            RedirectSettings::NoRedirect => client.redirect(Policy::none()),
            RedirectSettings::LimitedRedirects(max_redirects) => {
                client.redirect(Policy::limited(max_redirects as usize))
            }
        };
    }

    if let Some(timeout_settings) = req.timeout_settings {
        if let Some(timeout) = timeout_settings.timeout {
            client = client.timeout(
                timeout
                    .to_std()
                    .map_err(|e| HttpError::HttpUnknownError(e.to_string()))?,
            );
        }
        if let Some(timeout) = timeout_settings.connect_timeout {
            client = client.connect_timeout(
                timeout
                    .to_std()
                    .map_err(|e| HttpError::HttpUnknownError(e.to_string()))?,
            );
        }

        if let Some(keep_alive_timeout) = timeout_settings.keep_alive_timeout {
            let timeout = keep_alive_timeout
                .to_std()
                .map_err(|e| HttpError::HttpUnknownError(e.to_string()))?;
            if timeout.as_millis() > 0 {
                client = client.tcp_keepalive(timeout);
            }
        }

        if let Some(keep_alive_ping) = timeout_settings.keep_alive_ping {
            client = client.tcp_keepalive(
                keep_alive_ping
                    .to_std()
                    .map_err(|e| HttpError::HttpUnknownError(e.to_string()))?,
            );
        }
    }

    if let Some(tls_settings) = req.tls_settings {
        if !tls_settings.trust_root_certificates {
            client = client.cert_verification(false);
        }

        for cert in tls_settings.trusted_root_certificates {
            client = client.cert_store(
                CertStore::from_der_certs(Certificate::from_pem(&cert).map_err(|e| {
                    HttpError::HttpUnknownError(format!("Error adding trusted certificate: {e:?}"))
                }))
                .expect("Failed to load dynamic root certs"),
            );
        }

        if !tls_settings.verify_certificates {
            client = client.cert_verification(true);
        }

        if let Some(min_tls_version) = tls_settings.min_tls_version {
            client = client.min_tls_version(match min_tls_version {
                TlsVersion::Tls1_2 => tls::TlsVersion::TLS_1_2,
                TlsVersion::Tls1_3 => tls::TlsVersion::TLS_1_3,
            });
        }

        if let Some(max_tls_version) = tls_settings.max_tls_version {
            client = client.max_tls_version(match max_tls_version {
                TlsVersion::Tls1_2 => tls::TlsVersion::TLS_1_2,
                TlsVersion::Tls1_3 => tls::TlsVersion::TLS_1_3,
            });
        }

        client = client.tls_sni(tls_settings.sni);
    }

    client = match req.http_version_pref {
        Some(HttpVersionPref::Http10) | Some(HttpVersionPref::Http11) => client.http1_only(),
        Some(HttpVersionPref::Http2) => client.http2_only(),
        Some(HttpVersionPref::All) | None => client,
    };

    if let Some(dns_settings) = req.dns_settings {
        if let Some(overrides) = &dns_settings.overrides {
            for (hostname, ips) in overrides {
                let hostname = hostname.as_str();
                let mut err: Option<String> = None;
                let ip_addrs = ips
                    .iter()
                    .map(|ip| {
                        let ip_digested = ip.clone().digest_ip();
                        SocketAddr::from_str(ip_digested.as_str()).map_err(|e| {
                            err = Some(format!("Invalid IP address: {ip_digested}. {e:?}"));
                            HttpError::HttpUnknownError(e.to_string())
                        })
                    })
                    .filter_map(Result::ok)
                    .collect::<Vec<SocketAddr>>();

                if let Some(error) = err {
                    return Err(HttpError::HttpUnknownError(error).into());
                }

                client = client.resolve_to_addrs(hostname, ip_addrs.as_slice());
            }
        }
        if let Some(fallback) = &dns_settings.fallback {
            client = client.dns_resolver(Arc::new(StaticResolver {
                address: SocketAddr::from_str(fallback.clone().digest_ip().as_str())
                    .map_err(|e| HttpError::HttpUnknownError(format!("{e:?}")))?,
            }));
        }
        if let Some(resolver) = &dns_settings.resolver {
            client = client.dns_resolver(Arc::new(DynamicResolver {
                resolver: resolver.clone(),
            }));
        }
    }

    if let Some(user_agent) = req.user_agent {
        client = client.user_agent(user_agent);
    }

    let try_builder = client
        .build()
        .map_err(|e| HttpError::HttpUnknownError(format!("{e:?}")))?;

    let mut builder = try_builder.request(req.method.parse()?, req.url);

    if let Some(headers) = &req.headers {
        for (k, v) in headers {
            builder = builder.header(k, v);
        }
    }

    builder = match req.http_version_pref {
        Some(HttpVersionPref::Http10) => builder.version(Version::HTTP_10),
        Some(HttpVersionPref::Http11) => builder.version(Version::HTTP_11),
        Some(HttpVersionPref::Http2) => builder.version(Version::HTTP_2),
        // HttpVersionPref::Http3 => request.version(Version::HTTP_3),
        Some(HttpVersionPref::All) | None => builder,
    };

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
