import { Comic } from "./comic"

export interface HomeComicCategory {
  name: string
  categoryId?: string
  gridView?: boolean
  items: Comic[]
}
