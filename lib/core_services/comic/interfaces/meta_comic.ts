import type { OImage } from "../../interfaces/o_image"
import type { Genre } from "../../interfaces/genre"
import type { RateValue } from "./rate_value"
import type { ComicChapter } from "./comic_chapter"
import { StatusEnum } from "../../interfaces/status_enum"

export interface MetaComic {
  name: string
  originalName?: string
  image: OImage
  author?: string
  translator?: string
  status: StatusEnum
  views?: number
  likes?: number
  rate?: RateValue
  genres: Genre[]
  description: string
  chapters: ComicChapter[]
  lastModified: Date
  fake?: boolean
  offlineMode?: boolean
}
