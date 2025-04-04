import { Hono } from "hono"
import { z } from "zod"
import { zValidator } from "@hono/zod-validator"
import { Eiga } from "../../services/eiga.ts"
import { useUser } from "../../logic/use-user.ts"

export const app = new Hono()
const schema = z.object({
  sourceId: z.string().min(1),
  name: z.string().min(1),
  poster: z.string().min(1),
  eiga_text_id: z.string().min(1),
  season_name: z.string().min(1),
  cur: z.number(),
  dur: z.number(),
  episode_name: z.string(),
  episode_id: z.string()
})
app.post("/eiga/set-watch-time", zValidator("json", schema), async (c) => {
  const params = c.req.valid("json")

  const user = useUser(c)

  await Eiga.setWatchTime(params.sourceId, { user_id: user.userId, ...params })

  return c.json({
    success: true
  })
})
