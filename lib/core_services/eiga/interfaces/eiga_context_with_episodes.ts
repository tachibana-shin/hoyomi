import { MetaEiga } from "./meta_eiga"
import { Season } from "./meta_eiga"
import { EigaEpisode } from "./eiga_episode"

export interface EigaContextWithEpisodes {
  eigaId: string
  metaEiga: MetaEiga
  season?: Season
  episodes: EigaEpisode[]
}
