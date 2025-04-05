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
import { eigaHistoryChapters } from "./eiga_history_chapters.ts"

export const eigaHistoriesName = "eiga_histories"
export const eigaHistories = pgTable(
  eigaHistoriesName,
  {
    id: integer("id").primaryKey().generatedAlwaysAsIdentity(),
    userId: integer("user_id")
      .notNull()
      .references(() => users.id),
    sourceId: text("source_id").notNull(),
    eigaTextId: text("eiga_text_id").notNull(),
    name: text("name").notNull(),
    poster: text("poster").notNull(),
    seasonName: text("season_name").notNull(),
    forTo: integer("for_to"),
    vChap: integer("v_chap").references(() => eigaHistoryChapters.id),
    dateCreated: date("date_created").notNull().defaultNow(),
    createdAt: timestamp("created_at", { withTimezone: true })
      .notNull()
      .defaultNow()
  },
  (table) => [
    index("eiga_history_user_id_idx").on(table.userId),
    index("eiga_history_source_id_idx").on(table.sourceId),
    index("eiga_history_for_to_idx").on(table.forTo),
    index("eiga_history_source_id_user_id_idx").on(
      table.userId,
      table.sourceId
    ),
    index("eiga_history_user_id_source_id_eiga_text_id_idx").on(
      table.userId,
      table.sourceId,
      table.eigaTextId
    ),
    index("eiga_history_v_chap_idx").on(table.vChap),
    foreignKey({
      columns: [table.forTo],
      foreignColumns: [table.id]
    }),
    unique("eiga_history__user_source_eiga_date_created__idx").on(
      table.userId,
      table.sourceId,
      table.eigaTextId,
      table.dateCreated
    )
  ]
)
