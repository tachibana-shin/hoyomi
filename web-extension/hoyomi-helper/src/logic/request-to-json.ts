/**
 * Converts a Request object into a JSON-serializable object.
 * @param request - The Request object to convert.
 * @returns A promise that resolves to a JSON representation of the Request.
 */
export async function requestToJson(
  request: Request
  // biome-ignore lint/suspicious/noExplicitAny: <explanation>
): Promise<Record<string, any>> {
  const headers = Object.fromEntries(request.headers.entries())

  let body: string | null = null
  if (request.method !== "GET" && request.method !== "HEAD")
    try {
      const clonedRequest = request.clone()
      body = await clonedRequest.text()
    } catch {
      // If reading the body fails, leave it as null
    }

  return {
    url: request.url,
    method: request.method,
    headers,
    body,
    mode: request.mode,
    credentials: request.credentials,
    cache: request.cache,
    redirect: request.redirect,
    referrer: request.referrer,
    referrerPolicy: request.referrerPolicy,
    integrity: request.integrity,
    keepalive: request.keepalive
    // Note: The 'signal' property is not included as it cannot be serialized
  }
}
