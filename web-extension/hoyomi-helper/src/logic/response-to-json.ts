import { arrayBufferToBase64 } from "./buffer-to-b64"

/**
 * Converts a Response object into a JSON-serializable object.
 * @param response - The Response object to convert.
 * @returns A promise that resolves to a JSON representation of the Response.
 */
export async function responseToJson(
  response: Response
  // biome-ignore lint/suspicious/noExplicitAny: <explanation>
): Promise<Record<string, any>> {
  const headers = Object.fromEntries(response.headers.entries())

  let body: string | null = null
  try {
    const clonedResponse = response.clone()
    const arrayBuffer = await clonedResponse.arrayBuffer()
    body = arrayBufferToBase64(arrayBuffer)
  } catch (error) {
    // If reading the body fails, leave it as null
    console.warn(error)
  }

  return {
    status: response.status,
    statusText: response.statusText,
    headers,
    body,
    redirected: response.redirected,
    type: response.type,
    url: response.url
  }
}
