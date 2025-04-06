import { createRoute, OpenAPIHono, z } from "@hono/zod-openapi"
import { Eiga } from "../../services/eiga.ts"
import { useUser } from "../../logic/use-user.ts"
import { AuthorizationSchema } from "../../schema/authorization.ts"

const BodySchema = z
  .object({
    sourceId: z.string().min(1).openapi({
      description:
        "The unique identifier for the source (e.g., series or season).",
      example: "tonikaku-kawaii-season-2"
    }),
    name: z.string().min(1).openapi({
      description: "The name of the episode.",
      example: "Episode 1"
    }),
    poster: z.string().min(1).openapi({
      description: "URL to the poster image for the episode.",
      example: "https://example.com/poster.jpg"
    }),
    eiga_text_id: z.string().min(1).openapi({
      description: "Unique identifier for the eiga (movie/show) text.",
      example: "eiga-001"
    }),
    season_name: z.string().min(1).openapi({
      description: "The name of the season.",
      example: "Season 1"
    }),
    cur: z.number().openapi({
      description: "The current watch time in seconds.",
      example: 120
    }),
    dur: z.number().openapi({
      description: "The total duration of the episode in seconds.",
      example: 1500
    }),
    episode_name: z.string().min(1).openapi({
      description: "The name of the episode.",
      example: "Episode 1"
    }),
    episode_id: z.string().min(1).openapi({
      description: "Unique identifier for the episode.",
      example: "episode-001"
    })
  })
  .openapi("QuerySchema")

const SuccessResponseSchema = z.object({
  success: z.boolean().openapi({
    description: "Indicates whether the watch time was successfully set.",
    example: true
  })
})

const route = createRoute({
  method: "post",
  path: "/eiga/set-watch-time",
  request: {
    body: {
      required: true,
      content: {
        "application/json": {
          schema: BodySchema
        }
      }
    },
    headers: AuthorizationSchema
  },
  responses: {
    200: {
      content: {
        "application/json": {
          schema: SuccessResponseSchema
        }
      },
      description:
        "The response indicating the success status of setting the watch time."
    }
  }
})

export const app = new OpenAPIHono()
app.openapi(route, async (c) => {
  const params = c.req.valid("json")

  const user = useUser(c)

  await Eiga.setWatchTime(params.sourceId, { user_id: user.userId, ...params })

  return c.json({
    success: true
  })
})
