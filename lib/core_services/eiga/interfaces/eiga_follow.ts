import { Eiga } from "./eiga"
import { EigaEpisode } from "./eiga_episode"

export interface EigaFollow {
  sourceId: string
  item: Eiga
  updatedAt?: string
  lastEpisode?: EigaEpisode
}
