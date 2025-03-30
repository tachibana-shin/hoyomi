import { Hono } from "hono"
import { z } from "npm:zod"
import { Eiga } from "../../services/eiga.ts"
import { useUser } from "../../logic/use-user.ts"
import { zValidator } from "@hono/zod-validator"

export const app = new Hono()
const schema = z.object({
  eiga_text_id: z.string().min(1),
  chap_id: z.string().min(1)
})
app.get("/eiga/get-watch-time", zValidator("json", schema), async (c) => {
  const params = c.req.valid("json")

  const user = useUser(c)

  const watchTime = await Eiga.getWatchTime({ user_id: user.userId, ...params })

  return c.json(watchTime)
})
