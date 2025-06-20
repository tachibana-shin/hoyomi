import { Headers } from "../../interfaces/headers"

export interface SourceVideo {
  src: string
  url: string
  type: string
  headers?: Headers
  extra?: string
}
