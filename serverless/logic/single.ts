export function single<T>(results: T[]): T | null {
  if (results.length === 0) {
    return null
  }
  if (results.length > 1) {
    throw new Error("Expected one result, but got multiple.")
  }

  return results[0]
}
