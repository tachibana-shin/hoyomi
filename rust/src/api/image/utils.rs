use image::{DynamicImage};

use image::{DynamicImage, ImageError};

pub(crate) fn load_image(image: Vec<u8>) -> Result<DynamicImage, ImageError> {
    image::load_from_memory(image.as_slice())
}
