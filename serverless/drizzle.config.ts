import "dotenv/config"
import { defineConfig } from "drizzle-kit"
import process from "node:process"

export default defineConfig({
  out: "./drizzle",
  schema: "./db/schema.ts",
  dialect: "postgresql",
  dbCredentials: parsePostgresUrl(process.env.DATABASE_URL!)
})

function parsePostgresUrl(url: string) {
  const regex =
    /^postgres:\/\/([^:]+):([^@]+)@([^:]+):(\d+)\/([^?]+)\?sslmode=(.+)$/
  const match = url.match(regex)

  if (!match) {
    throw new Error("Invalid Postgres connection string")
  }

  const [, user, password, host, port, database, ssl] = match

  return {
    host,
    port: parseInt(port, 10),
    user,
    password,
    database,
    ssl: ssl as "require"
  }
}
