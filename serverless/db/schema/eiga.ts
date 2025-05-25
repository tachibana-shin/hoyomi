import {
  pgTable,
  integer,
  text,
  timestamp,
  index,
  unique
} from "drizzle-orm/pg-core"
import { users } from "./users.ts"

export const eigaName = "eiga_"
export const eiga = pgTable(
  eigaName,
  {
    id: integer("id").primaryKey().generatedAlwaysAsIdentity(),
    userId: integer("user_id")
      .notNull()
      .references(() => users.id),
    sourceId: text("source_id").notNull(),
    eigaTextId: text("eiga_text_id").notNull(),
    name: text("name").notNull(),
    originalName: text("original_name").notNull().default(""),
    poster: text("poster").notNull(),
    seasonName: text("season_name").default(""),
    createdAt: timestamp("created_at", { withTimezone: true })
      .notNull()
      .defaultNow()
  },
  (table) => [
    index("eiga_user_id_idx").on(table.userId),
    index("eiga_source_id_idx").on(table.sourceId),
    index("eiga_source_id_user_id_idx").on(table.userId, table.sourceId),
    index("eiga_user_id_source_id_eiga_text_id_idx").on(
      table.userId,
      table.sourceId,
      table.eigaTextId
    ),
    unique("eiga__user_source_eiga_date_created__idx").on(
      table.userId,
      table.sourceId,
      table.eigaTextId
    )
  ]
)
