import { eq } from "drizzle-orm"

import { db } from "../db/db.ts"
import { users } from "../db/schema.ts"
import { app } from "../firebase-admin.ts"

type DecodedIdToken = Awaited<
  ReturnType<ReturnType<typeof app.auth>["verifyIdToken"]>
>
export type MetaUser = Readonly<{ decode: DecodedIdToken; userId: number }>
const cacheVerify = new Map<string, MetaUser>()
export async function getUser(token: string): Promise<MetaUser> {
  const cache = cacheVerify.get(token)
  if (cache && cache.decode.exp > Date.now() / 1000) return cache

  try {
    const user = await app.auth().verifyIdToken(token)
    let rowExists = await db
      .select()
      .from(users)
      .where(eq(users.user_id, user.uid))
      .limit(1)

    if (!rowExists)
      rowExists = await db
        .insert(users)
        .values({
          user_id: user.uid
        })
        .onConflictDoNothing()
        .returning()

    const out = { decode: user, userId: rowExists[0].id }
    cacheVerify.set(token, out)
    return out
    // deno-lint-ignore no-explicit-any
  } catch (error: any) {
    if (error?.code === "auth/id-token-expired") cacheVerify.delete(token)
    console.log(error.code)
    throw error
  }
}
