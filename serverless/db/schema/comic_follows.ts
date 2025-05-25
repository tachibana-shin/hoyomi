import { pgTable, integer, timestamp, json } from "drizzle-orm/pg-core"
import { comic } from "./comic.ts"

export const comicFollowsName = "comic_follows"
export const comicFollows = pgTable(comicFollowsName, {
  id: integer("id").primaryKey().generatedAlwaysAsIdentity(),
  comicId: integer("comic_id")
    .references(() => comic.id)
    .notNull()
    .unique(),
  currentChapters: json("current_chapters").notNull(),
  createdAt: timestamp("created_at", { withTimezone: true })
    .notNull()
    .defaultNow()
})
