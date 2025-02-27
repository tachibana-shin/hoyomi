import 'package:hoyomi/core_services/service.dart';

import '../interfaces/user.dart';

class AuthInit {
  final String Function(Service service) signInUrl;

  AuthInit({required this.signInUrl});
}

mixin AuthMixin {
  AuthInit get authInit;
  Future<User> getUser({required String cookie});
}
