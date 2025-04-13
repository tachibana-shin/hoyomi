/**
 * Reconstructs a Response object from its JSON representation.
 * @param json - The JSON object representing the Response.
 * @returns A new Response object constructed from the JSON data.
 */

import { base64ToArrayBuffer } from "./buffer-to-b64"

// biome-ignore lint/suspicious/noExplicitAny: <explanation>
export function jsonToResponse(json: Record<string, any>): Response {
  const headers = new Headers(json.headers)

  // Decode the base64-encoded body before passing it to the Response
  const body = json.body ? base64ToArrayBuffer(json.body) : null

  const response = new Response(body, {
    status: json.status,
    statusText: json.statusText,
    headers
  })

  const { redirected, type, url } = json
  Object.defineProperty(response, "redirected", {
    get: () => redirected
  })
  Object.defineProperty(response, "type", {
    get: () => type
  })
  Object.defineProperty(response, "url", {
    get: () => url
  })

  return response
}
