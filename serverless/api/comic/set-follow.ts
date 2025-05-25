import { createRoute, OpenAPIHono, z } from "@hono/zod-openapi"
import { Comic } from "../../services/comic.ts"
import { useUser } from "../../logic/use-user.ts"
import { AuthorizationSchema } from "../../schema/authorization.ts"

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
    poster: z.string().openapi({
      example: "https://example.com/poster.jpg",
      description: "Poster image URL."
    }),
    season_name: z.string().optional().openapi({
      example: "Season 2",
      description: "Season name (optional)."
    }),
    chapter_Id: z.string().openapi({
      example: "ch-01",
      description: "Current chapter id."
    }),
    current_chapters: z
      .array(
        z.object({
          name: z.string(),
          fullName: z.string().optional(),
          order: z.number(),
          chapterId: z.string(),
          time: z.string().datetime().optional()
        })
      )
      .openapi({
        description: "Array of chapter meta info."
      }),
    value: z.boolean().openapi({
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
      name: body.name,
      poster: body.poster,
      comic_text_id: body.comic_text_id,
      season_name: body.season_name,
      chapterId: body.chapter_Id,
      current_chapters: body.current_chapters.map((chapter) => ({
        ...chapter,
        time: chapter.time ? new Date(chapter.time) : undefined
      }))
    },
    body.value
  )

  return c.json({ ok: true })
})
