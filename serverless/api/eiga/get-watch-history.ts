import { createRoute, OpenAPIHono, z } from "@hono/zod-openapi"
import { Eiga } from "../../services/eiga.ts"
import { useUser } from "../../logic/use-user.ts"
import { AuthorizationSchema } from "../../schema/authorization.ts"

const GetWatchHistoryQuerySchema = z
  .object({
    sourceId: z.string().openapi({
      example: "tonikaku-kawaii-season-2",
      description:
        "The unique identifier for the source (e.g., the series or season)."
    }),
    page: z.coerce.number().min(1).openapi({
      example: 1,
      description: "The page number for paginated results."
    })
  })
  .openapi("GetWatchHistoryQuerySchema")

const EigaListWatchHistorySchema = z
  .object({
    data: z.array(
      z.object({
        created_at: z.string().openapi({
          description: "The timestamp when the watch history entry was created."
        }),
        eiga_text_id: z.string().openapi({
          description: "The identifier for the specific episode of the text."
        }),
        name: z.string().openapi({
          description:
            "The name of the watch history item (e.g., the episode title)."
        }),
        original_name: z.string(),
        poster: z.string().openapi({
          description: "The URL for the poster image of the episode."
        }),
        season_name: z.string().optional().default("").openapi({
          description: "The name of the season the episode belongs to."
        }),
        source_id: z.string().openapi({
          description: "The source ID associated with the episode."
        }),
        watch_cur: z.number().openapi({
          description: "The current watch position in seconds."
        }),
        watch_dur: z.number().openapi({
          description: "The total duration of the episode in seconds."
        }),
        watch_id: z.string().openapi({
          description: "The unique identifier for the watch session."
        }),
        watch_name: z.string().openapi({
          description: "The name associated with the watch session."
        }),
        watch_updated_at: z.string().openapi({
          description:
            "The timestamp when the watch history entry was last updated."
        })
      })
    )
  })
  .openapi("EigaListWatchHistory", {
    description:
      "An array of watch history items. Schema representing an individual watch history item."
  })

const route = createRoute({
  method: "get",
  path: "/eiga/get-watch-history",
  request: {
    query: GetWatchHistoryQuerySchema,
    headers: AuthorizationSchema
  },
  responses: {
    200: {
      content: {
        "application/json": {
          schema: EigaListWatchHistorySchema
        }
      },
      description:
        "Retrieve the list of watch history entries for the specified source."
    }
  }
})

export const app = new OpenAPIHono()
app.openapi(route, async (c) => {
  const params = c.req.valid("query")

  const user = useUser(c)

  const watchHistory = await Eiga.instance.getWatchHistory(params.sourceId, {
    user_id: user.userId,
    ...params,
    limit: 30
  })

  return c.json({ data: watchHistory })
})
