import type { Comic } from "./comic"
import type { Paginate } from "../../interfaces/paginate"
import type { Filter } from "../../interfaces/filter"

export interface ComicCategory extends Paginate<Comic> {
  name: string
  url: string
  description?: string
  filters?: Filter[]
}
