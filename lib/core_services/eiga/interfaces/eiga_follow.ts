import type { Eiga } from "./eiga"
import type { EigaEpisode } from "./eiga_episode"

export interface EigaFollow {
  sourceId: string
  item: Eiga
  updatedAt?: string
  lastEpisode?: EigaEpisode
}
