import type { EigaEpisode } from "./eiga_episode"
import type { OImage } from "../../interfaces/o_image"

export interface Eiga {
  name: string
  eigaId: string
  originalName?: string
  image: OImage
  lastEpisode?: EigaEpisode
  lastUpdate?: string
  notice?: string
  countSub?: number
  countDub?: number
  rate?: number
  pending?: boolean
  preRelease?: string
  description?: string
}
