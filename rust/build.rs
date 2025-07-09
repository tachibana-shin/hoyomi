use std::env;

fn main() {
    if cfg!(target_os = "windows") && cfg!(target_env = "msvc") {
        let profile = env::var("PROFILE").unwrap_or_default();
        if profile == "debug" {
            println!("cargo:rustc-link-lib=dylib=msvcrtd");
        }
    }
}
