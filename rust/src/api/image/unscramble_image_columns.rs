use flutter_rust_bridge::frb;
use image::{DynamicImage, GenericImage, GenericImageView, ImageFormat};
use std::io::Cursor;

use crate::api::image::{auto_trim_image::trim_image, utils::load_image};

#[derive(Debug, Clone)]
pub struct ColumnBlock {
    pub dx: u32,
    pub width: u32,
}

fn do_unscramble_image_columns(
    image_data: Vec<u8>,
    blocks: Vec<ColumnBlock>,
    auto_trim: bool,
) -> Result<Vec<u8>, String> {
    let img = load_image(image_data);
    let (img_width, img_height) = img.dimensions();

    let mut dst = DynamicImage::new_rgba8(img_width, img_height);
    let mut sx = 0;

    for block in blocks {
        let ColumnBlock { dx, width } = block;

        if sx + width > img_width || dx + width > img_width {
            return Err(format!(
                "Block out of bounds: sx={}, dx={}, width={}, img_width={}",
                sx, dx, width, img_width
            ));
        }

        let cropped = img.crop_imm(sx, 0, width, img_height);
        dst.copy_from(&cropped, dx, 0)
            .map_err(|e| format!("copy_from error: {:?}", e))?;

        sx += width;
    }

    let final_image = if auto_trim { trim_image(dst) } else { dst };

    let mut out = Vec::new();
    final_image
        .write_to(&mut Cursor::new(&mut out), ImageFormat::Png)
        .map_err(|e| e.to_string())?;

    Ok(out)
}

#[frb]
pub async fn unscramble_image_columns(
    image_data: Vec<u8>,
    blocks: Vec<ColumnBlock>,
    auto_trim: bool,
) -> Result<Vec<u8>, String> {
    tokio::task::spawn_blocking(move || {
        do_unscramble_image_columns(image_data, blocks, auto_trim)
    })
    .await
    .map_err(|e| format!("JoinError: {}", e))? // unwrap lỗi từ spawn_blocking
}

#[frb(sync)]
pub fn unscramble_image_columns_sync(
    image_data: Vec<u8>,
    blocks: Vec<ColumnBlock>,
    auto_trim: bool,
) -> Result<Vec<u8>, String> {
    do_unscramble_image_columns(image_data, blocks, auto_trim)
}
