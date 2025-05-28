import { createRoute, OpenAPIHono, z } from "@hono/zod-openapi"
import { Comic } from "../../services/comic.ts"
import { useUser } from "../../logic/use-user.ts"
import { AuthorizationSchema } from "../../schema/authorization.ts"
import { StatusEnum } from "../../db/enum/status_enum.ts"

const SetFollowBodySchema = z
  .object({
    sourceId: z.string().openapi({
      example: "tonikaku-kawaii-season-2",
      description:
        "The unique identifier for the source (e.g., the series or season)."
    }),
    comic_text_id: z.string().openapi({
      example: "ep-01",
      description: "The identifier for the specific comic text."
    }),
    name: z.string().openapi({
      example: "Tonikaku Kawaii",
      description: "Comic name."
    }),
    original_name: z.string().openapi({
      example: "とにかくかわいい",
      description: "Comic raw name."
    }),
    poster: z.string().openapi({
      example: "https://example.com/poster.jpg",
      description: "Poster image URL."
    }),
    season_name: z.string().optional().openapi({
      example: "Season 2",
      description: "Season name (optional)."
    }),
    status: z.enum(StatusEnum).openapi({
      example: "ongoing",
      description: "Comic status."
    }),
    current_chapter_name: z.string().openapi({
      example: "Chapter 1",
      description: "Current chapter name."
    }),
    current_chapter_full_name: z.string().openapi({
      example: "The Beginning",
      description: "Current chapter full name."
    }),
    current_chapter_id: z.string().openapi({
      example: "ch-01",
      description: "Current chapter id."
    }),
    current_chapter_time: z
      .string()
      .datetime({
        local: true
      })
      .optional()
      .openapi({
        example: "2024-05-01T12:00:00Z",
        description: "Current chapter time (ISO string)."
      }),
    value: z.boolean().openapi({
      example: true,
      description: "Set to true to follow, false to unfollow."
    })
  })
  .openapi("SetFollowBodySchema")

export const SetFollowResponseSchema = z
  .object({
    ok: z.boolean().openapi({
      description: "Whether the operation was successful."
    })
  })
  .openapi("SetFollowResponse", {
    description: "Indicates if the follow/unfollow operation succeeded."
  })

const route = createRoute({
  method: "post",
  path: "/comic/set-follow",
  openapi: {
    summary: "Set or unset follow for a comic",
    tags: ["Comic"],
    operationId: "setComicFollow"
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
      description: "Set or unset follow for the specified comic."
    }
  }
})

export const app = new OpenAPIHono()
app.openapi(route, async (c) => {
  const body = await c.req.valid("json")
  const user = useUser(c)

  await Comic.instance.setFollow(
    body.sourceId,
    {
      user_id: user.userId,
      ...body,
      current_chapter_time: body.current_chapter_time
        ? new Date(body.current_chapter_time)
        : undefined
    },
    body.value
  )

  return c.json({ ok: true })
})
