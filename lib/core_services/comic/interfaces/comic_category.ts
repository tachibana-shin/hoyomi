import { Comic } from "./comic"
import { Paginate } from "../../interfaces/paginate"
import { Filter } from "../../interfaces/filter"

export interface ComicCategory extends Paginate<Comic> {
  name: string
  url: string
  description?: string
  filters?: Filter[]
}
