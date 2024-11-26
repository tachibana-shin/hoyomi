import 'package:honyomi/core_services/interfaces/basic_user.dart';

abstract class AuthService {
  String get signInUrl;
  Future<BasicUser> getUser({String? cookie});
}