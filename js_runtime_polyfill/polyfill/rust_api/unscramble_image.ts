import { register } from "../../register"
import { base64Encode } from "../base64_coder"

export interface Block {
  sx: number
  sy: number
  dx: number
  dy: number
  width: number
  height: number
}

register({ unscrambleImage })

export async function unscrambleImage(
  imageData: Uint8Array,
  blocks: Block[],
  autoTrim: boolean
) {
  const requestId = "unscrambleImage_" + Math.random().toString(36).slice(2)
  const responseEvent = "unscrambleImageResponse:" + requestId

  return new Promise<Uint8Array>((resolve, reject) => {
    const listener = (res: Uint8Array | string) => {
      removeEventListener(responseEvent, listener)
      if (typeof res === "string") {
        reject(new Error(res))
      } else {
        resolve(res)
      }
    }

    addEventListener(responseEvent, listener)

    sendMessage(
      "dart_rust_unscramble_image",
      JSON.stringify({
        id: requestId,
        imageData: base64Encode(imageData),
        blocks,
        autoTrim
      })
    )
  })
}
