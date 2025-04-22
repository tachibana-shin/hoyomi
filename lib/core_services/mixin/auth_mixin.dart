import '../interfaces/user.dart';

mixin AuthMixin {
  static bool support(Object $mixin) {
    return $mixin is AuthMixin && $mixin.$noAuth == false;
  }

  bool get $noAuth => false;
  final bool? $isAuth = true;

  Future<User> getUser({required String cookie});
}
