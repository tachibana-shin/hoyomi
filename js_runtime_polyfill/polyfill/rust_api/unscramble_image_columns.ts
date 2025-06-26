import { register } from "../../register"
import { base64Encode } from "../base64_coder"

export interface ColumnBlock {
  dx: number
  width: number
}

register({ unscrambleImageColumns })

export async function unscrambleImageColumns(
  imageData: Uint8Array,
  blocks: ColumnBlock[],
  autoTrim: boolean
): Promise<Uint8Array> {
  const requestId =
    "unscrambleImageColumns_" + Math.random().toString(36).slice(2)
  const responseEvent = "unscrambleImageColumnsResponse:" + requestId

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
      "dart_rust_unscramble_image_columns",
      JSON.stringify({
        id: requestId,
        imageData: base64Encode(imageData),
        blocks,
        autoTrim
      })
    )
  })
}
