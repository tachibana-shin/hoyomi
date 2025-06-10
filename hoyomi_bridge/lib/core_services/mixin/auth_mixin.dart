import '../shared/user.dart';
import '../service.dart';

mixin AuthMixin on BaseService {
  static bool support(Object $mixin) {
    return $mixin is AuthMixin && $mixin.$noAuth == false;
  }

  bool get $noAuth => false;
  final bool? $isAuth = true;

  Future<User> getUser({required String cookie});
}
