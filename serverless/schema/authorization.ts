import { z } from "@hono/zod-openapi"

export const AuthorizationSchema = z.object({
  Authorization: z
    .string()
    .min(1)
    .regex(/^Bearer\s([A-Za-z0-9\-_.]+)$/)
    .openapi({
      description:
        "The Authorization header must be in the format 'Bearer <token>'",
      example: "Bearer your_token_here"
    })
})
