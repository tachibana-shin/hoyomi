import type { EigaCarouselItem } from "./eiga_carousel_item"

export interface EigaCarousel {
  items: EigaCarouselItem[]
  aspectRatio: number
  maxHeightBuilder: number
}
