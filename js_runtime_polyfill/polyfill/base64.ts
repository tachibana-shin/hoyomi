import { register } from "../register"

declare global {
  function btoa(data: string): string
  function atob(base64: string): string
}

register({ btoa, atob })

export function btoa(str: string): string {
  return __b64Encode(str)
}

export function atob(base64: string): string {
  return __b64Decode(base64)
}

function __b64Encode(str: string) {
  const chars =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="
  let output = "",
    i = 0
  while (i < str.length) {
    const c1 = str.charCodeAt(i++) & 0xff
    const c2 = str.charCodeAt(i++)
    const c3 = str.charCodeAt(i++)
    const e1 = c1 >> 2
    const e2 = ((c1 & 3) << 4) | (c2 >> 4)
    const e3 = isNaN(c2) ? 64 : ((c2 & 15) << 2) | (c3 >> 6)
    const e4 = isNaN(c3) ? 64 : c3 & 63
    output +=
      chars.charAt(e1) + chars.charAt(e2) + chars.charAt(e3) + chars.charAt(e4)
  }
  return output
}

function __b64Decode(base64: string) {
  const chars =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="
  let output = "",
    i = 0
  base64 = base64.replace(/[^A-Za-z0-9+/=]/g, "")
  while (i < base64.length) {
    const e1 = chars.indexOf(base64.charAt(i++))
    const e2 = chars.indexOf(base64.charAt(i++))
    const e3 = chars.indexOf(base64.charAt(i++))
    const e4 = chars.indexOf(base64.charAt(i++))
    const c1 = (e1 << 2) | (e2 >> 4)
    const c2 = ((e2 & 15) << 4) | (e3 >> 2)
    const c3 = ((e3 & 3) << 6) | e4
    output += String.fromCharCode(c1)
    if (e3 != 64) output += String.fromCharCode(c2)
    if (e4 != 64) output += String.fromCharCode(c3)
  }
  return output
}
