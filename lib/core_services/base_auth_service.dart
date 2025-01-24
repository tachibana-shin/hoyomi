import 'interfaces/basic_user.dart';

abstract class BaseAuthService {
  String get signInUrl;
  Future<BasicUser> getUser({required String cookie});
}
