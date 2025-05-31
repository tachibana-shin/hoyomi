import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hoyomi/core_services/interfaces/headers.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/exception/captcha_required_exception.dart';
import 'package:hoyomi/core_services/mixin/export.dart';

import '../service.dart';

mixin HeadlessMixin on BaseService {
  final Map<String, Future<InAppWebViewController>?> _initHeadlessFuture = {};

  Future<InAppWebViewController> _$initHeadless(Uri uri) {
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
        debugPrint('on webview created');

        controller.addJavaScriptHandler(
          handlerName: 'DOMContentLoaded',
          callback: (arguments) async {
            debugPrint('[headless]: WebView created with $arguments');

            if (!completer.isCompleted) completer.complete(controller);
          },
        );
      },
      onReceivedError: (controller, request, error) {
        debugPrint(
          '[headless]: WebView error with $request and $error but controller ready',
        );
        if (!completer.isCompleted) completer.completeError(error);
      },
      onConsoleMessage: (controller, consoleMessage) async {
        debugPrint(consoleMessage.toString());
      },
    );
    headless.run();

    return completer.future;
  }

  Future<InAppWebViewController> _initHeadless(Uri uri) async {
    try {
      _initHeadlessFuture[uri.origin] ??= _$initHeadless(uri);

      return await _initHeadlessFuture[uri.origin]!;
    } catch (error) {
      _initHeadlessFuture[uri.origin] = null;
      rethrow;
    }
  }

  Future<String> fetchHeadless(
    String url, {
    Map<String, dynamic>? body,
    required Headers headers,
    bool notify = true,
    bool base64 = false,
    bool createNewHeadless = false
  }) async {
    final controller = await _initHeadless(Uri.parse(createNewHeadless ? url : baseUrl));

    final DateTime? startTime = kDebugMode ? DateTime.now() : null;
    if (kDebugMode) {
      print('🔵 [HTTP] Request Started');
      print('➡️ URL: $url');
      print('📩 Cookie: ${headers.get('cookie')}');

      if (body != null) {
        final filteredBody = Map.fromEntries(
          body.entries
              .where((entry) => entry.value != null)
              .map(
                (entry) => MapEntry(
                  entry.key,
                  entry.value is String ? entry.value : entry.value.toString(),
                ),
              ),
        );

        print('📦 Body: $filteredBody');
      }
    }

    try {
      final result = await controller.callAsyncJavaScript(
        functionBody: '''
const body = rawBody ? new FormData() : null
if (body) {
  Object.entries(rawBody).map(([key, value]) => {
    if (Array.isArray(value)) value.forEach((val) => body.append(key, val))
    else body.set(key, value)
  })
}

return await fetch(url, {
  method,
  headers,
  body,
}).then(async (res) => {
  return {
    url: res.url,
    statusCode: res.status,
    statusText: res.statusText,
    headers: Object.fromEntries(res.headers.entries()),
    data: base64 ? await res.arrayBuffer().then(buffer => {
      const bytes = new Uint8Array(buffer)
      let binary = ""
      for (let i = 0; i < bytes.byteLength; i++) binary += String.fromCharCode(bytes[i])
      return btoa(binary)
    }) : await res.text()
  }
})
''',
        arguments: {
          'url': url,
          'method': body == null ? 'get' : 'post',
          'headers': headers.toMap(),
          'rawBody': body,
          'base64': base64
        },
        contentWorld: ContentWorld.PAGE,
      );

      if (result == null || result.error != null) {
        throw Exception(result?.error ?? 'Unknown error');
      }

      final response = result.value as Map;

      if ([429, 503, 403].contains(response['statusCode'])) {
        // return Future.error(response);
        final error = CaptchaRequiredException(getService(uid));

        // // required captcha resolve
        if (notify) {
          CaptchaResolverMixin.showSnackCaptcha(
            null,
            url: url,
            error: error,
            trace: StackTrace.current,
          );
        }
        // try {
        //   final start = DateTime.now();
        //   final data = await createWebView(uri)
        //       .fetch(url: url, headers: headers, body: body);

        //   debugPrint(
        //       'Future completed in ${DateTime.now().difference(start).inMilliseconds} milliseconds');
        //   return data;
        // } catch (err) {
        //   debugPrint('Error: $err');
        return Future.error(error);
        // }
      }

      if (kDebugMode) {
        if (startTime != null) {
          final DateTime endTime = DateTime.now();
          final Duration duration = endTime.difference(startTime);

          print('✅ [HTTP] Response Received');
          print('📜 Status Code: ${response['statusCode']}');
          print('⏳ Duration: ${duration.inMilliseconds} ms');

          print('📥 Response Cookie: ${response['headers']['set-cookie']}');
        }
      }

      return response['data'];
    } catch (error) {
      if (kDebugMode) {
        print('❌ [HTTP] Request Failed');
        print('⚠️ Error: $error');
      }

      rethrow;
    }
  }
}
