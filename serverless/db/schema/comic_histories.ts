import {
  pgTable,
  integer,
  text,
  timestamp,
  foreignKey,
  index,
  date,
  unique
} from "drizzle-orm/pg-core"
import { users } from "./users.ts"
import { comicHistoryChapters } from "./comic_history_chapters.ts"

export const comicHistoriesName = "comic_histories"
export const comicHistories = pgTable(
  comicHistoriesName,
  {
    id: integer("id").primaryKey().generatedAlwaysAsIdentity(),
    userId: integer("user_id")
      .notNull()
      .references(() => users.id),
    sourceId: text("source_id").notNull(),
    comicTextId: text("comic_text_id").notNull(),
    name: text("name").notNull(),
    poster: text("poster").notNull(),
    seasonName: text("season_name"),
    forTo: integer("for_to"),
    vChap: integer("v_chap").references(() => comicHistoryChapters.id),
    dateCreated: date("date_created").notNull().defaultNow(),
    createdAt: timestamp("created_at", { withTimezone: true })
      .notNull()
      .defaultNow()
  },
  (table) => [
    index("comic_history_user_id_idx").on(table.userId),
    index("comic_history_source_id_idx").on(table.sourceId),
    index("comic_history_for_to_idx").on(table.forTo),
    index("comic_history_source_id_user_id_idx").on(
      table.userId,
      table.sourceId
    ),
    index("comic_history_user_id_source_id_comic_text_id_idx").on(
      table.userId,
      table.sourceId,
      table.comicTextId
    ),
    index("comic_history_v_chap_idx").on(table.vChap),
    foreignKey({
      columns: [table.forTo],
      foreignColumns: [table.id]
    }),
    unique("comic_history__user_source_comic_date_created__idx").on(
      table.userId,
      table.sourceId,
      table.comicTextId,
      table.dateCreated
    )
  ]
)
