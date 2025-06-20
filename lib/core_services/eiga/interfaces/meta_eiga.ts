import { OImage } from "../../interfaces/o_image"
import { Genre } from "../../interfaces/genre"
import { StatusEnum } from "../../interfaces/status_enum"

export interface Season {
  name: string
  eigaId: string
}

export interface MetaEiga {
  name: string
  originalName?: string
  image: OImage
  poster?: OImage
  description: string
  rate?: number
  countRate?: number
  countSub?: number
  countDub?: number
  duration?: string
  yearOf?: number
  views?: number
  seasons: Season[]
  genres: Genre[]
  quality?: string
  authors?: Genre[]
  countries?: Genre[]
  language?: string
  studios?: Genre[]
  status: StatusEnum
  movieSeason?: Genre
  trailer?: string
  fake?: boolean
}
