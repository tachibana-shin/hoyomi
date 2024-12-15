import 'package:honyomi/core_services/book/auth_service.dart';
import 'package:honyomi/core_services/book/book_base_service.dart';
import 'package:honyomi/core_services/book/interfaces/basic_user.dart';

final Map<String, BasicUser> store = {};
Future<BasicUser> getUser(BookBaseService service, {String? cookie}) async {
  if (service is! AuthService) {
    throw Exception('Service is not an AuthService');
  }

  if (store.containsKey(service.uid)) return store[service.uid]!;

  final user = await (service as AuthService).getUser(cookie: cookie);

  store[service.uid] = user; // Store the user in the cache

  return user;
}
