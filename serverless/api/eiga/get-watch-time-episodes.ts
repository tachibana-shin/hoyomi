import { createRoute, OpenAPIHono, z } from "@hono/zod-openapi"
import { Eiga } from "../../services/eiga.ts"
import { useUser } from "../../logic/use-user.ts"
import { AuthorizationSchema } from "../../schema/authorization.ts"

const QuerySchema = z
  .object({
    sourceId: z.string().min(1).openapi({
      example: "tonikaku-kawaii-season-2",
      description:
        "The unique identifier for the source, typically a string representing the season."
    }),
    eiga_text_id: z.string().min(1).openapi({
      example: "eiga-001",
      description:
        "The unique identifier for the eiga (movie/show) text. This helps identify the specific content."
    })
  })
  .openapi("QuerySchema")

const ListWatchTimeSchema = z
  .object({
    data: z.array(
      z.object({
        cur: z.number().openapi({
          example: 120,
          description: "The current position in the episode in seconds."
        }),
        dur: z.number().openapi({
          example: 1500,
          description: "The total duration of the episode in seconds."
        }),
        name: z.string().openapi({
          example: "Episode 1",
          description: "The name of the episode."
        }),
        createdAt: z.string().openapi({
          example: "2025-04-06T12:34:56Z",
          description:
            "Timestamp when the watch time was recorded, in ISO 8601 format."
        }),
        updatedAt: z.string().openapi({
          example: "2025-04-06T13:00:00Z",
          description:
            "Timestamp when the watch time was last updated, in ISO 8601 format."
        }),
        chapId: z.string().openapi({
          example: "chap-001",
          description:
            "The unique identifier for the chapter within the episode or series."
        })
      })
    )
  })
  .openapi("ListWatchTimeSchema", {
    description:
      "A list of watch time entries, each representing the time watched for a specific episode."
  })

const route = createRoute({
  method: "get",
  path: "/eiga/get-watch-time-episodes",
  request: {
    query: QuerySchema,
    headers: AuthorizationSchema
  },
  responses: {
    200: {
      content: {
        "application/json": {
          schema: ListWatchTimeSchema
        }
      },
      description:
        "Retrieve the list of watch time episodes based on the provided sourceId and eiga_text_id."
    }
  }
})

export const app = new OpenAPIHono()
app.openapi(route, async (c) => {
  const params = c.req.valid("query")

  const user = useUser(c)

  const watchTime = await Eiga.getWatchTimeEpisodes(params.sourceId, {
    user_id: user.userId,
    ...params
  })

  return c.json({ data: watchTime })
})
