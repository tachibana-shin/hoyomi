use flutter_rust_bridge::frb;
use image::{DynamicImage, GenericImage, GenericImageView, ImageFormat};
use std::io::Cursor;

use crate::api::image::{auto_trim_image::trim_image, utils::load_image};

#[derive(Debug, Clone)]
pub struct Block {
    pub sx: u32,
    pub sy: u32,
    pub dx: u32,
    pub dy: u32,
    pub width: u32,
    pub height: u32,
}

fn do_unscramble_image(
    image_data: Vec<u8>,
    blocks: Vec<Block>,
    auto_trim: bool,
) -> Result<Vec<u8>, String> {
    let img = load_image(image_data);
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

    let final_image = if auto_trim { trim_image(dst) } else { dst };

    let mut out = Vec::new();
    final_image
        .write_to(&mut Cursor::new(&mut out), ImageFormat::Png)
        .map_err(|e| e.to_string())?;

    Ok(out)
}

#[frb]
pub async fn unscramble_image(
    image_data: Vec<u8>,
    blocks: Vec<Block>,
    auto_trim: bool,
) -> Result<Vec<u8>, String> {
    tokio::task::spawn_blocking(move || do_unscramble_image(image_data, blocks, auto_trim))
        .await
        .map_err(|e| format!("JoinError: {e}"))?
}

#[frb(sync)]
pub fn unscramble_image_sync(
    image_data: Vec<u8>,
    blocks: Vec<Block>,
    auto_trim: bool,
) -> Result<Vec<u8>, String> {
    do_unscramble_image(image_data, blocks, auto_trim)
}
