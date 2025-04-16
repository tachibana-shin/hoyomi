import 'dart:convert';

class ProxyCache {
  static final ProxyCache _instance = ProxyCache._internal();
  static ProxyCache get instance => _instance;

  ProxyCache._internal();

  final Map<String, String> _cache = {};

  Future<String> saveFile({
    required String content,
    required String path,
  }) async {
    _cache[path] = content;
    return path;
  }

  Future<void> start() async {
    return;
  }

  Uri getUrlHttp(String file) {
    final base64Content = base64Encode(utf8.encode(_cache[file] ?? ''));
    return Uri.parse('http://localhost/?b64=$base64Content');
  }

  Future<void> stop() async {
    _cache.clear();
  }
}
