use flutter_rust_bridge::frb;

use crate::api::image::utils::load_image;

#[derive(Debug, Clone)]
pub struct DecodedImage {
    pub pixels: Vec<u8>,
    pub width: u32,
    pub height: u32,
}

#[frb]
pub fn decode_image_rgba(image_data: Vec<u8>) -> Result<DecodedImage, String> {
    let img = load_image(image_data);

    let rgba = img.to_rgba8();
    let (width, height) = rgba.dimensions();

    Ok(DecodedImage {
        pixels: rgba.into_raw(), // Vec<u8> RGBA
        width,
        height,
    })
}
