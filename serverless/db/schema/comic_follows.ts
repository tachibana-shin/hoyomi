import { pgTable, integer, timestamp, text } from "drizzle-orm/pg-core"
import { comic } from "./comic.ts"

export const comicFollowsName = "comic_follows"
export const comicFollows = pgTable(comicFollowsName, {
  id: integer("id").primaryKey().generatedAlwaysAsIdentity(),
  comicId: integer("comic_id")
    .references(() => comic.id)
    .notNull()
    .unique(),
  currentChapterName: text("current_chapter_name").notNull(),
  currentChapterId: text("current_chapter_id").notNull(),
  currentChapterTime: timestamp("current_chapter_time"),
  createdAt: timestamp("created_at", { withTimezone: true })
    .notNull()
    .defaultNow()
})
