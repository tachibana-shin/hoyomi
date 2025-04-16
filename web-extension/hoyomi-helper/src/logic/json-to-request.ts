/**
 * Reconstructs a Request object from its JSON representation.
 * @param json - The JSON object representing the Request.
 * @returns A new Request object constructed from the JSON data.
 */

// biome-ignore lint/suspicious/noExplicitAny: <explanation>
export function jsonToRequest(json: Record<string, any>): Request {
  const headers = new Headers(json.headers)

  const init: RequestInit = {
    method: json.method,
    headers,
    body: json.body,
    mode: json.mode,
    credentials: json.credentials,
    cache: json.cache,
    redirect: json.redirect,
    referrer: json.referrer,
    referrerPolicy: json.referrerPolicy,
    integrity: json.integrity,
    keepalive: json.keepalive
    // Note: The 'signal' property is not included as it cannot be serialized
  }

  return new Request(json.url, init)
}
