import type { Filter } from "../../interfaces/filter"
import type { Eiga } from "./eiga"

export interface EigaCategory {
  name: string
  url: string
  description?: string
  items: Eiga[]
  page: number
  totalItems: number
  totalPages: number
  filters?: Filter[]
}
