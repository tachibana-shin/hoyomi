import { OImage } from "../../interfaces/o_image"

export interface ComicComment {
  id: string
  chapterId?: string
  userId: string
  name: string
  photoUrl?: OImage | null
  content: string
  timeAgo: Date
  countLike?: number
  countDislike?: number
  countReply: number
  canDelete?: boolean
  like?: boolean
  replies?: ComicComment[]
}
