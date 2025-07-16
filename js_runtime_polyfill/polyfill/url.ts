import { register } from "../register"
import { URLSearchParams } from "./url_search_params"

declare global {
  interface GlobalThis {
    URL: $URL
  }
}
type $URL = typeof URL
export class URL {
  href: string
  origin: string
  protocol: string
  hostname: string
  port: string
  pathname: string
  search: string
  hash: string
  searchParams: URLSearchParams

  constructor(url: string, base?: string) {
    const resolved = resolveUrl(url, base)
    const parsed = parseUrl(resolved)

    this.href = resolved
    this.origin = parsed.origin
    this.protocol = parsed.protocol
    this.hostname = parsed.hostname
    this.port = parsed.port
    this.pathname = parsed.pathname
    this.search = parsed.search
    this.hash = parsed.hash
    this.searchParams = new URLSearchParams(this.search)
  }

  toString() {
    return this.href
  }

  toJSON() {
    return this.href
  }
}
if (!globalThis.URL) register({ URL })

// ===== Helper: resolve relative URLs =====
function resolveUrl(url: string, base?: string): string {
  if (!base || /^([a-z][a-z\d+\-.]*:)?\/\//i.test(url)) {
    return url
  }
  // Naive relative path resolution
  if (base.endsWith("/")) {
    return base + url
  } else {
    return base.replace(/\/[^/]*$/, "/") + url
  }
}

// ===== Helper: parse URL string =====
function parseUrl(url: string) {
  const urlRegex =
    /^(?<protocol>[a-z]+:)?\/\/(?<hostname>[^:/?#]+)?(?::(?<port>\d+))?(?<pathname>[^?#]*)?(?<search>\?[^#]*)?(?<hash>#.*)?$/i
  const match = url.match(urlRegex)
  const groups = match?.groups || {}

  const protocol = groups.protocol || ""
  const hostname = groups.hostname || ""
  const port = groups.port || ""
  const pathname = groups.pathname || "/"
  const search = groups.search || ""
  const hash = groups.hash || ""
  const origin =
    protocol && hostname
      ? `${protocol}//${hostname}${port ? ":" + port : ""}`
      : ""

  return {
    protocol,
    hostname,
    port,
    pathname,
    search,
    hash,
    origin
  }
}
