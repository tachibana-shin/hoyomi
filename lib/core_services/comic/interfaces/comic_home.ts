import type { ComicCarousel } from "./comic_carousel"
import type { HomeComicCategory } from "./home_comic_category"

export interface ComicHome {
  carousel?: ComicCarousel
  categories: HomeComicCategory[]
}
