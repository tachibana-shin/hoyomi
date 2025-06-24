import type { MetaComic } from "../interfaces/meta_comic"
import type { ComicChapter } from "../interfaces/comic_chapter"
import type { ComicComment } from "../interfaces/comic_comment"
import type { ComicComments } from "../interfaces/comic_comments"
import { ComicAuthMixin } from "./comic_auth_mixin"

export interface ComicCommentContext {
  comicId: string
  metaComic: MetaComic
  chapterId?: string
  chapter?: ComicChapter
  parent?: ComicComment
}

export abstract class ComicCommentMixin extends ComicAuthMixin {
  // for comment system
  abstract getComments(
    context: ComicCommentContext,
    page?: number
  ): Promise<ComicComments>

  abstract deleteComment(
    context: ComicCommentContext,
    comment: ComicComment
  ): Promise<void>

  setLikeComment(
    context: ComicCommentContext,
    comment: ComicComment,
    value: boolean
  ): Promise<boolean> {
    throw new Error("UnimplementedError")
  }
}
