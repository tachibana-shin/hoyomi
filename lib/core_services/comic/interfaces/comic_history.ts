import type { Comic } from "./comic"
import type { ComicChapter } from "./comic_chapter"
import type { WatchPage } from "./watch_page"

export interface ComicHistory {
  sourceId: string
  item: Comic
  watchUpdatedAt: Date
  lastChapter: ComicChapter
  watchPage: WatchPage
}
