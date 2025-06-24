import type { Paginate } from "../../interfaces/paginate"
import type { MetaComic } from "../interfaces/meta_comic"
import type { ComicFollow } from "../interfaces/comic_follow"
import { ComicAuthMixin } from "./comic_auth_mixin"

export abstract class ComicFollowMixin extends ComicAuthMixin {
  abstract getFollows(page: number): Promise<Paginate<ComicFollow>>

  abstract isFollow(comicId: string): Promise<boolean>

  abstract setFollow(params: {
    comicId: string
    metaComic: MetaComic
    value: boolean
  }): Promise<void>
}
