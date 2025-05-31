import { createRoute, OpenAPIHono, z } from "@hono/zod-openapi"
import { Eiga } from "../../services/eiga.ts"
import { useUser } from "../../logic/use-user.ts"
import { AuthorizationSchema } from "../../schema/authorization.ts"

const HasFollowQuerySchema = z
  .object({
    sourceId: z.string().openapi({
      example: "kimetsu-no-yaiba",
      description: "The unique identifier for the source (e.g., the series or season)."
    }),
    eiga_text_id: z.string().openapi({
      example: "ep-01",
      description: "The identifier for the specific eiga text."
    })
  })
  .openapi("HasEigaFollowQuerySchema")

export const HasFollowResponseSchema = z
  .object({
    has_follow: z.boolean().openapi({
      description: "Whether the user is following this eiga."
    })
  })
  .openapi("HasEigaFollowResponse", {
    description: "Indicates if the user follows the specified eiga."
  })

const route = createRoute({
  method: "get",
  path: "/eiga/has-follow",
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
      description: "Check if the user follows the specified eiga."
    }
  }
})

export const app = new OpenAPIHono()
app.openapi(route, async (c) => {
  const params = c.req.valid("query")
  const user = useUser(c)

  const has_follow = await Eiga.instance.hasFollow(params.sourceId, {
    user_id: user.userId,
    eiga_text_id: params.eiga_text_id
  })

  return c.json({ has_follow })
})
