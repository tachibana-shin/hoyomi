import { createRoute, OpenAPIHono, z } from "@hono/zod-openapi"
import { Eiga } from "../../services/eiga.ts"
import { useUser } from "../../logic/use-user.ts"
import { AuthorizationSchema } from "../../schema/authorization.ts"

const GetWatchTimeQuerySchema = z
  .object({
    sourceId: z.string().min(1).openapi({
      example: "tonikaku-kawaii-season-2",
      description:
        "The unique identifier for the source, such as the season name or series ID."
    }),
    eiga_text_id: z.string().min(1).openapi({
      example: "eiga-001",
      description:
        "The unique identifier for the eiga (movie/show) text, used to specify the content."
    }),
    chap_id: z.string().min(1).openapi({
      example: "chap-001",
      description:
        "The unique identifier for the specific chapter within the episode or series."
    })
  })
  .openapi("GetWatchTimeQuerySchema")

const WatchTimeSchema = z
  .object({
    data: z
      .object({
        cur: z.number().openapi({
          example: 120,
          description: "The current time in seconds for the episode."
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
            "ISO 8601 format timestamp when the watch time was recorded."
        }),
        updatedAt: z.string().openapi({
          example: "2025-04-06T13:00:00Z",
          description:
            "ISO 8601 format timestamp when the watch time was last updated."
        })
      })
      .nullable()
  })
  .openapi("WatchTimeSchema", {
    description:
      "The watch time object, which can be null if no data is available."
  })

const route = createRoute({
  method: "get",
  path: "/eiga/get-watch-time",
  request: {
    query: GetWatchTimeQuerySchema,
    headers: AuthorizationSchema
  },
  responses: {
    200: {
      content: {
        "application/json": {
          schema: WatchTimeSchema
        }
      },
      description:
        "The watch time object, which can be null if no data is available for the requested episode."
    }
  }
})

export const app = new OpenAPIHono()
app.openapi(route, async (c) => {
  const params = c.req.valid("query")

  const user = useUser(c)

  const watchTime = await Eiga.getWatchTime(params.sourceId, {
    user_id: user.userId,
    ...params
  })

  return c.json({ data: watchTime })
})
