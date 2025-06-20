import { OImage } from "../../interfaces/o_image"
import { Genre } from "../../interfaces/genre"
import { RateValue } from "./rate_value"
import { ComicChapter } from "./comic_chapter"

export enum StatusEnum {
  ongoing = "ongoing",
  completed = "completed",
  hiatus = "hiatus"
}

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
