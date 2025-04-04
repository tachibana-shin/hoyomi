import '../interfaces/user.dart';

mixin AuthMixin {
  static bool support(Object $mixin) {
    return $mixin is AuthMixin && $mixin.$noAuth == false;
  }

  final bool $noAuth = false;
  Future<User> getUser({required String cookie});
}
