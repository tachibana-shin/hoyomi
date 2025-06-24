import type { ComicCarouselItem } from "./comic_carousel_item"

export interface ComicCarousel {
  items: ComicCarouselItem[]
  aspectRatio: number
  maxHeightBuilder: number
}
