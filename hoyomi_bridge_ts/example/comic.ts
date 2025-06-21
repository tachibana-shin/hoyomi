import {
  ABComicService,
  ComicModes,
  createOImage,
  registerPlugin,
  StatusEnum,
  type ComicCategory,
  type ComicHome,
  type MetaComic,
  type OImage,
  type ServiceInit
} from ".."

class TestComic extends ABComicService {
  override init: ServiceInit = {
    name: "test comic",
    faviconUrl: createOImage("https://google.com/favicon.ico"),
    rootUrl: "https://google.com"
  }

  async getURL(comicId: string, chapterId?: string): Promise<string> {
    return "https://google.com"
  }
  async home(): Promise<ComicHome> {
    const data: ComicHome = {
      categories: [
        {
          name: "Hello",
          items: [
            {
              name: "Hello",
              comicId: "jgewkgewgew",
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
  }): Promise<ComicCategory> {
    const data: ComicCategory = {
      name: "Hello",
      url: "",
      items: [
        {
          name: "Hello",
          comicId: "jgewkgewgew",
          image: createOImage("httsp://google.com/favicon.ico")
        }
      ],
      page: 0,
      totalItems: 0,
      totalPages: 0
    }

    return data
  }
  async getDetails(comicId: string): Promise<MetaComic> {
    const data: MetaComic = {
      name: "Hello",
      image: createOImage("https://google.com/favicon.ico"),
      status: StatusEnum.Ongoing,
      genres: [],
      description: "",
      chapters: [{
        name: "Chapter 1",
        chapterId: "chapter-1",
        time: new Date(),
        order: 1,
      }],
      lastModified: new Date()
    }

    return data
  }
  async getPages(manga: string, chap: string): Promise<OImage[]> {
    return [
      createOImage("https://google.com/favicon.ico"),
      createOImage("https://google.com/favicon.ico"),
      createOImage("https://google.com/favicon.ico"),
      createOImage("https://google.com/favicon.ico"),
      createOImage("https://google.com/favicon.ico"),
      createOImage("https://google.com/favicon.ico"),
      createOImage("https://google.com/favicon.ico"),
      createOImage("https://google.com/favicon.ico")
    ]
  }
  search(params: {
    keyword: string
    page: number
    filters: { [key: string]: string[] | null }
    quick: boolean
  }): Promise<ComicCategory> {
    return this.getCategory({
      categoryId: "",
      page: 0,
      filters: {}
    })
  }

  getComicModes(comic: MetaComic): ComicModes {
    return ComicModes.leftToRight
  }
}

registerPlugin(TestComic)
