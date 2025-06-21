import {
  ABEigaService,
  createOImage,
  registerPlugin,
  StatusEnum,
  type EigaCategory,
  type EigaEpisode,
  type EigaEpisodes,
  type EigaHome,
  type MetaEiga,
  type ServerSource,
  type ServiceInit,
  type SourceVideo
} from ".."

class TestEiga extends ABEigaService {
  async getURL(eigaId: string, chapterId?: string): Promise<string> {
    return "https://google.com"
  }
  async home(): Promise<EigaHome> {
    const data: EigaHome = {
      categories: [
        {
          name: "Hello",
          items: [
            {
              name: "Hello",
              eigaId: "jgewkgewgew",
              image: createOImage("httsp://google.com/favicon.ico")
            }
          ]
        }
      ]
    }

    return data
  }
  async getCategory(params: {
    categoryId: string
    page: number
    filters: { [key: string]: string[] | null }
  }): Promise<EigaCategory> {
    const data: EigaCategory = {
      name: "Hello",
      url: "",
      items: [
        {
          name: "Hello",
          eigaId: "jgewkgewgew",
          image: createOImage("httsp://google.com/favicon.ico")
        }
      ],
      page: 0,
      totalItems: 0,
      totalPages: 0
    }

    return data
  }
  async getDetails(eigaId: string): Promise<MetaEiga> {
    const data: MetaEiga = {
      name: "Hello",
      image: createOImage("https://google.com/favicon.ico"),
      status: StatusEnum.Ongoing,
      genres: [],
      description: "",
      seasons: [
        {
          name: "Chapter 1",
          eigaId: "season-1"
        }
      ]
    }

    return data
  }
  async getEpisodes(eigaId: string): Promise<EigaEpisodes> {
    const data: EigaEpisodes = {
      episodes: [
        {
          name: "test",
          episodeId: "test"
        }
      ]
    }

    return data
  }
  async getSource(params: {
    eigaId: string
    episode: EigaEpisode
    server?: ServerSource
  }): Promise<SourceVideo> {
    const data: SourceVideo = {
      src: "",
      url: "",
      type: ""
    }

    return data
  }
  search(params: {
    keyword: string
    page: number
    filters: { [key: string]: string[] | null }
    quick: boolean
  }): Promise<EigaCategory> {
    return this.getCategory({
      categoryId: "",
      page: 0,
      filters: {}
    })
  }
  override init: ServiceInit = {
    name: "test eiga",
    faviconUrl: createOImage("https://google.com/favicon.ico"),
    rootUrl: "https://google.com"
  }
}

registerPlugin(TestEiga)