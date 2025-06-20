import { ComicCarousel } from "./comic_carousel"
import { HomeComicCategory } from "./home_comic_category"

export interface ComicHome {
  carousel?: ComicCarousel
  categories: HomeComicCategory[]
}
