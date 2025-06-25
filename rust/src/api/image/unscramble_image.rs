use flutter_rust_bridge::frb;
use image::{DynamicImage, GenericImage, GenericImageView, ImageFormat};
use std::io::Cursor;

#[derive(Debug, Clone)]
pub struct Block {
    pub sx: u32,
    pub sy: u32,
    pub dx: u32,
    pub dy: u32,
    pub width: u32,
    pub height: u32,
}

fn do_unscramble_image(image_data: Vec<u8>, blocks: Vec<Block>) -> Result<Vec<u8>, String> {
    let reader = image::ImageReader::with_format(Cursor::new(&image_data), ImageFormat::Png);
    let img = reader.decode().map_err(|e| e.to_string())?;

    let (img_width, img_height) = img.dimensions();
    let mut dst = DynamicImage::new_rgba8(img_width, img_height);

    for block in blocks {
        let Block {
            sx,
            sy,
            dx,
            dy,
            width,
            height,
        } = block;

        // Check bounds
        if sx + width > img_width || sy + height > img_height {
            return Err(format!("Source block out of bounds"));
        }
        if dx + width > img_width || dy + height > img_height {
            return Err(format!("Destination block out of bounds"));
        }

        let cropped = img.crop_imm(sx, sy, width, height);
        dst.copy_from(&cropped, dx, dy)
            .map_err(|e| format!("copy_from error: {:?}", e))?;
    }

    let mut out = Vec::new();
    dst.write_to(&mut Cursor::new(&mut out), ImageFormat::Png)
        .map_err(|e| e.to_string())?;

    Ok(out)
}

#[frb]
pub fn unscramble_image(image_data: Vec<u8>, blocks: Vec<Block>) -> Result<Vec<u8>, String> {
    do_unscramble_image(image_data, blocks)
}

#[frb(sync)]
pub fn unscramble_image_sync(image_data: Vec<u8>, blocks: Vec<Block>) -> Result<Vec<u8>, String> {
    do_unscramble_image(image_data, blocks)
}
