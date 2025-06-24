import { register } from "../register"
import { Headers } from "./headers.ts"
import { URL } from "./url.ts"

declare global {
  interface GlobalThis {
    Request: $Request
  }

  type RequestInit = $RequestInit
}

type $RequestInit = RequestInit
export interface RequestInit {
  method?: string
  headers?: Headers | Record<string, string>
  body?: any
}

type $Request = typeof Request
export class Request {
  url: string
  method: string
  headers: Headers
  body: any

  constructor(
    input: string | URL | Request | (RequestInit & { url: string }),
    init: RequestInit = {}
  ) {
    this.url =
      typeof input === "string"
        ? input
        : input instanceof URL
        ? input.toString()
        : input.url
    this.method = (
      init.method ||
      (typeof (input as { method?: string }).method === "string"
        ? (input as { method: string }).method
        : "GET")
    ).toUpperCase()
    this.headers = new Headers(
      init.headers ||
        (typeof input !== "string" && !(input instanceof URL)
          ? input.headers
          : {})
    )
    this.body =
      init.body ??
      (typeof input !== "string" && !(input instanceof URL) ? input.body : null)
  }

  clone(): Request {
    return new Request(this.url, {
      method: this.method,
      headers: this.headers,
      body: this.body
    })
  }
}

register({ Request })
