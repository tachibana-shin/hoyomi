import { integer, pgTable, varchar, timestamp } from "drizzle-orm/pg-core"
import { sql } from "drizzle-orm";

export const users = pgTable("users", {
  id: integer().primaryKey().generatedAlwaysAsIdentity(),
  // user_id from firebase_auth
  user_id: varchar({ length: 28 }).notNull().unique(),
  created_at: timestamp().notNull().default(sql`NOW()`),
})
