import type { Context } from "hono"
import type { MetaUser } from "./get-user.ts"

export function useUser(ctx: Context): MetaUser {
  return ctx.env.user
}
