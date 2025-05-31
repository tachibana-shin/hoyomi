import {
  pgTable,
  integer,
  timestamp,
  foreignKey,
  index,
  date
} from "drizzle-orm/pg-core"
import { eigaHistoryChapters } from "./eiga_history_chapters.ts"
import { eiga } from "./eiga.ts"

export const eigaHistoriesName = "eiga_histories"
export const eigaHistories = pgTable(
  eigaHistoriesName,
  {
    id: integer("id").primaryKey().generatedAlwaysAsIdentity(),
    eigaId: integer("eiga_id")
      .notNull()
      .references(() => eiga.id),
    forTo: integer("for_to"),
    vChap: integer("v_chap").references(() => eigaHistoryChapters.id),
    dateCreated: date("date_created").notNull().defaultNow(),
    createdAt: timestamp("created_at", { withTimezone: true })
      .notNull()
      .defaultNow()
  },
  (table) => [
    index("eiga_history_comic_id_idx").on(table.eigaId),
    index("eiga_history_for_to_idx").on(table.forTo),
    index("eiga_history_v_chap_idx").on(table.vChap),
    foreignKey({
      columns: [table.forTo],
      foreignColumns: [table.id]
    }),
    index("eiga_history_date_created_idx").on(table.dateCreated)
  ]
)
