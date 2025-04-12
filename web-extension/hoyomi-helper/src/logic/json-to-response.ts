/**
 * Reconstructs a Response object from its JSON representation.
 * @param json - The JSON object representing the Response.
 * @returns A new Response object constructed from the JSON data.
 */

// biome-ignore lint/suspicious/noExplicitAny: <explanation>
export  function jsonToResponse(json: Record<string, any>): Response {
  const headers = new Headers(json.headers)

  const response = new Response(json.body, {
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
