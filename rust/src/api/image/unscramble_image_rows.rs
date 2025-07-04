use flutter_rust_bridge::frb;
use image::{DynamicImage, GenericImage, GenericImageView, ImageFormat};
use std::io::Cursor;

use crate::api::image::{auto_trim_image::trim_image, utils::load_image};

#[derive(Debug, Clone)]
pub struct RowBlock {
    pub dy: u32,
    pub height: u32,
}

fn do_unscramble_image_rows(
    image_data: Vec<u8>,
    blocks: Vec<RowBlock>,
    auto_trim: bool,
) -> Result<Vec<u8>, String> {
    let img = load_image(image_data);
    let (img_width, img_height) = img.dimensions();

    let mut dst = DynamicImage::new_rgba8(img_width, img_height);
    let mut sy = 0;

    for block in blocks {
        let RowBlock { dy, height } = block;

        if sy + height > img_height || dy + height > img_height {
            return Err(format!(
                "Block out of bounds: sy={}, dy={}, height={}, img_height={}",
                sy, dy, height, img_height
            ));
        }

        let cropped = img.crop_imm(0, sy, img_width, height);
        dst.copy_from(&cropped, 0, dy)
            .map_err(|e| format!("copy_from error: {:?}", e))?;

        sy += height;
    }

    let final_image = if auto_trim { trim_image(dst) } else { dst };

    let mut out = Vec::new();
    final_image
        .write_to(&mut Cursor::new(&mut out), ImageFormat::Png)
        .map_err(|e| e.to_string())?;

    Ok(out)
}

#[frb]
pub async fn unscramble_image_rows(
    image_data: Vec<u8>,
    blocks: Vec<RowBlock>,
    auto_trim: bool,
) -> Result<Vec<u8>, String> {
    tokio::task::spawn_blocking(move || do_unscramble_image_rows(image_data, blocks, auto_trim))
        .await
        .map_err(|e| format!("JoinError: {e}"))
}

#[frb(sync)]
pub fn unscramble_image_rows_sync(
    image_data: Vec<u8>,
    blocks: Vec<RowBlock>,
    auto_trim: bool,
) -> Result<Vec<u8>, String> {
    do_unscramble_image_rows(image_data, blocks, auto_trim)
}
