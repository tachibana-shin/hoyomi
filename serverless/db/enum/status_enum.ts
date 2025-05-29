import { pgEnum } from "drizzle-orm/pg-core";

export const StatusEnum = [
  "ongoing",
  "completed",
  "cancelled",
  "unknown",
  "on_hiatus",
  "publishing_finished"
] as const
export const pgStatus = pgEnum("text", StatusEnum)
