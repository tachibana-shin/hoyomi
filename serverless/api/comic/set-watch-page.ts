import { createRoute, OpenAPIHono, z } from "@hono/zod-openapi"
import { Comic } from "../../services/comic.ts"
import { useUser } from "../../logic/use-user.ts"
import { AuthorizationSchema } from "../../schema/authorization.ts"

const SetWatchPageBodySchema = z
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
    original_name: z.string().openapi({
      example: "とにかくかわいい",
      description: "Comic raw name."
    }),
    poster: z.string().min(1).openapi({
      description: "URL to the poster image for the episode.",
      example: "https://example.com/poster.jpg"
    }),
    comic_text_id: z.string().min(1).openapi({
      description: "Unique identifier for the comic (movie/show) text.",
      example: "comic-001"
    }),
    season_name: z.string().min(1).or(z.literal("")).optional().openapi({
      description: "The name of the season.",
      example: "Season 1"
    }),
    cur: z.number().openapi({
      description: "The current watch page in seconds.",
      example: 120
    }),
    dur: z.number().openapi({
      description: "The total page of the episode in seconds.",
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
  .openapi("SetWatchPageBodySchema")

const SuccessResponseSchema = z.object({
  success: z.boolean().openapi({
    description: "Indicates whether the watch page was successfully set.",
    example: true
  })
})

const route = createRoute({
  method: "post",
  path: "/comic/set-watch-page",
  request: {
    body: {
      required: true,
      content: {
        "application/json": {
          schema: SetWatchPageBodySchema
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
        "The response indicating the success status of setting the watch page."
    }
  }
})

export const app = new OpenAPIHono()
app.openapi(route, async (c) => {
  const params = c.req.valid("json")

  const user = useUser(c)

  await Comic.instance.setWatchTime(params.sourceId, {
    user_id: user.userId,
    ...params
  })

  return c.json({
    success: true
  })
})
