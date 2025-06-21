import type { Paginate } from "../../interfaces/paginate"
import { AuthMixin } from "../../mixin/auth_mixin"
import type { EigaFollow } from "../interfaces/eiga_follow"
import type { EigaContextWithEpisodes } from "../interfaces/eiga_context_with_episodes"

export abstract class EigaFollowMixin extends AuthMixin {
  abstract getFollows(params: { page: number }): Promise<Paginate<EigaFollow>>

  abstract getFollowsCount(eigaId: string): Promise<number>

  abstract isFollow(eigaId: string): Promise<boolean>

  abstract setFollow(
    context: EigaContextWithEpisodes,
    value: boolean
  ): Promise<void>
}
