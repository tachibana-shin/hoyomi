import "dotenv/config"
import { defineConfig } from "drizzle-kit"
import process from "node:process"
import { parsePostgresUrl } from "./logic/parse-postgresl-url.ts"

export default defineConfig({
  out: "./drizzle",
  schema: "./db/schema.ts",
  dialect: "postgresql",
  dbCredentials: parsePostgresUrl(process.env.DATABASE_URL!)
})
