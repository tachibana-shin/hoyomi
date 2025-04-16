import type { ProtocolWithReturn } from "webext-bridge"

declare module "webext-bridge" {
  export interface ProtocolMap {
    // define message protocol types
    // see https://github.com/antfu/webext-bridge#type-safe-protocols
    "tab-prev": { title: string | undefined }
    install_web_rules: ProtocolWithReturn<
      readonly { json: string; origin: string },
      void
    >
  }
}
