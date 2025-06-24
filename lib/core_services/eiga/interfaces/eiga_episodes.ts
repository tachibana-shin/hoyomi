import type { EigaEpisode } from "./eiga_episode"
import type { OImage } from "../../interfaces/o_image"

export interface EigaEpisodes {
  episodes: EigaEpisode[]
  image?: OImage
  poster?: OImage
  schedule?: string
}
