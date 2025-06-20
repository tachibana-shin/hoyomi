import { Eiga } from "./eiga"

export interface HomeEigaCategory {
  name: string
  categoryId?: string
  gridView?: boolean
  items: Eiga[]
}
