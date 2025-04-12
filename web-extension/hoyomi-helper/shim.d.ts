import type { ProtocolWithReturn } from "webext-bridge"

declare module "webext-bridge" {
  export interface ProtocolMap {
    // define message protocol types
    // see https://github.com/antfu/webext-bridge#type-safe-protocols
    "tab-prev": { title: string | undefined }
    "fetch": ProtocolWithReturn<Record<string, any>, Record<string, any>>
  }
}
