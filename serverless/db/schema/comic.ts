import {
  pgTable,
  integer,
  text,
  timestamp,
  index,
  unique,
  pgEnum
} from "drizzle-orm/pg-core"
import { users } from "./users.ts"
import { StatusEnum } from "../enum/status_enum.ts"

export const comicName = "comic"
export const comic = pgTable(
  comicName,
  {
    id: integer("id").primaryKey().generatedAlwaysAsIdentity(),
    userId: integer("user_id")
      .notNull()
      .references(() => users.id),
    sourceId: text("source_id").notNull(),
    comicTextId: text("comic_text_id").notNull(),
    name: text("name").notNull(),
    originalName: text("original_name").notNull().default(""),
    poster: text("poster").notNull(),
    seasonName: text("season_name").default(""),
    status: pgEnum("status", StatusEnum)().notNull(),
    createdAt: timestamp("created_at", { withTimezone: true })
      .notNull()
      .defaultNow()
  },
  (table) => [
    index("comic_user_id_idx").on(table.userId),
    index("comic_source_id_idx").on(table.sourceId),
    index("comic_source_id_user_id_idx").on(table.userId, table.sourceId),
    index("comic_user_id_source_id_comic_text_id_idx").on(
      table.userId,
      table.sourceId,
      table.comicTextId
    ),
    unique("comic__user_source_comic_date_created__idx").on(
      table.userId,
      table.sourceId,
      table.comicTextId
    )
  ]
)
