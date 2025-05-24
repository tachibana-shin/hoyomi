import { and, eq, desc, sql } from "drizzle-orm"
// import { PgDialect } from "drizzle-orm/pg-core"
import { db } from "../db/db.ts"
import { comic, comicHistories, comicHistoryChapters } from "../db/schema.ts"
import { single } from "../logic/single.ts"

// biome-ignore lint/complexity/noStaticOnlyClass: <explanation>
export class Comic {
  static async getWatchHistory(
    sourceId: string | void,
    params: {
      user_id: number
      page: number
      limit: number
    }
  ) {
    // const pgDialect = new PgDialect()
    const query = sourceId
      ? sql`
select
  ${comic.sourceId} as source_id,
  ${comic.comicTextId} as comic_text_id,
  ${comic.name} as name,
  ${comic.poster} as poster,
  ${comic.seasonName} as season_name,
  ${comicHistories.createdAt} as created_at,
  ${comicHistoryChapters.updatedAt} as watch_updated_at,
  ${comicHistoryChapters.name} as watch_name,
  ${comicHistoryChapters.chapId} as watch_id,
  ${comicHistoryChapters.cur} as watch_cur,
  ${comicHistoryChapters.dur} as watch_dur
from
  ${comicHistories}
left join lateral (
  select
    *
  from
    ${comic}
  where
    ${comic.id} = ${comicHistories.comicId}
  limit
    1
) ${comic} on TRUE
left join lateral (
  select
    *
  from
    ${comicHistoryChapters}
  where
    (${comicHistories.vChap} is not null and  ${comicHistoryChapters.id} = ${
          comicHistories.vChap
        }) or
    (${comicHistories.vChap} is     null and (${
          comicHistoryChapters.comicHistoryId
        } = ${comicHistories.forTo} or ${
          comicHistoryChapters.comicHistoryId
        } = ${comicHistories.id}))
  order by
    ${comicHistoryChapters.updatedAt} desc
  limit
    1
) ${comicHistoryChapters} on TRUE
where
  ${comic.sourceId} = ${sourceId} and
  ${comic.userId}   = ${params.user_id}
order by
  ${comicHistories.createdAt} desc
limit
  ${params.limit} offset ${(params.page - 1) * params.limit}
`
      : sql`
select
  ${comic.sourceId} as source_id,
  ${comic.comicTextId} as comic_text_id,
  ${comic.name} as name,
  ${comic.poster} as poster,
  ${comic.seasonName} as season_name,
  ${comic.createdAt} as created_at,
  ${comicHistoryChapters.updatedAt} as watch_updated_at,
  ${comicHistoryChapters.name} as watch_name,
  ${comicHistoryChapters.chapId} as watch_id,
  ${comicHistoryChapters.cur} as watch_cur,
  ${comicHistoryChapters.dur} as watch_dur
from
  ${comicHistories}
left join lateral (
  select
    *
  from
    ${comic}
  where
    ${comic.id} = ${comicHistories.comicId}
  limit
    1
) ${comic} on TRUE
left join lateral (
  select
    *
  from
    ${comicHistoryChapters}
  where
    (${comicHistories.vChap} is not null and  ${comicHistoryChapters.id} = ${
          comicHistories.vChap
        }) or
    (${comicHistories.vChap} is     null and (${
          comicHistoryChapters.comicHistoryId
        } = ${comicHistories.forTo} or ${
          comicHistoryChapters.comicHistoryId
        } = ${comicHistories.id}))
  order by
    ${comicHistoryChapters.updatedAt} desc
  limit
    1
) ${comicHistoryChapters} on TRUE
where
  ${comic.userId}   = ${params.user_id}
order by
  ${comicHistories.createdAt} desc
limit
  ${params.limit} offset ${(params.page - 1) * params.limit}
`

    return (await db.execute(query)).rows as {
      created_at: string
      comic_text_id: string
      name: string
      poster: string
      season_name?: string
      source_id: string
      watch_cur: number
      watch_dur: number
      watch_id: string
      watch_name: string
      watch_updated_at: string
    }[]
    // sql`
    //   ${comicHistoryChapters.id} in (
    //     SELECT h_alt.${comicHistories.id.name} FROM comic_histories h_alt
    //     WHERE
    //       h_alt.${comicHistories.sourceId.name} = ${comicHistories.sourceId} AND
    //       h_alt.${comicHistories.userId.name} = ${comicHistories.userId} AND
    //       h_alt.${comicHistories.comicTextId.name} = ${comicHistories.comicTextId}
    //   )
    // `
  }

  static async setWatchTime(
    sourceId: string,
    params: {
      user_id: number
      name: string
      poster: string
      comic_text_id: string
      season_name?: string
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

    const lastHistory = single(
      await db
        .select({
          id: comicHistories.id,
          forTo: comicHistories.forTo,
          createdAt: comicHistories.createdAt,

          comicTextId: comic.comicTextId,
          seasonName: comic.seasonName
        })
        .from(comicHistories)
        .leftJoin(comic, eq(comic.id, comicHistories.comicId))
        .where(
          and(eq(comic.sourceId, sourceId), eq(comic.userId, params.user_id))
        )
        .orderBy(desc(comicHistories.createdAt))
        .limit(1)
    )

    // if lastHistory is current history
    if (
      lastHistory?.comicTextId === params.comic_text_id &&
      (lastHistory.seasonName ?? "") === (params.season_name ?? "")
    ) {
      const values = {
        comicHistoryId: lastHistory.forTo ?? lastHistory.id,
        cur: params.cur,
        dur: params.dur,
        name: params.episode_name,
        updatedAt: new Date(),
        chapId: params.episode_id
      }
      const [{ id }] = await db
        .insert(comicHistoryChapters)
        .values(values)
        .onConflictDoUpdate({
          target: [
            comicHistoryChapters.comicHistoryId,
            comicHistoryChapters.chapId
          ],
          set: values
        })
        .returning({ id: comicHistoryChapters.id })

      // check the time lastHistory equal to current date. !==> if the last history is today
      if (lastHistory.createdAt.toDateString() === new Date().toDateString()) {
        // update the last history

        // update the last history with new chapter id
        db.update(comic).set({
          name: params.name,
          poster: params.poster,
          seasonName: params.season_name || null
        })
        await db
          .update(comicHistories)
          .set({
            // forTo not update
            vChap: id,
            createdAt: new Date()
          })
          .where(eq(comicHistories.id, lastHistory.id))
      } else {
        // insert new history
        const { id: comicId } = single(
          await db
            .insert(comic)
            .values({
              sourceId: sourceId,
              userId: params.user_id,
              comicTextId: params.comic_text_id,
              name: params.name,
              poster: params.poster,
              seasonName: params.season_name || null
            })
            .onConflictDoUpdate({
              target: [comic.sourceId, comic.userId, comic.comicTextId],
              set: {
                name: params.name,
                poster: params.poster,
                seasonName: params.season_name || null
              }
            })
            .returning({ id: comic.id })
        )!

        await db.insert(comicHistories).values({
          comicId,
          forTo: lastHistory.forTo ?? lastHistory.id,
          vChap: id
        })
      }
    } else {
      // insert new history
      // find movie exists in history
      const existsHistory = single(
        await db
          .select({
            id: comicHistories.id,
            forTo: comicHistories.forTo,
            createdAt: comicHistories.createdAt
          })
          .from(comicHistories)
          .leftJoin(comic, eq(comic.id, comicHistories.comicId))
          .where(
            and(
              eq(comic.sourceId, sourceId),
              eq(comic.userId, params.user_id),
              eq(comic.comicTextId, params.comic_text_id)
            )
          )
          .limit(1)
      )
      // exists history is any row . if row.forTo is null then this row is parent
      // if row.forTo not null it parent
      if (existsHistory) {
        const values = {
          comicHistoryId: existsHistory.forTo ?? existsHistory.id,
          cur: params.cur,
          dur: params.dur,
          name: params.episode_name,
          updatedAt: new Date(),
          chapId: params.episode_id
        }
        const [{ id }] = await db
          .insert(comicHistoryChapters)
          .values(values)
          .onConflictDoUpdate({
            target: [
              comicHistoryChapters.comicHistoryId,
              comicHistoryChapters.chapId
            ],
            set: values
          })
          .returning({ id: comicHistoryChapters.id })

        const { id: comicId } = single(
          await db
            .insert(comic)
            .values({
              sourceId: sourceId,
              userId: params.user_id,
              comicTextId: params.comic_text_id,
              name: params.name,
              poster: params.poster,
              seasonName: params.season_name || null
            })
            .onConflictDoUpdate({
              target: [comic.sourceId, comic.userId, comic.comicTextId],
              set: {
                name: params.name,
                poster: params.poster,
                seasonName: params.season_name || null
              }
            })
            .returning({ id: comic.id })
        )!
        await db.insert(comicHistories).values({
          comicId,
          forTo: existsHistory.forTo ?? existsHistory.id,
          vChap: id
        })
      } else {
        const { id: comicId } = single(
          await db
            .insert(comic)
            .values({
              sourceId: sourceId,
              userId: params.user_id,
              comicTextId: params.comic_text_id,
              name: params.name,
              poster: params.poster,
              seasonName: params.season_name || null
            })
            .onConflictDoUpdate({
              target: [comic.sourceId, comic.userId, comic.comicTextId],
              set: {
                name: params.name,
                poster: params.poster,
                seasonName: params.season_name || null
              }
            })
            .returning({ id: comic.id })
        )!
        const [{ id }] = await db
          .insert(comicHistories)
          .values({
            comicId,
            forTo: null, // this is parent
            vChap: null
          })
          .returning({ id: comicHistories.id })

        const values = {
          comicHistoryId: id,
          cur: params.cur,
          dur: params.dur,
          name: params.episode_name,
          updatedAt: new Date(),
          chapId: params.episode_id
        }
        const [{ id: rowChapId }] = await db
          .insert(comicHistoryChapters)
          .values(values)
          .onConflictDoUpdate({
            target: [
              comicHistoryChapters.comicHistoryId,
              comicHistoryChapters.chapId
            ],
            set: values
          })
          .returning({ id: comicHistoryChapters.id })

        await db
          .update(comicHistories)
          .set({ vChap: rowChapId })
          .where(eq(comicHistories.id, id))
      }
    }
  }
  static async getWatchTime(
    sourceId: string,
    params: {
      user_id: number
      comic_text_id: string
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
    return single(
      await db
        .select({
          cur: comicHistoryChapters.cur,
          dur: comicHistoryChapters.dur,
          name: comicHistoryChapters.name,
          createdAt: comicHistoryChapters.createdAt,
          updatedAt: comicHistoryChapters.updatedAt
        })
        .from(comicHistoryChapters)
        .leftJoin(
          comicHistories,
          eq(comicHistories.id, comicHistoryChapters.comicHistoryId)
        )
        .leftJoin(comic, eq(comic.id, comicHistories.comicId))
        .where(
          and(
            eq(comic.sourceId, sourceId),
            eq(comic.userId, params.user_id),
            eq(comic.comicTextId, params.comic_text_id),
            eq(comicHistoryChapters.chapId, params.chap_id)
          )
        )
        .orderBy(desc(comicHistoryChapters.updatedAt))
        .limit(1)
    )
  }
  static async getWatchTimeEpisodes(
    sourceId: string,
    params: {
      user_id: number
      comic_text_id: string
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
        cur: comicHistoryChapters.cur,
        dur: comicHistoryChapters.dur,
        name: comicHistoryChapters.name,
        createdAt: comicHistoryChapters.createdAt,
        updatedAt: comicHistoryChapters.updatedAt,
        chapId: comicHistoryChapters.chapId
      })
      .from(comicHistoryChapters)
      .leftJoin(
        comicHistories,
        eq(comicHistoryChapters.comicHistoryId, comicHistories.id)
      )
      .leftJoin(comic, eq(comic.id, comicHistories.comicId))
      .where(
        and(
          eq(comic.sourceId, sourceId),
          eq(comic.userId, params.user_id),
          eq(comic.comicTextId, params.comic_text_id)
        )
      )
      .orderBy(comicHistories.id)
  }
}
