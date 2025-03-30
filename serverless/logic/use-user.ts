import { Context } from "hono"
import { MetaUser } from "./get-user.ts"

export function useUser(ctx: Context): MetaUser {
  return ctx.env.user
}
