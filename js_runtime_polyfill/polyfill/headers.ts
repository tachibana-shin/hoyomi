import { register } from "../register"

declare global {
  interface GlobalThis {
    Headers: $TypeHeaders
  }
  type HeaderInit = Record<string, string> | $TypeHeaders
}

type $TypeHeaders = typeof Headers
export type HeaderInit = Record<string, string> | Headers

export class Headers {
  private map: Record<string, string>

  constructor(init: HeaderInit = {}) {
    this.map = {}
    if (init instanceof Headers) {
      init.forEach((value, key) => {
        this.map[key.toLowerCase()] = value
      })
      return
    } else {
      for (const key in init) {
        this.map[key.toLowerCase()] = init[key]!
      }
    }
  }

  get(name: string): string | null {
    return this.map[name.toLowerCase()] ?? null
  }

  has(name: string): boolean {
    return name.toLowerCase() in this.map
  }

  keys(): string[] {
    return Object.keys(this.map)
  }

  entries(): [string, string][] {
    return Object.entries(this.map)
  }

  forEach(
    callback: (value: string, key: string, parent: Headers) => void
  ): void {
    for (const [key, value] of this.entries()) {
      callback(value, key, this)
    }
  }
}

register({ $Headers: Headers })
