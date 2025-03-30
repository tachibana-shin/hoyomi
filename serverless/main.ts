import "@std/dotenv/load"
import { Hono } from "hono"
import { logger } from "hono/logger"
import { etag } from "hono/etag"
import { bearerAuth } from "hono/bearer-auth"
import { getUser } from "./logic/get-user.ts"

import { app as appGetWatchTimeEpisodes } from "./api/eiga/get-watch-time-episodes.ts"
import { app as appGetWatchTime } from "./api/eiga/get-watch-time.ts"
import { app as appSetWatchTime } from "./api/eiga/set-watch-time.ts"

const app = new Hono()

app.use(logger(), etag())

app.use(
  "/api/*",
  bearerAuth({
    verifyToken: async (token, c) => {
      try {
        const user = await getUser(token)

        c.env.user = user

        return true
      } catch (err) {
        console.warn(err)
        return false
      }
    }
  })
)

app.route("/api", appGetWatchTimeEpisodes)
app.route("/api", appGetWatchTime)
app.route("/api", appSetWatchTime)

Deno.serve(app.fetch)
