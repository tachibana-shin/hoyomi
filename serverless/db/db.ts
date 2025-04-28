import { drizzle } from "drizzle-orm/postgres-js"
import postgres from "postgres"
import assert from "node:assert"
import {
  comicHistories,
  comicHistoryChapters,
  eigaHistories,
  eigaHistoryChapters,
  users
} from "./schema.ts"

const DATABASE_URL = Deno.env.get("DATABASE_URL")

assert(DATABASE_URL, "DATABASE_URL is required")

const client = postgres(DATABASE_URL)
export const db = drizzle({
  client: client,
  schema: {
    comicHistories,
    comicHistoryChapters,
    eigaHistories,
    eigaHistoryChapters,
    users
  }
})
