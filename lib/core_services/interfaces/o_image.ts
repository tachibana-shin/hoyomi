import type { Headers } from "./headers"

export interface OImage {
  src: string
  headers?: Headers
  extra?: string
}

export function createOImage(
  src: string,
  headers?: Headers,
  extra?: string
): OImage {
  return { src, headers, extra }
}

export const OImageFake = "fake:"
export const OImageBlank = "assets/images/blank.png"
