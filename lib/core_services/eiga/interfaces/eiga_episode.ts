import { type OImage } from "../../interfaces/o_image"

export interface EigaEpisode {
  name: string
  episodeId: string
  image?: OImage
  description?: string
  extra?: string
  order?: number
}
