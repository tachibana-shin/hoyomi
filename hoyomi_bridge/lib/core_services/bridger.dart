import 'package:hoyomi_bridge/export.dart';

abstract class Bridger {
  String get baseUrl;
  Future<String> fetch(
    String url, {
    String? cookie,
    UrlSearchParams? query,
    Map<String, dynamic>? body,
    Headers? headers,
    bool notify = true,
    bool headless = false,
    bool cache = true,
  });
}
