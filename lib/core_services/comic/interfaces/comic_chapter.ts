export interface ComicChapter {
  name: string
  fullName?: string
  chapterId: string
  time?: Date
  extra?: string
  order?: number
}

// Utility function for sorting chapters ascending by order
export function sortChaptersAsc(chapters: ComicChapter[]): ComicChapter[] {
  return [...chapters].sort((a, b) => (a.order ?? 0) - (b.order ?? 0))
}
