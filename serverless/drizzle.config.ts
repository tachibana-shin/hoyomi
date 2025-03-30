import "dotenv/config"
import { defineConfig } from "drizzle-kit"
import process from "node:process"

export default defineConfig({
  out: "./drizzle",
  schema: "./db/schema.ts",
  dialect: "postgresql",
  dbCredentials: {
    // biome-ignore lint/style/noNonNullAssertion: <explanation>
    url: process.env.XATA_DATABASE_URL!
  }
})
