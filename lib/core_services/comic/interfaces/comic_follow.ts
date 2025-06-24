import type { Comic } from "./comic"
import type { ComicChapter } from "./comic_chapter"

export interface ComicFollow {
  sourceId: string
  item: Comic
  updatedAt?: Date
  lastChapter?: ComicChapter
}
