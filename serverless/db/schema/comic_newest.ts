import { pgTable, integer, timestamp, json, text } from "drizzle-orm/pg-core"
import { comicFollows } from "./comic_follows.ts"

export const comicNewestName = "comic_newest"
export const comicNewest = pgTable(comicNewestName, {
  id: integer("id").primaryKey().generatedAlwaysAsIdentity(),
  comicFollow: integer("comic_follow").references(() => comicFollows.id),
  chapterId: text("chapter_id").notNull(),
  chapterMeta: json("chapter_meta").notNull(),
  createdAt: timestamp("created_at", { withTimezone: true })
    .notNull()
    .defaultNow()
})
