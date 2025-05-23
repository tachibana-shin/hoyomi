import {
  pgTable,
  integer,
  text,
  timestamp,
  doublePrecision,
  index,
  unique
  // foreignKey
} from "drizzle-orm/pg-core"
import { eigaHistories } from "./eiga_histories.ts"
import { relations } from "drizzle-orm"
// import { eigaHistories } from "./eiga_histories.ts"

export const eigaHistoryChapters = pgTable(
  "eiga_history_chapters",
  {
    id: integer("id").primaryKey().generatedAlwaysAsIdentity(),
    eigaHistoryId: integer("eiga_history_id").notNull(),
    cur: doublePrecision("cur").notNull(),
    dur: doublePrecision("dur").notNull(),
    name: text("name").notNull(),
    updatedAt: timestamp("updated_at", { withTimezone: true }).notNull(),
    chapId: text("chap_id").notNull(),
    createdAt: timestamp("created_at", { withTimezone: true })
      .notNull()
      .defaultNow()
  },
  (table) => [
    unique("unique_chap_id_eiga_history_id_idx").on(
      table.chapId,
      table.eigaHistoryId
    ),
    index("eiga_history_id_idx").on(table.eigaHistoryId)
  ]
)

export const eigaHistoryChaptersRelations = relations(
  eigaHistoryChapters,
  ({ one }) => {
    return {
      eigaHistory: one(eigaHistories, {
        fields: [eigaHistoryChapters.eigaHistoryId],
        references: [eigaHistories.id]
      })
    }
  }
)
