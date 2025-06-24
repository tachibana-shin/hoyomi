import type { MetaEiga } from "./meta_eiga"
import type { Season } from "./meta_eiga"
import type { EigaEpisode } from "./eiga_episode"

export interface EigaContextWithEpisodes {
  eigaId: string
  metaEiga: MetaEiga
  season?: Season
  episodes: EigaEpisode[]
}
