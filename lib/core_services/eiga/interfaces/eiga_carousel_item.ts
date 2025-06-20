import { Genre } from "../../interfaces/genre"
import { OImage } from "../../interfaces/o_image"

export interface EigaCarouselItem {
  subText?: string
  image: OImage
  eigaId: string
  name: string
  originalName?: string
  type?: string
  episodeDuration?: string
  updatedAt?: Date // ISO date string
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
