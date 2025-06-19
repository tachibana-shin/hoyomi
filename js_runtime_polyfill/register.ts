export function register(sign: Record<string, unknown>) {
  Object.assign(globalThis, sign)
}
