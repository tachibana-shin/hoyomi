import {
  comic,
  comicFollows,
  comicHistories,
  comicHistoryChapters,
  comicNewest,
  eiga,
  eigaFollows,
  eigaHistories,
  eigaHistoryChapters,
  users
} from "./schema.ts"

import assert from "node:assert"
import { drizzle } from "drizzle-orm/postgres-js"
import postgres from "postgres"

const DATABASE_URL = Deno.env.get("DATABASE_URL")

assert(DATABASE_URL, "DATABASE_URL is required")

const client = postgres(DATABASE_URL) as unknown as any;

export const db = drizzle({
  client,
  schema: {
    comic,
    comicFollows,
    comicHistories,
    comicHistoryChapters,
    comicNewest,
    eiga,
    eigaFollows,
    eigaHistories,
    eigaHistoryChapters,
    users
  }
})
