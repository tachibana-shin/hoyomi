import { EigaCarousel } from "./eiga_carousel"
import { HomeEigaCategory } from "./home_eiga_category"

export interface EigaHome {
  carousel?: EigaCarousel
  categories: HomeEigaCategory[]
}
