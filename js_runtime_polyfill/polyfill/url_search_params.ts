import { register } from "../register"

declare global {
  interface GlobalThis {
    URLSearchParams: $URLSearchParams
  }
}

type $URLSearchParams = typeof URLSearchParams

export class URLSearchParams {
  private params: Map<string, string[]> = new Map()

  constructor(query: string) {
    if (query.startsWith("?")) query = query.slice(1)

    for (const part of query.split("&")) {
      if (!part) continue
      const [rawKey, rawValue] = part.split("=")
      const key = decodeURIComponent(rawKey || "")
      const value = decodeURIComponent(rawValue || "")
      if (!this.params.has(key)) {
        this.params.set(key, [])
      }
      this.params.get(key)!.push(value)
    }
  }

  get(key: string): string | null {
    const values = this.params.get(key)
    return values ? values[0]! : null
  }

  getAll(key: string): string[] {
    return this.params.get(key) || []
  }

  has(key: string): boolean {
    return this.params.has(key)
  }

  toJSON() {
    return this.params
  }

  toString(): string {
    const parts: string[] = []
    for (const [key, values] of this.params.entries()) {
      for (const value of values) {
        parts.push(`${encodeURIComponent(key)}=${encodeURIComponent(value)}`)
      }
    }
    return parts.join("&")
  }
}

if (!globalThis.URLSearchParams) register({ URLSearchParams })
