import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class ProxyCache {
  static final ProxyCache _instance = ProxyCache._internal();
  static ProxyCache get instance => _instance;

  ProxyCache._internal();

  HttpServer? _server;
  final int _port = 55912;
  Timer? _timeoutTimer;

  Future<void> start() async {
    if (_server != null) return;

    final directory = await getTemporaryDirectory();
    final String cachePath = directory.path;

    _server = await HttpServer.bind(InternetAddress.loopbackIPv4, _port);
    debugPrint('ProxyCache started on http://localhost:$_port/');

    _resetTimeout();

    _server!.listen((HttpRequest request) async {
      _resetTimeout();

      final String fileName = request.uri.path.substring(1);
      final File file = File('$cachePath/$fileName');

      if (await file.exists()) {
        request.response.headers.contentType = ContentType.binary;
        request.response.headers.add('Cache-Control', 'public, max-age=86400');

        await file.openRead().pipe(request.response);
      } else {
        request.response.statusCode = HttpStatus.notFound;
        request.response.write('404 Not Found: $fileName');
      }

      await request.response.close();
    });
  }

  Uri getUrlHttp(File file) {
    return Uri.parse('http://localhost:$_port/${file.path.split('/').last}');
  }

  Future<void> stop() async {
    await _server?.close();
    _server = null;
    _timeoutTimer?.cancel();
    debugPrint('ProxyCache stopped.');
  }

  void _resetTimeout() {
    _timeoutTimer?.cancel();
    _timeoutTimer = Timer(Duration(seconds: 60), () {
      debugPrint('ProxyCache auto shutdown due to inactivity.');
      stop();
    });
  }
}
