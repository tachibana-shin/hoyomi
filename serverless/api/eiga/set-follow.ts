import { createRoute, OpenAPIHono, z } from "@hono/zod-openapi"
import { Eiga } from "../../services/eiga.ts"
import { useUser } from "../../logic/use-user.ts"
import { AuthorizationSchema } from "../../schema/authorization.ts"

const SetFollowBodySchema = z
  .object({
    sourceId: z.string().openapi({
      example: "kimetsu-no-yaiba",
      description: "The unique identifier for the source (e.g., the series or season)."
    }),
    eiga_text_id: z.string().openapi({
      example: "ep-01",
      description: "The identifier for the specific eiga text."
    }),
    name: z.string().openapi({
      example: "Kimetsu no Yaiba",
      description: "Eiga name."
    }),
    original_name: z.string().openapi({
      example: "鬼滅の刃",
      description: "Eiga raw name."
    }),
    poster: z.string().openapi({
      example: "https://example.com/poster.jpg",
      description: "Poster image URL."
    }),
    season_name: z.string().optional().openapi({
      example: "Season 1",
      description: "Season name (optional)."
    }),
    current_episode_name: z.string().openapi({
      example: "Episode 1",
      description: "Current episode name."
    }),
    current_episode_id: z.string().openapi({
      example: "ep-01",
      description: "Current episode id."
    }),
    current_episode_time: z.string().datetime().optional().openapi({
      example: "2024-05-01T12:00:00Z",
      description: "Current episode time (ISO string)."
    }),
    value: z.boolean().openapi({
      example: true,
      description: "Set to true to follow, false to unfollow."
    })
  })
  .openapi("SetEigaFollowBodySchema")

export const SetFollowResponseSchema = z
  .object({
    ok: z.boolean().openapi({
      description: "Whether the operation was successful."
    })
  })
  .openapi("SetEigaFollowResponse", {
    description: "Indicates if the follow/unfollow operation succeeded."
  })

const route = createRoute({
  method: "post",
  path: "/eiga/set-follow",
  openapi: {
    summary: "Set or unset follow for an eiga",
    tags: ["Eiga"],
    operationId: "setEigaFollow"
  },
  request: {
    body: {
      content: {
        "application/json": {
          schema: SetFollowBodySchema
        }
      }
    },
    headers: AuthorizationSchema
  },
  responses: {
    200: {
      content: {
        "application/json": {
          schema: SetFollowResponseSchema
        }
      },
      description: "Set or unset follow for the specified eiga."
    }
  }
})

export const app = new OpenAPIHono()
app.openapi(route, async (c) => {
  const body = await c.req.valid("json")
  const user = useUser(c)

  await Eiga.instance.setFollow(
    body.sourceId,
    {
      user_id: user.userId,
      ...body,
      current_episode_time: body.current_episode_time
        ? new Date(body.current_episode_time)
        : undefined
    },
    body.value
  )

  return c.json({ ok: true })
})
