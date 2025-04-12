/**
 * Converts a Response object into a JSON-serializable object.
 * @param response - The Response object to convert.
 * @returns A promise that resolves to a JSON representation of the Response.
 */
export async function responseToJson(
  response: Response
): Promise<Record<string, any>> {
  const headers = Object.fromEntries(response.headers.entries())

  let body: string | null = null
  try {
    const clonedResponse = response.clone()
    body = await clonedResponse.text()
  } catch {
    // If reading the body fails, leave it as null
  }

  return {
    status: response.status,
    statusText: response.statusText,
    headers,
    body
  }
}
