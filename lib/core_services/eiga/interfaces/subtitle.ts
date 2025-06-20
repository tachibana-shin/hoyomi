import { Headers } from "../../interfaces/headers"

export type SubtitleType = "srt" | "vtt" | "ass" | string // Adjust as needed
export interface Subtitle {
  language: string
  code: string
  type: SubtitleType
  url: string
  headers?: Headers
}
