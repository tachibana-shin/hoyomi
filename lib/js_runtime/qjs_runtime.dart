import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter_qjs/flutter_qjs.dart';
import 'package:hoyomi/plugins/logger.dart';

import 'embed.dart';
import 'js_runtime.dart';

void _jsIsolateEntry(SendPort mainSendPort) async {
  final jsRuntime = getJavascriptRuntime();

  // await jsRuntime.enableHandlePromises();

  final port = ReceivePort();
  mainSendPort.send(port.sendPort);

  final Map<String, void Function(dynamic)> listeners = {};

  bool isUnimplementedError(String msg) {
    return msg.startsWith('UnimplementedError') ||
        msg.startsWith('Error: UnimplementedError') ||
        msg.contains('Method not implemented.');
  }

  port.listen((message) async {
    if (message is Map && message['type'] == 'eval') {
      final id = message['id'];
      final code = message['code'] as String;

      try {
        var output = await jsRuntime.evaluateAsync(code);
        if (output.isPromise ||
            output.stringResult.contains('Instance of \'Future')) {
          output = await jsRuntime.handlePromise(output);
        }

        if (output.isError || output.stringResult.contains('SyntaxError')) {
          mainSendPort.send({
            'type': 'eval_result',
            'id': id,
            'result': {
              'type': 'error',
              'unimplemented': isUnimplementedError(output.stringResult),
              'message': output.stringResult,
            },
          });

          return;
        }

        mainSendPort.send({
          'type': 'eval_result',
          'id': id,
          'result': {'type': 'ok', 'data': output.stringResult},
        });
      } catch (error, stack) {
        logger.e(error, stackTrace: stack);

        mainSendPort.send({
          'type': 'eval_result',
          'id': id,
          'result': {
            'type': 'error',
            'unimplemented':
                error is JSError && isUnimplementedError(error.message),
            'message': error.toString(),
          },
        });
      }

      return;
    }

    if (message is Map && message['type'] == 'listen') {
      final name = message['name'];
      listeners[name] = (args) {
        mainSendPort.send({'type': 'message', 'name': name, 'args': args});
      };
      jsRuntime.onMessage(name, listeners[name]!);
    }

    if (message is Map && message['type'] == 'dispose') {
      jsRuntime.dispose();
      port.close();
      Isolate.exit();
    }
  });
}

class QjsRuntime implements JsRuntime {
  late SendPort _sendPort;
  final ReceivePort _receivePort = ReceivePort();

  final Map<String, Completer<dynamic>> _pendingEval = {};
  final Map<String, void Function(dynamic)> _callbacks = {};
  int _evalCounter = 0;

  @override
  Future<void> init() async {
    final completer = Completer<void>();

    _receivePort.listen((message) {
      if (message is SendPort) {
        _sendPort = message;
        completer.complete();
      } else {
        _handleMessage(message);
      }
    });

    await Isolate.spawn(_jsIsolateEntry, _receivePort.sendPort);

    await evaluateAsync(jsRuntimePolyfill);

    return completer.future;
  }

  void _handleMessage(dynamic message) {
    if (message is Map && message['type'] == 'eval_result') {
      final id = message['id'] as String;
      final result = message['result'] as Map;

      final completer = _pendingEval.remove(id);
      if (completer == null) return;

      if (result['type'] == 'ok') {
        completer.complete(result['data']);
      } else {
        final error = JsRuntimeError(
          message: result['message'],
          isUnimplemented: result['unimplemented'] ?? false,
        );
        completer.completeError(error);
      }
    }

    if (message is Map && message['type'] == 'message') {
      final name = message['name'] as String;
      final args = message['args'];
      _callbacks[name]?.call(args);
    }
  }

  @override
  Future<dynamic> evaluateAsync(String code, [String? name]) async {
    final id = (_evalCounter++).toString();
    final completer = Completer<dynamic>();
    _pendingEval[id] = completer;

    _sendPort.send({'type': 'eval', 'id': id, 'code': code});

    try {
      return await completer.future;
    } on JsRuntimeError catch (error) {
      if (error.isUnimplemented) {
        throw UnimplementedError(name ?? error.message);
      }

      throw Exception(error.message);
    }
  }

  @override
  Future<dynamic> evalAsync(String code, [String? name]) =>
      evaluateAsync(code, name);

  @override
  Future<dynamic> evalAsyncJson(String code, [String? msg]) async {
    final json = await evaluateAsync('''
      (() => {
        const out = $code;

        if (out instanceof Promise || typeof out?.then === 'function')
          return out.then(e => JSON.stringify(e))

        return JSON.stringify(out)
      })()
    ''', msg);

    return jsonDecode(json);
  }

  /// Calls a JavaScript function with the given arguments.
  ///
  /// The [arguments] will be automatically JSON-encoded before being passed into JS.
  /// Do not pre-encode them manually.
  ///
  /// If [base64] is true, the result will be encoded in base64 using `base64Encode(...)` inside JS.
  @override
  Future<dynamic> evalFn(
    String functionName,
    List<dynamic> arguments, {
    bool base64 = false,
  }) async {
    final data = await evalAsyncJson('''
      (() => {
        if (typeof $functionName === 'function') return ${base64 ? 'base64Encode(' : ''} $functionName(${arguments.map((arg) => arg is Uint8List ? 'base64Decode(${jsonEncode(base64Encode(arg))})' : jsonEncode(arg)).join(', ')}) ${base64 ? ')' : ''}
        throw new UnimplementedError('$functionName')
      })()
    ''', functionName);

    if (base64) return base64Decode(data);
    return data;
  }

  @override
  Future<void> dartSendMessage(String event, String data) async {
    // final jsonStr = jsonEncode(data);

    await evaluateAsync('__\$\$DART_SEND_MESSAGE\$\$__("$event", $data)');
  }

  @override
  Future<void> onMessage(
    String name,
    void Function(dynamic args) callback,
  ) async {
    _callbacks[name] = callback;
    _sendPort.send({'type': 'listen', 'name': name});
  }

  @override
  void dispose() {
    _sendPort.send({'type': 'dispose'});

    _receivePort.close();
    _pendingEval.clear();
    _callbacks.clear();
    _evalCounter = 0;
  }
}
