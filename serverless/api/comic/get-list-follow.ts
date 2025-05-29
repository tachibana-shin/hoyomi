import { createRoute, OpenAPIHono, z } from "@hono/zod-openapi"
import { Comic } from "../../services/comic.ts"
import { useUser } from "../../logic/use-user.ts"
import { AuthorizationSchema } from "../../schema/authorization.ts"
import { StatusEnum } from "../../db/enum/status_enum.ts"

const GetListFollowQuerySchema = z
  .object({
    sourceId: z.string().optional().openapi({
      example: "tonikaku-kawaii-season-2",
      description: "Filter by sourceId (optional)"
    }),
    status: z.enum(StatusEnum).optional().openapi({
      example: "ongoing",
      description: "Filter by comic status (e.g., ongoing, completed)"
    }),
    ignore: z
      .array(
        z.object({
          sourceId: z.string().openapi({
            example: "tonikaku-kawaii-season-2",
            description: "Source ID to exclude from results"
          }),
          comic_text_id: z.string().min(1).openapi({
            description: "Comic text ID to exclude from results",
            example: "comic-001"
          })
        })
      )
      .optional()
      .openapi({
        example: [
          {
            sourceId: "tonikaku-kawaii-season-2",
            comic_text_id: "comic-001"
          }
        ],
        description: "List of comics to ignore from the follow result"
      }),
    page: z.coerce.number().int().min(1).default(1).openapi({
      example: 1,
      description: "Current page number"
    }),
    limit: z.coerce.number().int().min(1).max(100).default(20).openapi({
      example: 20,
      description: "Number of items per page"
    })
  })
  .openapi("GetComicListFollowQuery")

const ComicFollowItemSchema = z.object({
  created_at: z.string().openapi({ example: "2024-05-01T12:00:00Z" }),
  comic_text_id: z.string(),
  name: z.string(),
  original_name: z.string(),
  poster: z.string(),
  season_name: z.string().nullable(),
  source_id: z.string(),
  chapter_name: z.string(),
  chapter_id: z.string(),
  chapter_time: z.string().nullable()
})

const GetListFollowResponseSchema = z.object({
  items: z.array(ComicFollowItemSchema),
  totalItems: z.number().int(),
  page: z.number().int(),
  totalPages: z.number().int()
})

const route = createRoute({
  method: "get",
  path: "/comic/get-list-follow",
  request: {
    query: GetListFollowQuerySchema,
    headers: AuthorizationSchema
  },
  responses: {
    200: {
      content: {
        "application/json": {
          schema: GetListFollowResponseSchema
        }
      },
      description: "List of comics followed by the user"
    }
  }
})

export const app = new OpenAPIHono()
app.openapi(route, async (c) => {
  const params = c.req.valid("query")
  const user = useUser(c)
  const { items, totalItems, page, totalPages } =
    await Comic.instance.getListFollow(
      params.sourceId,
      {
        user_id: user.userId,
        page: params.page,
        limit: params.limit
      },
      params.status,
      params.ignore
    )
  return c.json({ items, totalItems, page, totalPages })
})
