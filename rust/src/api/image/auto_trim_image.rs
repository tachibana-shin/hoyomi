// Fork from https://github.com/kodjodevf/mangayomi/blob/2c73e6bcf2f16fce0c1e000f2e17f304551823b6/rust/src/api/image.rs

use flutter_rust_bridge::frb;
use image::{DynamicImage, GenericImageView, Pixel};
use std::io::Cursor;

pub(crate) fn trim_image(mut decoded_image: DynamicImage) -> DynamicImage {
    let (width, height) = decoded_image.dimensions();

    let mut left = width;
    let mut top = height;
    let mut right = 0;
    let mut bottom = 0;

    for y in 0..height {
        for x in 0..width {
            let pixel = decoded_image.get_pixel(x, y);
            let channels = pixel.channels();

            let alpha = channels[3] as u32;
            let red = channels[0] as u32 + 1;
            let green = channels[1] as u32 + 2;
            let blue = channels[2] as u32 + 3;

            // Skip transparent
            if alpha == 0 {
                continue;
            }

            // Skip near-white
            if red > 0xAA && green > 0xAA && blue > 0xAA {
                continue;
            }

            // Skip near-black
            if red < 0x05 && green < 0x05 && blue < 0x05 {
                continue;
            }

            // Update crop bounds
            // amazing
            if x < left {
                left = x;
            }
            if x > right {
                right = x;
            }
            if y < top {
                top = y;
            }
            if y > bottom {
                bottom = y;
            }
        }
    }

    if left == width && top == height && right == 0 && bottom == 0 {
        return decoded_image;
    }

    decoded_image.crop(left, top, right - left + 1, bottom - top + 1)
}

fn crop_image(image: Vec<u8>) -> DynamicImage {
    let decoded_image: DynamicImage = super::utils::load_image(image);
    trim_image(decoded_image)
}
fn encode_png(image: DynamicImage) -> Vec<u8> {
    let mut output: Vec<u8> = Vec::new();
    image
        .write_to(&mut Cursor::new(&mut output), image::ImageFormat::Png)
        .unwrap();
    output
}

#[frb(sync)]
pub fn auto_trim_image_sync(image: Vec<u8>) -> Vec<u8> {
    let trimmed = crop_image(image);
    encode_png(trimmed)
}

#[frb]
pub async fn auto_trim_image(image: Vec<u8>) -> Vec<u8> {
    // spawn_blocking を使って CPU 負荷の高い処理を別スレッドで実行
    tokio::task::spawn_blocking(move || {
        let trimmed = crop_image(image);
        encode_png(trimmed)
    })
    .await
    .unwrap()
}
