use std::fmt::Display;

#[derive(Clone, Debug)]
pub enum HttpError {
    HttpCancelError,
    HttpTimeoutError,
    HttpRedirectError,
    HttpStatusCodeError(u16, Vec<(String, String)>, Vec<u8>),
    HttpInvalidCertificateError(String),
    HttpConnectionError(String),
    HttpUnknownError(String),
}

// // Flutter Rust Bridge only supports anyhow, so we define string constants for the error messages.
// pub(crate) const STREAM_CANCEL_ERROR: &str = "STREAM_CANCEL_ERROR";

impl Display for HttpError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            HttpError::HttpCancelError => write!(f, "HttpCancelError"),
            HttpError::HttpTimeoutError => write!(f, "HttpTimeoutError"),
            HttpError::HttpRedirectError => write!(f, "HttpRedirectError"),
            HttpError::HttpStatusCodeError(i, _, _) => {
                write!(f, "HttpStatusCodeError: {i}")
            }
            HttpError::HttpInvalidCertificateError(d) => {
                write!(f, "HttpInvalidCertificateError: {d}")
            }
            HttpError::HttpConnectionError(e) => write!(f, "HttpConnectionError: {e}"),
            HttpError::HttpUnknownError(e) => write!(f, "{}", e),
        }
    }
}

impl std::error::Error for HttpError {}
