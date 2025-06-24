import { register } from "../register"

declare global {
  interface GlobalThis {
    TextEncoder: $TextEncoder
  }
}
type $TextEncoder = typeof TextEncoder
class TextEncoder {
  encode(str: string) {
    const utf8 = []
    for (let i = 0; i < str.length; i++) {
      let charCode = str.charCodeAt(i)
      if (charCode < 0x80) {
        utf8.push(charCode)
      } else if (charCode < 0x800) {
        utf8.push(0xc0 | (charCode >> 6))
        utf8.push(0x80 | (charCode & 0x3f))
      } else if (charCode < 0xd800 || charCode >= 0xe000) {
        utf8.push(0xe0 | (charCode >> 12))
        utf8.push(0x80 | ((charCode >> 6) & 0x3f))
        utf8.push(0x80 | (charCode & 0x3f))
      } else {
        // surrogate pair
        i++
        if (i >= str.length) throw new Error("Invalid surrogate pair")
        const next = str.charCodeAt(i)
        const codePoint =
          ((charCode - 0xd800) << 10) + (next - 0xdc00) + 0x10000
        utf8.push(0xf0 | (codePoint >> 18))
        utf8.push(0x80 | ((codePoint >> 12) & 0x3f))
        utf8.push(0x80 | ((codePoint >> 6) & 0x3f))
        utf8.push(0x80 | (codePoint & 0x3f))
      }
    }
    return new Uint8Array(utf8)
  }
}

register({ TextEncoder })
