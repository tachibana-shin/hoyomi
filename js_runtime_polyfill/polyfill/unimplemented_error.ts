import { register } from "../register"

export class UnimplementedError extends Error {
  override name = "UnimplementedError"
}

register({ UnimplementedError })
