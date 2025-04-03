import { asc, and, or, eq, desc, isNull, isNotNull, exists } from "drizzle-orm"

import { db } from "../db/db.ts"
import { eigaHistories, eigaHistoryChapters } from "../db/schema.ts"

// biome-ignore lint/complexity/noStaticOnlyClass: <explanation>
export class Eiga {
  static getWatchHistory(
    sourceId: string,
    params: {
      user_id: number,
      page: number,
      limit: number
    }
  ) {
    return db
      .select({
        sourceId: eigaHistories.sourceId,
        eigaTextId: eigaHistories.eigaTextId,
        name: eigaHistories.name,
        poster: eigaHistories.poster,
        seasonName: eigaHistories.seasonName,
        createdAt: eigaHistories.createdAt,
        watchUpdatedAt: eigaHistoryChapters.updatedAt,
        watchName: eigaHistoryChapters.name,
        watchId: eigaHistoryChapters.chapId,
        watchCur: eigaHistoryChapters.cur,
        watchDur: eigaHistoryChapters.dur
      })
      .from(eigaHistories)
      .leftJoin(
        eigaHistoryChapters,
        or(
          and(
            isNull(eigaHistories.vChap),
            eq(eigaHistoryChapters.id, eigaHistories.vChap)
          ),
          and(
            isNotNull(eigaHistories.vChap),
            eq(eigaHistoryChapters.id, eigaHistories.forTo)
          )
          // sql`
          //   ${eigaHistoryChapters.id} in (
          //     SELECT h_alt.${eigaHistories.id.name} FROM eiga_histories h_alt
          //     WHERE
          //       h_alt.${eigaHistories.sourceId.name} = ${eigaHistories.sourceId} AND
          //       h_alt.${eigaHistories.userId.name} = ${eigaHistories.userId} AND
          //       h_alt.${eigaHistories.eigaTextId.name} = ${eigaHistories.eigaTextId}
          //   )
          // `
        )
      )
      .where(
        and(
        eq(eigaHistories.sourceId, sourceId),
        eq(eigaHistories.userId, params.user_id)
      ))
      .orderBy(desc(eigaHistories.createdAt))
      .limit(params.limit)
      .offset((params.page - 1) * params.limit)
  }

  static async setWatchTime(
    sourceId: string,
    params: {
      user_id: number
      name: string
      poster: string
      eiga_text_id: string
      season_name: string
      cur: number
      dur: number
      episode_name: string
      episode_id: string
    }
  ): Promise<void> {
    if (params.dur <= 0) {
      throw new Error("Duration must be greater than 0")
    }

    if (params.dur < params.cur) {
      throw new Error("Duration must be current")
    }

    let latestHistory = await db
      .select()
      .from(eigaHistories)
      .where(
        and(
          eq(eigaHistories.sourceId, sourceId),
          eq(eigaHistories.userId, params.user_id),
          eq(eigaHistories.eigaTextId, params.eiga_text_id)
        )
      )
      .orderBy(desc(eigaHistories.createdAt))
      .limit(1)
    let idHistoryRax = await db
      .select({
        id: eigaHistories.id
      })
      .from(eigaHistories)
      .where(
        and(
          eq(eigaHistories.sourceId, sourceId),
          eq(eigaHistories.userId, params.user_id),
          eq(eigaHistories.eigaTextId, params.eiga_text_id),
          exists(
            db
              .select({ id: eigaHistoryChapters.id })
              .from(eigaHistoryChapters)
              .where(eq(eigaHistoryChapters.eigaHistoryId, eigaHistories.id))
              .limit(1)
          )
        )
      )
      .orderBy(asc(eigaHistories.createdAt))
      .limit(1)

    // -- Insert new history if it does not exist or is not the latest for today
    if (
      latestHistory.length === 0 ||
      latestHistory[0].createdAt.toDateString() !== new Date().toDateString()
    ) {
      const result = await db
        .insert(eigaHistories)
        .values({
          sourceId: sourceId,
          userId: params.user_id,
          eigaTextId: params.eiga_text_id,
          name: params.episode_name,
          poster: params.poster,
          seasonName: params.season_name,
          forTo: idHistoryRax[0]?.id ?? null,
          vChap: null
        })
        .returning()

      if (idHistoryRax.length === 0) {
        idHistoryRax = result
      }

      latestHistory = []
    }

    if (idHistoryRax.length === 0) {
      throw new Error("Failed to retrieve or create history record")
    }

    // -- Check if the chapter already exists for the history record
    const values = {
      eigaHistoryId: idHistoryRax[0].id,
      cur: params.cur,
      dur: params.dur,
      name: params.episode_name,
      updatedAt: new Date(),
      chapId: params.episode_id
    }
    const [{ id: idChap }] = await db
      .insert(eigaHistoryChapters)
      .values(values)
      .onConflictDoUpdate({
        target: [eigaHistoryChapters.eigaHistoryId, eigaHistoryChapters.chapId],
        set: values
      })
      .returning({ id: eigaHistoryChapters.id })

    if (latestHistory.length === 0) {
      await db
        .update(eigaHistories)
        .set({
          vChap: idChap
        })
        .where(eq(eigaHistories.id, idHistoryRax[0].id))
    } else {
      await db
        .update(eigaHistories)
        .set({
          vChap: idChap
        })
        .where(eq(eigaHistories.id, latestHistory[0].id))
    }
  }
  static async getWatchTime(
    sourceId: string,
    params: {
      user_id: number
      eiga_text_id: string
      chap_id: string
    }
  ) {
    // SELECT c.created_at, c.cur, c.dur, c.name, c.updated_at
    // FROM public.chaps c
    // JOIN public.history h ON c.history_id = h.id
    // JOIN public.users u ON h.user_id = u.id
    // WHERE u.uuid = user_uid
    // AND h.season = season_id
    // AND c.chap_id = p_chap_id
    // ORDER BY c.updated_at DESC
    // limit 1;
    const row = await db
      .select({
        cur: eigaHistoryChapters.cur,
        dur: eigaHistoryChapters.dur,
        name: eigaHistoryChapters.name,
        createdAt: eigaHistoryChapters.createdAt,
        updatedAt: eigaHistoryChapters.updatedAt
      })
      .from(eigaHistoryChapters)
      .leftJoin(
        eigaHistories,
        eq(eigaHistories.id, eigaHistoryChapters.eigaHistoryId)
      )
      .where(
        and(
          eq(eigaHistories.sourceId, sourceId),
          eq(eigaHistories.userId, params.user_id),
          eq(eigaHistories.eigaTextId, params.eiga_text_id),
          eq(eigaHistoryChapters.chapId, params.chap_id)
        )
      )
      .orderBy(desc(eigaHistoryChapters.updatedAt))
      .limit(1)

    return row[0] as typeof row[0] | null
  }
  static async getWatchTimeEpisodes(
    sourceId: string,
    params: {
      user_id: number
      eiga_text_id: string
    }
  ) {
    // BEGIN
    //     RETURN QUERY
    //    SELECT
    //     chaps.created_at,
    //     chaps.cur,
    //     chaps.dur,
    //     chaps.name,
    //     chaps.updated_at,
    //     chaps.chap_id
    // FROM
    //     chaps
    // JOIN
    //     public.history ON chaps.history_id = history.id
    // JOIN
    //     public.users ON history.user_id = users.id
    // WHERE
    //     users.uuid = user_uid
    //     AND history.season = season_id
    // ORDER BY
    //     history.id;
    // END;
    return await db
      .select({
        cur: eigaHistoryChapters.cur,
        dur: eigaHistoryChapters.dur,
        name: eigaHistoryChapters.name,
        createdAt: eigaHistoryChapters.createdAt,
        updatedAt: eigaHistoryChapters.updatedAt,
        chapId: eigaHistoryChapters.chapId
      })
      .from(eigaHistoryChapters)
      .leftJoin(
        eigaHistories,
        eq(eigaHistoryChapters.eigaHistoryId, eigaHistories.id)
      )
      .where(
        and(
          eq(eigaHistories.sourceId, sourceId),
          eq(eigaHistories.userId, params.user_id),
          eq(eigaHistories.eigaTextId, params.eiga_text_id)
        )
      )
      .orderBy(eigaHistories.id)
  }
}
