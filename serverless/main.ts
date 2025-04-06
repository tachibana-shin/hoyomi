import "@std/dotenv/load"
import { OpenAPIHono } from "@hono/zod-openapi"
import { logger } from "hono/logger"
import { etag } from "hono/etag"
import { bearerAuth } from "hono/bearer-auth"
import { swaggerUI } from "@hono/swagger-ui"
import { getUser } from "./logic/get-user.ts"
import pkg from "./package.json" with {type: "json"}

import { app as appGetWatchHistory } from "./api/eiga/get-watch-history.ts"
import { app as appGetWatchTimeEpisodes } from "./api/eiga/get-watch-time-episodes.ts"
import { app as appGetWatchTime } from "./api/eiga/get-watch-time.ts"
import { app as appSetWatchTime } from "./api/eiga/set-watch-time.ts"

const app = new OpenAPIHono()

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

app.route("/api", appGetWatchHistory)
app.route("/api", appGetWatchTimeEpisodes)
app.route("/api", appGetWatchTime)
app.route("/api", appSetWatchTime)

app.get("/ui", swaggerUI({ url: "/general-api.swagger" }))

app.doc("/general-api.swagger", {
  openapi: "3.0.0",
  info: {
    version: pkg.version,
    title: "Hoyomi General API"
  }
})

Deno.serve(app.fetch)
