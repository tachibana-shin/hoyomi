import { and, eq, desc, sql, count, or } from "drizzle-orm"
// import { PgDialect } from "drizzle-orm/pg-core"
import { db } from "../db/db.ts"
import {
  eiga,
  eigaHistories,
  eigaHistoryChapters,
  eigaFollows
} from "../db/schema.ts"
import { single } from "../logic/single.ts"
import { StatusEnum } from "../db/enum/status_enum.ts"

type EigaParams = Readonly<{
  user_id: number
  name: string
  original_name: string
  poster: string
  eiga_text_id: string
  season_name?: string
  status: (typeof StatusEnum)[number]
}>

// biome-ignore lint/complexity/noStaticOnlyClass: <explanation>
export class Eiga {
  static readonly instance = new Eiga()

  private async _saveEiga(sourceId: string, params: EigaParams) {
    const { id: eigaId } = single(
      await db
        .insert(eiga)
        .values({
          sourceId: sourceId,
          userId: params.user_id,
          eigaTextId: params.eiga_text_id,
          name: params.name,
          originalName: params.original_name,
          poster: params.poster,
          seasonName: params.season_name || null,
          status: params.status
        })
        .onConflictDoUpdate({
          target: [eiga.sourceId, eiga.userId, eiga.eigaTextId],
          set: {
            name: params.name,
            poster: params.poster,
            seasonName: params.season_name || null
          }
        })
        .returning({ id: eiga.id })
    )!
    return eigaId
  }

  async getWatchHistory(
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
  ${eiga.sourceId} as source_id,
  ${eiga.eigaTextId} as eiga_text_id,
  ${eiga.name} as name,
  ${eiga.originalName} as original_name,
  ${eiga.poster} as poster,
  ${eiga.seasonName} as season_name,
  ${eigaHistories.createdAt} as created_at,
  ${eigaHistoryChapters.updatedAt} as watch_updated_at,
  ${eigaHistoryChapters.name} as watch_name,
  ${eigaHistoryChapters.chapId} as watch_id,
  ${eigaHistoryChapters.cur} as watch_cur,
  ${eigaHistoryChapters.dur} as watch_dur
from
  ${eigaHistories}
left join lateral (
  select
    *
  from
    ${eiga}
  where
    ${eiga.id} = ${eigaHistories.eigaId}
  limit
    1
) ${eiga} on TRUE
left join lateral (
  select
    *
  from
    ${eigaHistoryChapters}
  where
    (${eigaHistories.vChap} is not null and  ${eigaHistoryChapters.id} = ${
          eigaHistories.vChap
        }) or
    (${eigaHistories.vChap} is     null and (${
          eigaHistoryChapters.eigaHistoryId
        } = ${eigaHistories.forTo} or ${eigaHistoryChapters.eigaHistoryId} = ${
          eigaHistories.id
        }))
  order by
    ${eigaHistoryChapters.updatedAt} desc
  limit
    1
) ${eigaHistoryChapters} on TRUE
where
  ${eiga.sourceId} = ${sourceId} and
  ${eiga.userId}   = ${params.user_id}
order by
  ${eigaHistories.createdAt} desc
limit
  ${params.limit} offset ${(params.page - 1) * params.limit}
`
      : sql`
select
  ${eiga.sourceId} as source_id,
  ${eiga.eigaTextId} as eiga_text_id,
  ${eiga.name} as name,
  ${eiga.originalName} as original_name,
  ${eiga.poster} as poster,
  ${eiga.seasonName} as season_name,
  ${eigaHistories.createdAt} as created_at,
  ${eigaHistoryChapters.updatedAt} as watch_updated_at,
  ${eigaHistoryChapters.name} as watch_name,
  ${eigaHistoryChapters.chapId} as watch_id,
  ${eigaHistoryChapters.cur} as watch_cur,
  ${eigaHistoryChapters.dur} as watch_dur
from
  ${eigaHistories}
left join lateral (
  select
    *
  from
    ${eiga}
  where
    ${eiga.id} = ${eigaHistories.eigaId}
  limit
    1
) ${eiga} on TRUE
left join lateral (
  select
    *
  from
    ${eigaHistoryChapters}
  where
    (${eigaHistories.vChap} is not null and  ${eigaHistoryChapters.id} = ${
          eigaHistories.vChap
        }) or
    (${eigaHistories.vChap} is     null and (${
          eigaHistoryChapters.eigaHistoryId
        } = ${eigaHistories.forTo} or ${eigaHistoryChapters.eigaHistoryId} = ${
          eigaHistories.id
        }))
  order by
    ${eigaHistoryChapters.updatedAt} desc
  limit
    1
) ${eigaHistoryChapters} on TRUE
where
  ${eiga.userId}   = ${params.user_id}
order by
  ${eigaHistories.createdAt} desc
limit
  ${params.limit} offset ${(params.page - 1) * params.limit}
`

    return (await db.execute(query)).rows as {
      created_at: string
      eiga_text_id: string
      name: string
      original_name: string
      poster: string
      season_name: string
      source_id: string
      watch_cur: number
      watch_dur: number
      watch_id: string
      watch_name: string
      watch_updated_at: string
    }[]
    // sql`
    //   ${eigaHistoryChapters.id} in (
    //     SELECT h_alt.${eigaHistories.id.name} FROM eiga_histories h_alt
    //     WHERE
    //       h_alt.${eigaHistories.sourceId.name} = ${eigaHistories.sourceId} AND
    //       h_alt.${eigaHistories.userId.name} = ${eigaHistories.userId} AND
    //       h_alt.${eigaHistories.eigaTextId.name} = ${eigaHistories.eigaTextId}
    //   )
    // `
  }

  async setWatchTime(
    sourceId: string,
    params: EigaParams & {
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
          id: eigaHistories.id,
          forTo: eigaHistories.forTo,
          createdAt: eigaHistories.createdAt,

          eigaTextId: eiga.eigaTextId,
          seasonName: eiga.seasonName
        })
        .from(eigaHistories)
        .innerJoin(eiga, eq(eiga.id, eigaHistories.eigaId))
        .where(
          and(eq(eiga.sourceId, sourceId), eq(eiga.userId, params.user_id))
        )
        .orderBy(desc(eigaHistories.createdAt))
        .limit(1)
    )

    // if lastHistory is current history
    if (
      lastHistory?.eigaTextId === params.eiga_text_id &&
      (lastHistory.seasonName ?? "") === (params.season_name ?? "")
    ) {
      const values = {
        eigaHistoryId: lastHistory.forTo ?? lastHistory.id,
        cur: params.cur,
        dur: params.dur,
        name: params.episode_name,
        updatedAt: new Date(),
        chapId: params.episode_id
      }
      const [{ id }] = await db
        .insert(eigaHistoryChapters)
        .values(values)
        .onConflictDoUpdate({
          target: [
            eigaHistoryChapters.eigaHistoryId,
            eigaHistoryChapters.chapId
          ],
          set: values
        })
        .returning({ id: eigaHistoryChapters.id })

      // check the time lastHistory equal to current date. !==> if the last history is today
      if (lastHistory.createdAt.toDateString() === new Date().toDateString()) {
        // update the last history

        // update the last history with new chapter id
        db.update(eiga).set({
          name: params.name,
          poster: params.poster,
          seasonName: params.season_name || null
        })
        await db
          .update(eigaHistories)
          .set({
            // forTo not update
            vChap: id,
            createdAt: new Date()
          })
          .where(eq(eigaHistories.id, lastHistory.id))
      } else {
        // insert new history
        const eigaId = await this._saveEiga(sourceId, params)

        await db.insert(eigaHistories).values({
          eigaId,
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
            id: eigaHistories.id,
            forTo: eigaHistories.forTo,
            createdAt: eigaHistories.createdAt
          })
          .from(eigaHistories)
          .innerJoin(eiga, eq(eiga.id, eigaHistories.eigaId))
          .where(
            and(
              eq(eiga.sourceId, sourceId),
              eq(eiga.userId, params.user_id),
              eq(eiga.eigaTextId, params.eiga_text_id)
            )
          )
          .limit(1)
      )
      // exists history is any row . if row.forTo is null then this row is parent
      // if row.forTo not null it parent
      if (existsHistory) {
        const values = {
          eigaHistoryId: existsHistory.forTo ?? existsHistory.id,
          cur: params.cur,
          dur: params.dur,
          name: params.episode_name,
          updatedAt: new Date(),
          chapId: params.episode_id
        }
        const [{ id }] = await db
          .insert(eigaHistoryChapters)
          .values(values)
          .onConflictDoUpdate({
            target: [
              eigaHistoryChapters.eigaHistoryId,
              eigaHistoryChapters.chapId
            ],
            set: values
          })
          .returning({ id: eigaHistoryChapters.id })

        const eigaId = await this._saveEiga(sourceId, params)
        await db.insert(eigaHistories).values({
          eigaId,
          forTo: existsHistory.forTo ?? existsHistory.id,
          vChap: id
        })
      } else {
        const eigaId = await this._saveEiga(sourceId, params)
        const [{ id }] = await db
          .insert(eigaHistories)
          .values({
            eigaId,
            forTo: null, // this is parent
            vChap: null
          })
          .returning({ id: eigaHistories.id })

        const values = {
          eigaHistoryId: id,
          cur: params.cur,
          dur: params.dur,
          name: params.episode_name,
          updatedAt: new Date(),
          chapId: params.episode_id
        }
        const [{ id: rowChapId }] = await db
          .insert(eigaHistoryChapters)
          .values(values)
          .onConflictDoUpdate({
            target: [
              eigaHistoryChapters.eigaHistoryId,
              eigaHistoryChapters.chapId
            ],
            set: values
          })
          .returning({ id: eigaHistoryChapters.id })

        await db
          .update(eigaHistories)
          .set({ vChap: rowChapId })
          .where(eq(eigaHistories.id, id))
      }
    }
  }
  async getWatchTime(
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
    return single(
      await db
        .select({
          cur: eigaHistoryChapters.cur,
          dur: eigaHistoryChapters.dur,
          name: eigaHistoryChapters.name,
          createdAt: eigaHistoryChapters.createdAt,
          updatedAt: eigaHistoryChapters.updatedAt
        })
        .from(eigaHistoryChapters)
        .innerJoin(
          eigaHistories,
          eq(eigaHistories.id, eigaHistoryChapters.eigaHistoryId)
        )
        .innerJoin(eiga, eq(eiga.id, eigaHistories.eigaId))
        .where(
          and(
            eq(eiga.sourceId, sourceId),
            eq(eiga.userId, params.user_id),
            eq(eiga.eigaTextId, params.eiga_text_id),
            eq(eigaHistoryChapters.chapId, params.chap_id)
          )
        )
        .orderBy(desc(eigaHistoryChapters.updatedAt))
        .limit(1)
    )
  }
  async getWatchTimeEpisodes(
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
      .innerJoin(
        eigaHistories,
        eq(eigaHistoryChapters.eigaHistoryId, eigaHistories.id)
      )
      .innerJoin(eiga, eq(eiga.id, eigaHistories.eigaId))
      .where(
        and(
          eq(eiga.sourceId, sourceId),
          eq(eiga.userId, params.user_id),
          eq(eiga.eigaTextId, params.eiga_text_id)
        )
      )
      .orderBy(eigaHistories.id)
  }
  async setFollow(
    sourceId: string,
    params: EigaParams & {
      current_episode_name: string
      current_episode_id: string
      current_episode_time?: Date
    },
    value: boolean
  ) {
    const eigaId = await this._saveEiga(sourceId, params)
    if (value)
      await db
        .insert(eigaFollows)
        .values({
          eigaId,
          currentEpisodeName: params.current_episode_name,
          currentEpisodeId: params.current_episode_id,
          currentEpisodeTime: params.current_episode_time ?? null
        })
        .onConflictDoNothing({
          target: [eigaFollows.eigaId]
        })
    else await db.delete(eigaFollows).where(eq(eigaFollows.eigaId, eigaId))
  }

  async hasFollow(
    sourceId: string,
    params: Pick<EigaParams, "user_id" | "eiga_text_id">
  ) {
    return (
      (single(
        await db
          .select({
            exists: count(eigaFollows.id)
          })
          .from(eigaFollows)
          .innerJoin(eiga, eq(eiga.id, eigaFollows.eigaId))
          .where(
            and(
              eq(eiga.sourceId, sourceId),
              eq(eiga.userId, params.user_id),
              eq(eiga.eigaTextId, params.eiga_text_id)
            )
          )
          .limit(1)
      )?.exists ?? 0) > 0
    )
  }

  async getListFollow(
    sourceId: string | void,
    params: {
      user_id: number
      page: number
      limit: number
    },
    status?: (typeof StatusEnum)[number],
    ignore?: {
      sourceId: string
      eiga_text_id: string
    }[]
  ) {
    // Generate ignore conditions if provided
    const ignoreConditions =
      ignore && ignore.length > 0
        ? or(
            ...ignore.map((i) =>
              and(
                eq(eiga.sourceId, i.sourceId),
                eq(eiga.eigaTextId, i.eiga_text_id)
              )
            )
          )
        : undefined

    // Build where clause dynamically
    const whereClause = and(
      ...(sourceId ? [eq(eiga.sourceId, sourceId)] : []),
      eq(eiga.userId, params.user_id),
      ...(status ? [eq(eiga.status, status)] : []),
      ...(ignoreConditions ? [ignoreConditions] : [])
    )

    const items = await db
      .select({
        created_at: eigaFollows.createdAt,
        eiga_text_id: eiga.eigaTextId,
        name: eiga.name,
        original_name: eiga.originalName,
        poster: eiga.poster,
        season_name: eiga.seasonName,
        source_id: eiga.sourceId,
        episode_name: eigaFollows.currentEpisodeName,
        episode_id: eigaFollows.currentEpisodeId,
        episode_time: eigaFollows.currentEpisodeTime
      })
      .from(eigaFollows)
      .innerJoin(eiga, eq(eiga.id, eigaFollows.eigaId))
      .where(whereClause)
      .orderBy(desc(eigaFollows.createdAt))
      .limit(params.limit)
      .offset((params.page - 1) * params.limit)

    const { totalItems } = single(
      await db
        .select({
          totalItems: count()
        })
        .from(eigaFollows)
        .innerJoin(eiga, eq(eiga.id, eigaFollows.eigaId))
        .where(whereClause)
    )!

    return {
      items,
      totalItems,
      page: params.page,
      totalPages: Math.ceil(totalItems / params.limit)
    }
  }
}
