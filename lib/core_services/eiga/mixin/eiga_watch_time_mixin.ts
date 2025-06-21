import { AuthMixin } from "../../mixin/auth_mixin"
import type { EigaEpisode } from "../interfaces/eiga_episode"
import type { EigaHistory } from "../interfaces/eiga_history"
import type { EigaContext } from "../interfaces/eiga_context"
import type { WatchTime } from "../interfaces/watch_time"
import type { WatchTimeUpdated } from "../interfaces/watch_time_updated"

export abstract class EigaWatchTimeMixin extends AuthMixin {
  abstract getWatchHistory(params: { page: number }): Promise<EigaHistory[]>

  abstract getWatchTime(context: EigaContext): Promise<WatchTime>

  abstract getWatchTimeEpisodes(params: {
    eigaId: string
    episodes: EigaEpisode[]
  }): Promise<Record<string, WatchTimeUpdated>>

  abstract setWatchTime(
    context: EigaContext,
    params: { watchTime: WatchTime }
  ): Promise<void>
}
