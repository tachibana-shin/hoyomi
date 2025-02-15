import '../interfaces/user.dart';

mixin AuthMixin {
  String get signInUrl;
  Future<User> getUser({required String cookie});
}
