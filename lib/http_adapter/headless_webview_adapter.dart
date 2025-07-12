import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hoyomi/core_services/interfaces/headers.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/plugins/logger.dart';

class HeadlessWebViewAdapter implements HttpClientAdapter {
  final Service _service;
  final Map<String, Future<InAppWebViewController>?> _initHeadlessFuture = {};

  HeadlessWebViewAdapter(this._service);

  Future<InAppWebViewController> _$initHeadless(Uri uri, String userAgent) {
    final completer = Completer<InAppWebViewController>();

    final headless = HeadlessInAppWebView(
      initialUrlRequest: URLRequest(url: WebUri('${uri.origin}/favicon.ico')),
      initialSettings: InAppWebViewSettings(
        incognito: false,
        javaScriptCanOpenWindowsAutomatically: true,
        blockNetworkImage: true,
        geolocationEnabled: true,
        supportMultipleWindows: true,
        sharedCookiesEnabled: true,
        // userAgent: userAgent,
      ),
      initialUserScripts: UnmodifiableListView([
        UserScript(
          source: """
            window.addEventListener('DOMContentLoaded', function(event) {
              window.flutter_inappwebview.callHandler('DOMContentLoaded', window.location.href);
            });
          """,
          injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
        ),
      ]),
      onWebViewCreated: (controller) {
        controller.addJavaScriptHandler(
          handlerName: 'DOMContentLoaded',
          callback: (arguments) async {
            if (!completer.isCompleted) completer.complete(controller);
          },
        );
      },
      onReceivedError: (controller, request, error) {
        if (!completer.isCompleted) completer.completeError(error);
      },
      onConsoleMessage: (controller, consoleMessage) async {
        logger.e(consoleMessage.toString());
      },
    );
    headless.run();

    _service.onBeforeUnmount(() => headless.dispose());

    return completer.future;
  }

  Future<InAppWebViewController> _initHeadless(
    Uri uri,
    String userAgent,
  ) async {
    try {
      _initHeadlessFuture[uri.origin] ??= _$initHeadless(uri, userAgent);
      return await _initHeadlessFuture[uri.origin]!;
    } catch (error) {
      _initHeadlessFuture[uri.origin] = null;
      rethrow;
    }
  }

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    try {
      Uint8List? rawBytes;
      Map<String, dynamic>? requestBody;

      if (requestStream != null) {
        final bodyBytes = <int>[];
        await for (final chunk in requestStream) {
          bodyBytes.addAll(chunk);
        }
        rawBytes = Uint8List.fromList(bodyBytes);
      } else if (options.data is Map<String, dynamic>) {
        requestBody = Map<String, dynamic>.from(options.data);
      }

      final headers = Headers.fromMap(
        Map.fromEntries(
          options.headers.entries.map(
            (entry) => MapEntry(entry.key, entry.value.toString()),
          ),
        ),
      );

      logger.i('webview.....');
      late final InAppWebViewController controller;
      try {
        controller = await _initHeadless(
          options.uri,
          options.headers['user-agent'] ?? '',
        );
      } catch (error, stack) {
        logger.e(error, stackTrace: stack);

        return ResponseBody.fromString('WebRequest Error', 503);
      }

      final result = await controller.callAsyncJavaScript(
        functionBody: '''
method = method.toUpperCase();
let body = null;

if (rawBytes) {
  const binary = atob(rawBytes);
  const len = binary.length;
  const buffer = new Uint8Array(len);
  for (let i = 0; i < len; i++) buffer[i] = binary.charCodeAt(i);
  body = new Blob([buffer]);
} else if (!["GET", "HEAD", "DELETE", "OPTIONS"].includes(method) && rawBody) {
  body = new FormData();
  Object.entries(rawBody).forEach(([key, value]) => {
    if (Array.isArray(value)) value.forEach(val => body.append(key, val));
    else body.append(key, value);
  });
}

return await fetch(url, {
  method,
  headers,
  body,
}).then(async res => ({
  url: res.url,
  statusCode: res.status,
  statusText: res.statusText,
  headers: Object.fromEntries(res.headers.entries()),
  data: await res.arrayBuffer().then(buffer => {
    const bytes = new Uint8Array(buffer);
    let binary = "";
    for (let i = 0; i < bytes.byteLength; i++) binary += String.fromCharCode(bytes[i]);
    return btoa(binary);
  })
}));
''',
        arguments: {
          'url': options.uri.toString(),
          'method': options.method,
          'headers': headers.toMap(),
          'rawBody': requestBody,
          'rawBytes': rawBytes != null ? base64Encode(rawBytes) : null,
          'base64': true,
        },
        contentWorld: ContentWorld.PAGE,
      );

      if (result == null || result.error != null) {
        throw Exception(result?.error ?? 'Unknown JS error');
      }

      final Map response = result.value;

      final int statusCode = (response['statusCode'] as num?)?.toInt() ?? 200;
      final String base64data = response['data'];
      final Map<String, dynamic> rawHeaders = Map<String, dynamic>.from(
        response['headers'],
      );

      // if ([429, 503, 403].contains(statusCode)) {
      //   final error = CaptchaRequiredException(_service);
      //   CaptchaResolverMixin.showSnackCaptcha(
      //     null,
      //     url: options.uri.toString(),
      //     error: error,
      //     trace: StackTrace.current,
      //   );
      //   throw error;
      // }

      final bytes = base64Decode(base64data);

      return ResponseBody.fromBytes(
        bytes,
        statusCode,
        headers: Map<String, List<String>>.fromEntries(
          rawHeaders.entries.map((e) => MapEntry(e.key, [e.value.toString()])),
        ),
      );
    } catch (e) {
      throw DioException(
        requestOptions: options,
        error: e,
        type: DioExceptionType.unknown,
      );
    }
  }

  @override
  void close({bool force = false}) async {
    for (final headless in _initHeadlessFuture.values) {
      final webview = await headless;

      webview?.dispose();
    }
    _initHeadlessFuture.clear();
  }
}
