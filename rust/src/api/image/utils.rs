use image::DynamicImage;

pub(crate) fn load_image(image: Vec<u8>) -> DynamicImage {
    return image::load_from_memory(image.as_slice()).expect("Failed to load image");
}
