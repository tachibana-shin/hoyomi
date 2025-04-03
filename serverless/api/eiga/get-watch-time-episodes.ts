import { Hono } from "hono"
import { z } from "npm:zod"
import { Eiga } from "../../services/eiga.ts"
import { useUser } from "../../logic/use-user.ts"
import { zValidator } from "@hono/zod-validator"

export const app = new Hono()
const schema = z.object({
  sourceId: z.string().min(1),
  eiga_text_id: z.string().min(1)
})
app.get("/eiga/get-watch-time-episodes", zValidator("json", schema), async (c) => {
  const params = c.req.valid("json")

  const user = useUser(c)

  const watchTime = await Eiga.getWatchTimeEpisodes(params.sourceId, {
    user_id: user.userId,
    ...params
  })

  return c.json(watchTime)
})
