import { createRoute, OpenAPIHono, z } from "@hono/zod-openapi"
import { Comic } from "../../services/comic.ts"
import { useUser } from "../../logic/use-user.ts"
import { AuthorizationSchema } from "../../schema/authorization.ts"

const GetWatchPageEpisodesQuerySchema = z
  .object({
    sourceId: z.string().min(1).openapi({
      example: "tonikaku-kawaii-season-2",
      description:
        "The unique identifier for the source, typically a string representing the season."
    }),
    comic_text_id: z.string().min(1).openapi({
      example: "comic-001",
      description:
        "The unique identifier for the comic (movie/show) text. This helps identify the specific content."
    })
  })
  .openapi("GetWatchPageEpisodesQuerySchema")

const ListWatchPageSchema = z
  .object({
    data: z.array(
      z.object({
        cur: z.number().openapi({
          example: 120,
          description: "The current page in the episode in seconds."
        }),
        dur: z.number().openapi({
          example: 1500,
          description: "The total page of the episode in seconds."
        }),
        name: z.string().openapi({
          example: "Episode 1",
          description: "The name of the episode."
        }),
        createdAt: z.string().openapi({
          example: "2025-04-06T12:34:56Z",
          description:
            "Page when the watch page was recorded, in ISO 8601 format."
        }),
        updatedAt: z.string().openapi({
          example: "2025-04-06T13:00:00Z",
          description:
            "Page when the watch page was last updated, in ISO 8601 format."
        }),
        chapId: z.string().openapi({
          example: "chap-001",
          description:
            "The unique identifier for the chapter within the episode or series."
        })
      })
    )
  })
  .openapi("ListWatchPageSchema", {
    description:
      "A list of watch page entries, each representing the page watched for a specific episode."
  })

const route = createRoute({
  method: "get",
  path: "/comic/get-watch-page-episodes",
  request: {
    query: GetWatchPageEpisodesQuerySchema,
    headers: AuthorizationSchema
  },
  responses: {
    200: {
      content: {
        "application/json": {
          schema: ListWatchPageSchema
        }
      },
      description:
        "Retrieve the list of watch page episodes based on the provided sourceId and comic_text_id."
    }
  }
})

export const app = new OpenAPIHono()
app.openapi(route, async (c) => {
  const params = c.req.valid("query")

  const user = useUser(c)

  const watchPage = await Comic.instance.getWatchTimeEpisodes(params.sourceId, {
    user_id: user.userId,
    ...params
  })

  return c.json({ data: watchPage })
})
