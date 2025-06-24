import type { ServiceInit } from "./service_init"

export abstract class BaseService {
  abstract init: ServiceInit
  // abstract get uid(): string
  // abstract get name(): string
  _baseUrl: string = ""
  writeWith: string = "js"
  get baseUrl(): string {
    return this._baseUrl
  }
}
