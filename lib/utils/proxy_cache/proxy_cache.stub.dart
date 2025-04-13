import 'dart:async';
import 'dart:io';

class ProxyCache {
  static final ProxyCache _instance = ProxyCache._internal();
  static ProxyCache get instance => _instance;

  ProxyCache._internal();

  Future<File> saveFile({
    required String content,
    required String path,
  }) async {
    throw UnimplementedError();
  }

  Future<void> start() async {
    throw UnimplementedError();
  }

  Uri getUrlHttp(File file) {
    throw UnimplementedError();
  }

  Future<void> stop() async {
    throw UnimplementedError();
  }
}
