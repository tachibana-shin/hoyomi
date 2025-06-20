import type { BaseService } from "../lib/core_services/main"

export function registerPlugin(plugin: BaseService) {
  Object.assign(globalThis, {
    __$HOYOMI_PLUGIN$__: plugin
  })
}
