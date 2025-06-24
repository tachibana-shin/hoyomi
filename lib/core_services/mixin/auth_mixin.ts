import type { User } from "../interfaces/user"
import { BaseService } from "../service"

export abstract class AuthMixin {
  static support($mixin: any): boolean {
    return $mixin instanceof AuthMixin && $mixin.$noAuth === false
  }

  readonly $noAuth: boolean = false
  readonly $isAuth: boolean | null = true
  abstract getUser(params: { cookie: string }): Promise<User>
}
