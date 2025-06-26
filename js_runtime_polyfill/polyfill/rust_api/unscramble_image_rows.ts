import { register } from "../../register"
import { base64Encode } from "../base64_coder"

export interface RowBlock {
  dy: number
  height: number
}

register({ unscrambleImageRows })

export async function unscrambleImageRows(
  imageData: Uint8Array,
  blocks: RowBlock[],
  autoTrim: boolean
): Promise<Uint8Array> {
  const requestId = "unscrambleImageRows_" + Math.random().toString(36).slice(2)
  const responseEvent = "unscrambleImageRowsResponse:" + requestId

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
      "dart_rust_unscramble_image_rows",
      JSON.stringify({
        id: requestId,
        imageData: base64Encode(imageData),
        blocks,
        autoTrim
      })
    )
  })
}
