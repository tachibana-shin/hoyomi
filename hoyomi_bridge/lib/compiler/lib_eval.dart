import 'package:hoyomi_bridge/export.dart';

/// ====================================
/// Need run:
/// + setBaseUrl
/// + setFetch
/// + setParseQ
///

// ======== baseUrl =======
String baseUrl = '';
void setBaseUrl(String url) => baseUrl = url;
// String get baseUrl {
//   if (_baseUrl == null) throw Exception('baseUrl is not set');

//   return _baseUrl!;
// }
// ========================

// ======== fetch =========
Future<String> Function(
  String url, {
  String? cookie,
  UrlSearchParams? query,
  Map<String, dynamic>? body,
  Headers? headers,
  bool? notify,
  bool? headless,
  bool? cache,
})
fetch = (
  _, {
  String? cookie,
  UrlSearchParams? query,
  Map<String, dynamic>? body,
  Headers? headers,
  bool? notify,
  bool? headless,
  bool? cache,
}) {
  throw UnimplementedError();
};

void setFetch(
  Future<String> Function(
    String url, {
    String? cookie,
    UrlSearchParams? query,
    Map<String, dynamic>? body,
    Headers? headers,
    bool? notify,
    bool? headless,
    bool? cache,
  })
  fetchFn,
) {
  fetch = fetchFn;
}
// ========================

// ======== parseQ =========
// typedef FunctionParseQ = DQuery Function(String html);

DQuery Function(String html)? _parseQ;
void setParseQ(DQuery Function(String html) parseQFn) => _parseQ = parseQFn;
DQuery Function(String html) get parseQ {
  if (_parseQ == null) throw Exception('parseQ is not set');

  return _parseQ!;
}
// =========================

Future<DQuery> fetchQ(
  String url, {
  String? cookie,
  UrlSearchParams? query,
  Map<String, dynamic>? body,
  Headers? headers,
  bool headless = false,
  bool cache = true,
}) async {
  return parseQ(
    await fetch(
      url,
      cookie: cookie,
      query: query,
      body: body,
      headers: headers,
      headless: headless,
      cache: cache,
    ),
  );
}
