import { drizzle } from "drizzle-orm/node-postgres"
import { Pool } from "pg"
import assert from "node:assert"
import {
  comic,
  comicFollows,
  comicHistories,
  comicHistoryChapters,
  comicNewest,
  eiga,
  eigaHistories,
  eigaHistoryChapters,
  users
} from "./schema.ts"
import { parsePostgresUrl } from "../logic/parse-postgresl-url.ts"

const DATABASE_URL = Deno.env.get("DATABASE_URL")
const DATABASE_CA = Deno.env.get("DATABASE_CA")

assert(DATABASE_URL, "DATABASE_URL is required")

const pool = new Pool({
  ...parsePostgresUrl(DATABASE_URL),
  ssl: {
    ca: DATABASE_CA,
    rejectUnauthorized: false
  }
})

export const db = drizzle({
  client: pool,
  schema: {
    comic,
    comicFollows,
    comicHistories,
    comicHistoryChapters,
    comicNewest,
    eiga,
    eigaHistories,
    eigaHistoryChapters,
    users
  }
})
