import type { ComicHistory } from "../interfaces/comic_history"
import type { MetaComic } from "../interfaces/meta_comic"
import type { ComicChapter } from "../interfaces/comic_chapter"
import type { WatchPage } from "../interfaces/watch_page"
import type { WatchPageUpdated } from "../interfaces/watch_page_updated"
import { ComicAuthMixin } from "./comic_auth_mixin"

export abstract class ComicWatchPageMixin extends ComicAuthMixin {
  abstract getWatchHistory(page: number): Promise<ComicHistory[]>

  abstract getWatchPage(params: {
    comicId: string
    chapter: ComicChapter
    metaComic: MetaComic
  }): Promise<WatchPageUpdated>

  async getWatchPageEpisodes(params: {
    comicId: string
    chapters: ComicChapter[]
  }): Promise<Record<string, WatchPageUpdated>> {
    return {}
  }

  abstract setWatchPage(params: {
    comicId: string
    chapter: ComicChapter
    metaComic: MetaComic
    watchPage: WatchPage
  }): Promise<void>
}
