use flutter_rust_bridge::frb;
use std::io::Cursor;

fn read_image_size(data: Vec<u8>) -> Result<(u32, u32), String> {
    let img = image::ImageReader::new(Cursor::new(data))
        .with_guessed_format()
        .map_err(|e| e.to_string())?
        .decode()
        .map_err(|e| e.to_string())?;
    Ok((img.width(), img.height()))
}

#[frb]
pub fn get_image_size(data: Vec<u8>) -> Result<(u32, u32), String> {
    read_image_size(data)
}

#[frb(sync)]
pub fn get_image_size_sync(data: Vec<u8>) -> Result<(u32, u32), String> {
    read_image_size(data)
}
