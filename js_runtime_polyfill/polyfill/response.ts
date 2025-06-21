import { register } from "../register"
import { Headers } from "./headers"

declare global {
  interface GlobalThis {
    Response: $Response
  }

  type ResponseInit = $ResponseInit
}

type $ResponseInit = ResponseInit
export interface ResponseInit {
  status?: number
  statusText?: string
  headers?: Headers | Record<string, string>
  url?: string
}

type $Response = typeof Response
export class Response {
  #base64: string
  status: number
  statusText: string
  headers: Headers
  url: string
  ok: boolean

  constructor(base64: string, options: ResponseInit = {}) {
    this.#base64 = base64
    this.status = options.status ?? 200
    this.statusText = options.statusText ?? ""
    this.headers = new Headers(options.headers || {})
    this.url = options.url ?? ""
    this.ok = this.status >= 200 && this.status < 300
  }

  async text(): Promise<string> {
    return atob(this.#base64)
  }

  async json(): Promise<any> {
    return JSON.parse(await this.text())
  }

  async arrayBuffer(): Promise<ArrayBuffer> {
    const binaryString = atob(this.#base64)
    const len = binaryString.length
    const bytes = new Uint8Array(len)
    for (let i = 0; i < len; i++) {
      bytes[i] = binaryString.charCodeAt(i)
    }
    return bytes.buffer
  }
}

register({ Response })
