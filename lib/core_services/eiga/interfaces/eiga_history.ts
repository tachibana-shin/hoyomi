import type { Eiga } from "./eiga"
import type { EigaEpisode } from "./eiga_episode"
import type { WatchTime } from "./watch_time"

export interface EigaHistory {
  sourceId: string
  item: Eiga
  watchUpdatedAt: string
  lastEpisode: EigaEpisode
  watchTime: WatchTime
}
