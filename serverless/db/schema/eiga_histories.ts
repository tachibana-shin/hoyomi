import {
  pgTable,
  integer,
  text,
  timestamp,
  foreignKey,
  index
} from "drizzle-orm/pg-core"
import { users } from "./users.ts"
import { eigaHistoryChapters } from "./eiga_history_chapters.ts";

export const eigaHistories = pgTable(
  "eiga_histories",
  {
    id: integer("id").primaryKey().generatedAlwaysAsIdentity(),
    userId: integer("user_id").notNull(),
    eigaTextId: text("eiga_text_id").notNull(),
    name: text("name").notNull(),
    poster: text("poster").notNull(),
    seasonName: text("season_name").notNull(),
    forTo: integer("for_to"),
    vChap: integer("v_chap"),
    createdAt: timestamp("created_at", { withTimezone: true })
      .notNull()
      .defaultNow()
  },
  (table) => [
    index("eiga_history_user_id_idx").on(table.userId),
    index("eiga_history_for_to_idx").on(table.forTo),
    index("eiga_history_user_id_eiga_text_id_idx").on(table.userId, table.eigaTextId),
    index("eiga_history_v_chap_idx").on(table.vChap),
    foreignKey({
      columns: [table.forTo],
      foreignColumns: [table.id]
    }),
    foreignKey({
      columns: [table.userId],
      foreignColumns: [users.id]
    }),
    foreignKey({
      columns: [table.vChap],
      foreignColumns: [eigaHistoryChapters.id]
    })
  ]
)
