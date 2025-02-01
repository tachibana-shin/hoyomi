import '../interfaces/basic_user.dart';

mixin BaseAuthMixin {
  String get signInUrl;
  Future<BasicUser> getUser({required String cookie});
}
