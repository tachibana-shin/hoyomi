import { BaseService } from "../service"
import {
  type ComicHome,
  type ComicCategory,
  type MetaComic,
  type OImage,
  type Comic,
  ComicModes
} from "../main"

export abstract class ABComicService extends BaseService {
  readonly type = "comic"

  abstract getURL(comicId: string, chapterId?: string): Promise<string>

  abstract home(): Promise<ComicHome>

  abstract getCategory(params: {
    categoryId: string
    page: number
    filters: { [key: string]: string[] | null }
  }): Promise<ComicCategory>

  getExplorer(
    page: number,
    filters?: { [key: string]: string[] | null }
  ): Promise<ComicCategory> {
    throw new UnimplementedError()
  }

  abstract getDetails(comicId: string): Promise<MetaComic>
  abstract getPages(manga: string, chap: string): Promise<OImage[]>

  fetchPage(buffer: Uint8Array, source: OImage): Promise<Uint8Array> {
    throw new UnimplementedError()
  }

  getSuggest(comic: MetaComic, page?: number): Promise<Comic[]> {
    throw new UnimplementedError()
  }

  abstract search(params: {
    keyword: string
    page: number
    filters: { [key: string]: string[] | null }
    quick: boolean
  }): Promise<ComicCategory>

  // Utils
  getComicModes(comic: MetaComic): ComicModes {
    throw new UnimplementedError()
  }
}
