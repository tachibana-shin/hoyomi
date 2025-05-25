import { createRoute, OpenAPIHono, z } from "@hono/zod-openapi"
import { Comic } from "../../services/comic.ts"
import { useUser } from "../../logic/use-user.ts"
import { AuthorizationSchema } from "../../schema/authorization.ts"

const GetListFollowQuerySchema = z
  .object({
    sourceId: z.string().optional().openapi({
      example: "tonikaku-kawaii-season-2",
      description: "Lọc theo sourceId (tùy chọn)"
    }),
    page: z.coerce.number().int().min(1).default(1).openapi({
      example: 1,
      description: "Trang hiện tại"
    }),
    limit: z.coerce.number().int().min(1).max(100).default(20).openapi({
      example: 20,
      description: "Số lượng mỗi trang"
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
      description: "Danh sách comic đang follow"
    }
  }
})

export const app = new OpenAPIHono()
app.openapi(route, async (c) => {
  const params = c.req.valid("query")
  const user = useUser(c)
  const { items, totalItems, page, totalPages } =
    await Comic.instance.getListFollow(params.sourceId, {
      user_id: user.userId,
      page: params.page,
      limit: params.limit
    })
  return c.json({ items, totalItems, page, totalPages })
})
