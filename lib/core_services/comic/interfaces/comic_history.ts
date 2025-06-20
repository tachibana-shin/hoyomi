import { Comic } from "./comic"
import { ComicChapter } from "./comic_chapter"
import { WatchPage } from "./watch_page"

export interface ComicHistory {
  sourceId: string
  item: Comic
  watchUpdatedAt: Date
  lastChapter: ComicChapter
  watchPage: WatchPage
}
