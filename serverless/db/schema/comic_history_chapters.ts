import {
  pgTable,
  integer,
  text,
  timestamp,
  index,
  unique
  // foreignKey
} from "drizzle-orm/pg-core"
import { comicHistories } from "./comic_histories.ts"
import { relations } from "drizzle-orm"
// import { comicHistories } from "./comic_histories.ts"

export const comicHistoryChapters = pgTable(
  "comic_history_chapters",
  {
    id: integer("id").primaryKey().generatedAlwaysAsIdentity(),
    comicHistoryId: integer("comic_history_id").notNull(),
    cur: integer("cur").notNull(),
    dur: integer("dur").notNull(),
    name: text("name").notNull(),
    updatedAt: timestamp("updated_at", { withTimezone: true }).notNull(),
    chapId: text("chap_id").notNull(),
    createdAt: timestamp("created_at", { withTimezone: true })
      .notNull()
      .defaultNow()
  },
  (table) => [
    unique("unique_chap_id_comic_history_id_idx").on(
      table.chapId,
      table.comicHistoryId
    ),
    index("comic_history_id_idx").on(table.comicHistoryId)
  ]
)

export const comicHistoryChaptersRelations = relations(
  comicHistoryChapters,
  ({ one }) => {
    return {
      comicHistory: one(comicHistories, {
        fields: [comicHistoryChapters.comicHistoryId],
        references: [comicHistories.id]
      })
    }
  }
)
