import type { MetaEiga } from "./meta_eiga"
import type { EigaEpisode } from "./eiga_episode"
import type { Season } from "./meta_eiga"

export interface EigaContext {
  eigaId: string
  metaEiga: MetaEiga
  episode: EigaEpisode
  season?: Season
}
