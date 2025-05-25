import { createRoute, OpenAPIHono, z } from "@hono/zod-openapi"
import { Comic } from "../../services/comic.ts"
import { useUser } from "../../logic/use-user.ts"
import { AuthorizationSchema } from "../../schema/authorization.ts"

const GetWatchPageQuerySchema = z
  .object({
    sourceId: z.string().min(1).openapi({
      example: "tonikaku-kawaii-season-2",
      description:
        "The unique identifier for the source, such as the season name or series ID."
    }),
    comic_text_id: z.string().min(1).openapi({
      example: "comic-001",
      description:
        "The unique identifier for the comic (movie/show) text, used to specify the content."
    }),
    chap_id: z.string().min(1).openapi({
      example: "chap-001",
      description:
        "The unique identifier for the specific chapter within the episode or series."
    })
  })
  .openapi("GetWatchPageQuerySchema")

const WatchPageSchema = z
  .object({
    data: z
      .object({
        cur: z.number().openapi({
          example: 120,
          description: "The current page in seconds for the episode."
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
            "ISO 8601 format pagestamp when the watch page was recorded."
        }),
        updatedAt: z.string().openapi({
          example: "2025-04-06T13:00:00Z",
          description:
            "ISO 8601 format pagestamp when the watch page was last updated."
        })
      })
      .nullable()
  })
  .openapi("WatchPageSchema", {
    description:
      "The watch page object, which can be null if no data is available."
  })

const route = createRoute({
  method: "get",
  path: "/comic/get-watch-page",
  request: {
    query: GetWatchPageQuerySchema,
    headers: AuthorizationSchema
  },
  responses: {
    200: {
      content: {
        "application/json": {
          schema: WatchPageSchema
        }
      },
      description:
        "The watch page object, which can be null if no data is available for the requested episode."
    }
  }
})

export const app = new OpenAPIHono()
app.openapi(route, async (c) => {
  const params = c.req.valid("query")

  const user = useUser(c)

  const watchPage = await Comic.instance.getWatchTime(params.sourceId, {
    user_id: user.userId,
    ...params
  })

  return c.json({ data: watchPage })
})
