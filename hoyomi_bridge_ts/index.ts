import { type $UnimplementedError } from "../js_runtime_polyfill/polyfill/unimplemented_error"

export * from "../lib/core_services/main"
export * from "./register_plugin"

declare global {
  function base64Encode(data: Uint8Array): string
  function base64Decode(base64: string): Uint8Array
  const UnimplementedError: $UnimplementedError
}

export function defineType<T>(data: T) {
  return data
}
