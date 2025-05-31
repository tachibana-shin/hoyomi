import { createRoute, OpenAPIHono, z } from "@hono/zod-openapi"
import { Comic } from "../../services/comic.ts"
import { useUser } from "../../logic/use-user.ts"
import { AuthorizationSchema } from "../../schema/authorization.ts"

const HasFollowQuerySchema = z
  .object({
    sourceId: z.string().openapi({
      example: "tonikaku-kawaii-season-2",
      description: "The unique identifier for the source (e.g., the series or season)."
    }),
    comic_text_id: z.string().openapi({
      example: "ep-01",
      description: "The identifier for the specific comic text."
    })
  })
  .openapi("HasFollowQuerySchema")

export const HasFollowResponseSchema = z
  .object({
    has_follow: z.boolean().openapi({
      description: "Whether the user is following this comic."
    })
  })
  .openapi("HasFollowResponse", {
    description: "Indicates if the user follows the specified comic."
  })

const route = createRoute({
  method: "get",
  path: "/comic/has-follow",
  request: {
    query: HasFollowQuerySchema,
    headers: AuthorizationSchema
  },
  responses: {
    200: {
      content: {
        "application/json": {
          schema: HasFollowResponseSchema
        }
      },
      description: "Check if the user follows the specified comic."
    }
  }
})

export const app = new OpenAPIHono()
app.openapi(route, async (c) => {
  const params = c.req.valid("query")
  const user = useUser(c)

  const has_follow = await Comic.instance.hasFollow(params.sourceId, {
    user_id: user.userId,
    comic_text_id: params.comic_text_id
  })

  return c.json({ has_follow })
})
