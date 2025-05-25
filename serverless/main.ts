import "@std/dotenv/load"
import { OpenAPIHono } from "@hono/zod-openapi"
import { logger } from "hono/logger"
import { etag } from "hono/etag"
import { bearerAuth } from "hono/bearer-auth"
import { swaggerUI } from "@hono/swagger-ui"
import { getUser } from "./logic/get-user.ts"
import pkg from "./package.json" with {type: "json"}

import { app as comicGetWatchHistory } from "./api/comic/get-watch-history.ts"
import { app as comicGetWatchTimeEpisodes } from "./api/comic/get-watch-page-episodes.ts"
import { app as comicGetWatchTime } from "./api/comic/get-watch-page.ts"
import { app as comicSetWatchTime } from "./api/comic/set-watch-page.ts"
import { app as comicHasFollow } from "./api/comic/has-follow.ts"
import { app as comicSetFollow } from "./api/comic/set-follow.ts"

import { app as eigaGetWatchHistory } from "./api/eiga/get-watch-history.ts"
import { app as eigaGetWatchTimeEpisodes } from "./api/eiga/get-watch-time-episodes.ts"
import { app as eigaGetWatchTime } from "./api/eiga/get-watch-time.ts"
import { app as eigaSetWatchTime } from "./api/eiga/set-watch-time.ts"
import { app as eigaHasFollow } from "./api/eiga/has-follow.ts"
import { app as eigaSetFollow } from "./api/eiga/set-follow.ts"

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

app.route("/api", comicGetWatchHistory)
app.route("/api", comicGetWatchTimeEpisodes)
app.route("/api", comicGetWatchTime)
app.route("/api", comicSetWatchTime)

app.route("/api", comicHasFollow)
app.route("/api", comicSetFollow)

app.route("/api", eigaGetWatchHistory)
app.route("/api", eigaGetWatchTimeEpisodes)
app.route("/api", eigaGetWatchTime)
app.route("/api", eigaSetWatchTime)

app.route("/api", eigaHasFollow)
app.route("/api", eigaSetFollow)

app.get("/ui", swaggerUI({ url: "/general-api.swagger" }))

app.doc("/general-api.swagger", {
  openapi: "3.0.0",
  info: {
    version: pkg.version,
    title: "Hoyomi General API"
  }
})

Deno.serve(app.fetch)
