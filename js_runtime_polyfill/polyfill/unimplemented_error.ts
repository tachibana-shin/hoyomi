import { register } from "../register"

declare global {
  interface GlobalThis {
    UnimplementedError: $UnimplementedError
  }
}

export type $UnimplementedError = typeof UnimplementedError
export class UnimplementedError extends Error {
  override name = "UnimplementedError"
}

register({ UnimplementedError })
