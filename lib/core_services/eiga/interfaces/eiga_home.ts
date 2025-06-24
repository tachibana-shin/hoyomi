import type { EigaCarousel } from "./eiga_carousel"
import type { HomeEigaCategory } from "./home_eiga_category"

export interface EigaHome {
  carousel?: EigaCarousel
  categories: HomeEigaCategory[]
}
