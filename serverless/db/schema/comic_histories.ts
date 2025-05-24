import {
  pgTable,
  integer,
  timestamp,
  foreignKey,
  index,
  date
} from "drizzle-orm/pg-core"
import { comicHistoryChapters } from "./comic_history_chapters.ts"
import { comic } from "./comic.ts"

export const comicHistoriesName = "comic_histories"
export const comicHistories = pgTable(
  comicHistoriesName,
  {
    id: integer("id").primaryKey().generatedAlwaysAsIdentity(),
    comicId: integer("comic_id")
      .notNull()
      .references(() => comic.id),
    forTo: integer("for_to"),
    vChap: integer("v_chap").references(() => comicHistoryChapters.id),
    dateCreated: date("date_created").notNull().defaultNow(),
    createdAt: timestamp("created_at", { withTimezone: true })
      .notNull()
      .defaultNow()
  },
  (table) => [
    index("comic_comic_id_idx").on(table.comicId),
    index("comic_history_for_to_idx").on(table.forTo),
    index("comic_history_v_chap_idx").on(table.vChap),
    foreignKey({
      columns: [table.forTo],
      foreignColumns: [table.id]
    }),
    index("comic_history_date_created_idx").on(
      table.dateCreated
    )
  ]
)
