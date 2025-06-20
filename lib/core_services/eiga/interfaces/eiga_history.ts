import { Eiga } from "./eiga"
import { EigaEpisode } from "./eiga_episode"
import { WatchTime } from "./watch_time"

export interface EigaHistory {
  sourceId: string
  item: Eiga
  watchUpdatedAt: string
  lastEpisode: EigaEpisode
  watchTime: WatchTime
}
