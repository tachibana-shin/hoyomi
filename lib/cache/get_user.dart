import 'package:hoyomi/core_services/base_auth_service.dart';
import 'package:hoyomi/core_services/base_service.dart';
import 'package:hoyomi/core_services/interfaces/basic_user.dart';

final Map<String, BasicUser> store = {};
Future<BasicUser> getUser(BaseService service, {String? cookie}) async {
  if (service is! BaseAuthService) {
    throw Exception('Service is not an AuthService');
  }

  if (store.containsKey(service.uid)) return store[service.uid]!;

  final user = await (service as BaseAuthService).getUser(cookie: cookie);

  store[service.uid] = user; // Store the user in the cache

  return user;
}
