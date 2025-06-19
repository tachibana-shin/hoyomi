import { register } from "../register"

class TextDecoder {
  constructor(encoding = "utf-8") {
    if (encoding.toLowerCase() !== "utf-8") {
      throw new Error("Only utf-8 TextDecoder is supported")
    }
  }

  decode(bytes: ArrayBuffer | Uint8Array): string {
    if (!(bytes instanceof Uint8Array)) {
      bytes = new Uint8Array(bytes)
    }

    let str = ""
    let i = 0
    while (i < bytes.length) {
      const byte1 = bytes[i++]!

      if (byte1 < 0x80) {
        str += String.fromCharCode(byte1)
      } else if (byte1 >= 0xc0 && byte1 < 0xe0) {
        const byte2 = bytes[i++]!
        str += String.fromCharCode(((byte1 & 0x1f) << 6) | (byte2 & 0x3f))
      } else if (byte1 >= 0xe0 && byte1 < 0xf0) {
        const byte2 = bytes[i++]!
        const byte3 = bytes[i++]!
        str += String.fromCharCode(
          ((byte1 & 0x0f) << 12) | ((byte2 & 0x3f) << 6) | (byte3 & 0x3f)
        )
      } else if (byte1 >= 0xf0) {
        const byte2 = bytes[i++]!
        const byte3 = bytes[i++]!
        const byte4 = bytes[i++]!
        let codepoint =
          ((byte1 & 0x07) << 18) |
          ((byte2 & 0x3f) << 12) |
          ((byte3 & 0x3f) << 6) |
          (byte4 & 0x3f)
        codepoint -= 0x10000
        str += String.fromCharCode(
          0xd800 + (codepoint >> 10),
          0xdc00 + (codepoint & 0x3ff)
        )
      }
    }

    return str
  }
}

register({ TextDecoder })
