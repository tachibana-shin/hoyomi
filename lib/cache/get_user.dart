import 'package:honyomi/core_services/auth_service.dart';
import 'package:honyomi/core_services/base_service.dart';
import 'package:honyomi/core_services/interfaces/basic_user.dart';

final Map<String, BasicUser> store = {};
Future<BasicUser> getUser(BaseService service, {String? cookie}) async {
  if (service is! AuthService) {
    throw Exception('Service is not an AuthService');
  }

  if (store.containsKey(service.uid)) return store[service.uid]!;

  final user = await (service as AuthService).getUser(cookie: cookie);

  store[service.uid] = user; // Store the user in the cache

  return user;
}
