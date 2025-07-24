import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hoyomi/js_runtime/embed.dart';
import 'package:hoyomi/plugins/logger.dart';

import 'js_runtime.dart';

class WebviewRuntime implements JsRuntime {
  late HeadlessInAppWebView _webView;
  late InAppWebViewController _controller;

  final Map<String, Completer<dynamic>> _pendingEval = {};
  final Map<String, void Function(dynamic)> _callbacks = {};

  @override
  Future<void> init() async {
    final completer = Completer<void>();

    _webView = HeadlessInAppWebView(
      initialData: InAppWebViewInitialData(
        data: '''
        <html><body><script>
          if (!window.global) window.global = window
          if (!window.globalThis) window.globalThis = window
          
          window.sendMessage = (name, args) => window.flutter_inappwebview.callHandler(name, args);
          var globalThis = window;
          var global = window;

          $jsRuntimePolyfill
        </script></body></html>
      ''',
      ),
      initialSettings: InAppWebViewSettings(blockNetworkImage: true),
      onWebViewCreated: (controller) async {
        _controller = controller;
        completer.complete();
      },
      onConsoleMessage: (controller, consoleMessage) async {
        logger.e(consoleMessage.toString());
      },
    );

    await _webView.run();

    return completer.future;
  }

  Future<dynamic> _evaluateJavascript({required String source}) {
    return _controller.evaluateJavascript(source: source);
  }

  @override
  Future<dynamic> evalAsync(String code) async {
    return evaluateAsync(code);
  }

  String transformWithPatterns(String code) {
    final objectIdentifiers = <String>['__plugin'];

    final functionIdentifiers = <String>['base64Encode', 'base64Decode'];

    // Replace object references (e.g., __plugin → window.__plugin)
    for (final keyword in objectIdentifiers) {
      final pattern = RegExp(r'(?<![\w.])' + RegExp.escape(keyword));
      code = code.replaceAllMapped(pattern, (m) => 'window.$keyword');
    }

    // Replace function calls (e.g., base64Encode(...) → window.base64Encode(...))
    for (final keyword in functionIdentifiers) {
      final pattern = RegExp(r'(?<![\w.])' + RegExp.escape(keyword));
      code = code.replaceAllMapped(pattern, (m) => 'window.$keyword');
    }

    return code;
  }

  @override
  Future<dynamic> evaluateAsync(String code, [String? name]) async {
    final data = await _controller.callAsyncJavaScript(functionBody: code);

    if (data == null) return null;
    if (data.error != null) {
      if (data.error!.contains('UnimplementedError')) {
        throw UnimplementedError(name);
      }

      throw Exception(data.error!);
    }

    return data.value;
  }

  @override
  Future<dynamic> evalAsyncJson(String code, [String? msg]) async {
    final json = await evaluateAsync('''
        const out = await (async () => {
          $code
        })();

        if (out instanceof Promise || typeof out?.then === 'function')
          return out.then(e => JSON.stringify(e))

        return JSON.stringify(out)
    ''', msg);

    // maybe undefined in js
    if (json == null) return null;

    return jsonDecode(json);
  }

  @override
  Future<dynamic> evalFn(
    String functionName,
    List<dynamic> args, {
    bool base64 = false,
  }) async {
    final t = DateTime.now().millisecondsSinceEpoch;
    try {
      final argString = args
          .map(
            (e) =>
                e is Uint8List ? 'atob("${base64Encode(e)}")' : jsonEncode(e),
          )
          .join(', ');

      final code = '''
          if (typeof $functionName !== 'function') throw new UnimplementedError('$functionName');
          const out = await $functionName($argString);
          ${base64 ? 'return btoa(out);' : 'return out;'}
      ''';

      final result = await evalAsyncJson(code, functionName);
      return base64 ? base64Decode(result) : result;
    } finally {
      logger.d(
        'evalFn $functionName took ${DateTime.now().millisecondsSinceEpoch - t}ms',
      );
    }
  }

  @override
  Future<void> dartSendMessage(String name, dynamic data) async {
    await _evaluateJavascript(
      source: '''window.__\$\$DART_SEND_MESSAGE\$\$__('$name', $data);''',
    );
  }

  @override
  Future<void> onMessage(
    String name,
    void Function(dynamic args) callback,
  ) async {
    _callbacks[name] = callback;
    _controller.addJavaScriptHandler(
      handlerName: name,
      callback:
          (args) => _callbacks[name]?.call(
            args.first.isNotEmpty ? jsonDecode(args.first) : null,
          ),
    );
  }

  @override
  void dispose() {
    _pendingEval.clear();
    _callbacks.clear();
    _webView.dispose();
  }
}
