// ...existing imports...
import { OImage } from "../../interfaces/o_image"
import { Genre } from "../../interfaces/genre"

export interface ComicCarouselItem {
  subText?: string
  image: OImage
  comicId: string
  name: string
  originalName?: string
  type?: string
  episodeDuration?: string
  updatedAt?: Date
  quality?: string
  countSub?: number
  countDub?: number
  rate?: number
  notice?: string
  year?: string
  description?: string
  studio?: string
  duration?: string
  language?: string
  genres?: Genre[]
  actors?: Genre[]
}
