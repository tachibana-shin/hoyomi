import type { OImage } from "./o_image"

export interface Genre {
  name: string
  genreId: string
  description?: string
  image?: OImage
}

export const GenreNoId = "$_no_id_$"
