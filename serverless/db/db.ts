import { drizzle } from "drizzle-orm/xata-http"
import { getXataClient } from "../xata.ts"
import { users } from "./schema.ts"

const xata = getXataClient()
export const db = drizzle(xata, { schema: { users } })
