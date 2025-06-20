export * from "../lib/core_services/main"
export * from "./register_plugin"

import { type UnimplementedError as UnimplementedErrorClass } from "../js_runtime_polyfill/polyfill/unimplemented_error"

declare global {
  const UnimplementedError: UnimplementedErrorClass
}
