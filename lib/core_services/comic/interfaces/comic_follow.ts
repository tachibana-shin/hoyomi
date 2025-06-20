import { Comic } from "./comic"
import { ComicChapter } from "./comic_chapter"

export interface ComicFollow {
  sourceId: string
  item: Comic
  updatedAt?: Date
  lastChapter?: ComicChapter
}
