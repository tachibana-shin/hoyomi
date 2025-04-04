import { drizzle } from "drizzle-orm/xata-http"
import { XataClient } from "../xata.ts"
import { eigaHistories, eigaHistoryChapters, users } from "./schema.ts"
import { assert } from "@std/assert"

const apiKey = Deno.env.get("XATA_API_KEY")
assert(apiKey, "XATA_API_KEY missing")

const xata = new XataClient({ apiKey })
export const db = drizzle(xata, {
  schema: { users, eigaHistories, eigaHistoryChapters }
})
