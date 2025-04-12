/**
 * Reconstructs a Response object from its JSON representation.
 * @param json - The JSON object representing the Response.
 * @returns A new Response object constructed from the JSON data.
 */
export function jsonToResponse(json: Record<string, any>): Response {
  const headers = new Headers(json.headers)

  return new Response(json.body, {
    status: json.status,
    statusText: json.statusText,
    headers
  })
}
