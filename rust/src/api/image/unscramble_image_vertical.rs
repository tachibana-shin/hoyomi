use flutter_rust_bridge::frb;
use image::{DynamicImage, GenericImage, GenericImageView, ImageFormat};
use std::io::Cursor;

#[derive(Debug, Clone)]
pub struct RowBlock {
    pub dy: u32,
    pub height: u32,
}

fn do_unscramble_image_rows(image_data: Vec<u8>, blocks: Vec<RowBlock>) -> Result<Vec<u8>, String> {
    let reader = image::ImageReader::with_format(Cursor::new(&image_data), ImageFormat::Png);
    let img = reader.decode().map_err(|e| e.to_string())?;
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

    let mut out = Vec::new();
    dst.write_to(&mut Cursor::new(&mut out), ImageFormat::Png)
        .map_err(|e| e.to_string())?;

    Ok(out)
}

#[frb]
pub fn unscramble_image_rows(
    image_data: Vec<u8>,
    blocks: Vec<RowBlock>,
) -> Result<Vec<u8>, String> {
    do_unscramble_image_rows(image_data, blocks)
}

#[frb(sync)]
pub fn unscramble_image_rows_sync(
    image_data: Vec<u8>,
    blocks: Vec<RowBlock>,
) -> Result<Vec<u8>, String> {
    do_unscramble_image_rows(image_data, blocks)
}
