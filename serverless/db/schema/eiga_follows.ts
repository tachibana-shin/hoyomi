import { pgTable, integer, timestamp, text } from "drizzle-orm/pg-core"
import { eiga } from "./eiga.ts"

export const eigaFollowsName = "eiga_follows"
export const eigaFollows = pgTable(eigaFollowsName, {
  id: integer("id").primaryKey().generatedAlwaysAsIdentity(),
  eigaId: integer("eiga_id")
    .references(() => eiga.id)
    .notNull()
    .unique(),
  currentEpisodeName: text("current_episode_name").notNull(),
  currentEpisodeId: text("current_episode_id").notNull(),
  currentEpisodeTime: timestamp("current_episode_time"),
  createdAt: timestamp("created_at", { withTimezone: true })
    .notNull()
    .defaultNow()
})
