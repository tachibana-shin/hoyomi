import { BaseService } from "../service"
import {
  type MetaEiga,
  type EigaEpisode,
  type SourceVideo,
  type EigaHome,
  type EigaCategory,
  type EigaEpisodes,
  type ServerSource,
  type SourceContent,
  type Subtitle,
  type Vtt,
  type OpeningEnding,
  type Eiga
} from "../main"

export interface EigaSourceContext {
  eigaId: string
  metaEiga: MetaEiga
  episode: EigaEpisode
  source: SourceVideo
}

// Abstract class ABEigaService
export abstract class ABEigaService extends BaseService {
  readonly type = "eiga"

  abstract getURL(eigaId: string, chapterId?: string): Promise<string>

  abstract home(): Promise<EigaHome>

  abstract getCategory(params: {
    categoryId: string
    page: number
    filters: { [key: string]: string[] | null }
  }): Promise<EigaCategory>

  getExplorer(
    page: number,
    filters?: { [key: string]: string[] | null }
  ): Promise<EigaCategory> {
    throw new UnimplementedError()
  }

  abstract getDetails(eigaId: string): Promise<MetaEiga>
  abstract getEpisodes(eigaId: string): Promise<EigaEpisodes>

  getServers(params: {
    eigaId: string
    episode: EigaEpisode
  }): Promise<ServerSource[]> {
    throw new UnimplementedError()
  }

  abstract getSource(params: {
    eigaId: string
    episode: EigaEpisode
    server?: ServerSource
  }): Promise<SourceVideo>

  fetchSourceContent(source: SourceVideo): Promise<SourceContent> {
    throw new UnimplementedError()
  }

  getSubtitles(params: {
    eigaId: string
    episode: EigaEpisode
    source: SourceVideo
  }): Promise<Subtitle[]> {
    throw new UnimplementedError()
  }

  getSeekThumbnail(context: EigaSourceContext): Promise<Vtt | null> {
    throw new UnimplementedError()
  }

  getOpeningEnding(context: EigaSourceContext): Promise<OpeningEnding | null> {
    throw new UnimplementedError()
  }

  getSuggest(params: {
    metaEiga: MetaEiga
    eigaId: string
    page?: number
  }): Promise<Eiga[]> {
    throw new UnimplementedError()
  }

  abstract search(params: {
    keyword: string
    page: number
    filters: { [key: string]: string[] | null }
    quick: boolean
  }): Promise<EigaCategory>
}
