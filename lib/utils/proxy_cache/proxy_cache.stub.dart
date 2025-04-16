import 'dart:async';

class ProxyCache {
  static final ProxyCache _instance = ProxyCache._internal();
  static ProxyCache get instance => _instance;

  ProxyCache._internal();

  Future<String> saveFile({
    required String content,
    required String path,
  }) async {
    throw UnimplementedError();
  }

  Future<void> start() async {
    throw UnimplementedError();
  }

  Uri getUrlHttp(String file) {
    throw UnimplementedError();
  }

  Future<void> stop() async {
    throw UnimplementedError();
  }
}
