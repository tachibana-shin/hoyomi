import { OImage } from "../../interfaces/o_image"
import { ComicChapter } from "./comic_chapter"

export interface Comic {
  name: string
  comicId: string
  originalName?: string
  image: OImage
  lastChap?: ComicChapter
  lastUpdate?: Date
  notice?: string
  pending?: boolean
  preRelease?: Date
  rate?: number
  description?: string
}
