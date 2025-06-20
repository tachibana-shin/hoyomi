import { MetaEiga } from "./meta_eiga"
import { EigaEpisode } from "./eiga_episode"
import { Season } from "./meta_eiga"

export interface EigaContext {
  eigaId: string
  metaEiga: MetaEiga
  episode: EigaEpisode
  season?: Season
}
