import { register } from "../register"
import { atob, btoa } from "./base64"

declare global {
  function base64Encode(data: Uint8Array): string
  function base64Decode(base64: string): Uint8Array
}

register({ base64Encode, base64Decode })
export function base64Encode(data: Uint8Array): string {
  const binary = String.fromCharCode(...data)
  return btoa(binary)
}

export function base64Decode(base64: string): Uint8Array {
  const binary = atob(base64)
  const bytes = new Uint8Array(binary.length)
  for (let i = 0; i < binary.length; i++) {
    bytes[i] = binary.charCodeAt(i)
  }
  return bytes
}
