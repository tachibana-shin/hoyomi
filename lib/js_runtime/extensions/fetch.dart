import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_js/flutter_js.dart';

import '../embed.dart';

final _dioStore = Expando<Dio>('dio store');

extension FetchJavascriptRuntimeExtension on JavascriptRuntime {
  Future<JsEvalResult> evalAsync(String code) async {
    final output = await evaluateAsync(code);

    if (output.isError || output.stringResult.contains('SyntaxError')) {
      if (output.stringResult.startsWith('UnimplementedError:') || output.stringResult.contains('Method not implemented.')) {
        throw UnimplementedError(output.stringResult);
      }

      throw output;
    }
    if (output.isPromise ||
        output.stringResult.contains('Instance of \'Future')) {
      return await handlePromise(output);
    }

    return output;
  }

  Future<dynamic> evalAsyncJson(String code) async {
    final json = await evalAsync('''
      (() => {
        const out = $code;

        if (out instanceof Promise || typeof out?.then === 'function')
          return out.then(e => JSON.stringify(e))

        return JSON.stringify(out)
      })()
    ''');

    return jsonDecode(json.stringResult);
  }

  /// Calls a JavaScript function with the given arguments.
  ///
  /// The [arguments] will be automatically JSON-encoded before being passed into JS.
  /// Do not pre-encode them manually.
  ///
  /// If [base64] is true, the result will be encoded in base64 using `base64Encode(...)` inside JS.
  Future<dynamic> evalFn(
    String functionName,
    List<dynamic> arguments, {
    bool base64 = false,
  }) async {
    final data = await evalAsyncJson('''
      (() => {
        if (typeof $functionName === 'function') return ${base64 ? 'base64Encode(' : ''} $functionName(${arguments.map((arg) => arg is Uint8List ? 'base64Decode(${jsonEncode(base64Encode(arg))})' : jsonEncode(arg)).join(', ')}) ${base64 ? ')' : ''}
        throw UnimplementedError('$functionName')
      })()
    ''');

    if (base64) return base64Decode(data);
    return data;
  }

  Future<dynamic> evalAsyncJsonOrNull(String code) async {
    return evalAsyncJson(code);
  }

  Future<void> dartSendMessage(String event, String data) async {
    // final jsonStr = jsonEncode(data);

    await evalAsync('__\$\$DART_SEND_MESSAGE\$\$__("$event", $data)');
  }

  void setDio(Dio dio) => _dioStore[this] = dio;

  Future<void> activateFetch() async {
    await evalAsync(jsRuntimePolyfill);

    final dio = _dioStore[this];
    if (dio == null) throw Exception('No dio found');

    onMessage('dart_fetch_request', (dynamic req) async {
      try {
        final String requestId = req['id'];
        final String url = req['url'];
        final Map<String, dynamic>? options = req['options'];

        final method = (options?['method'] ?? 'GET').toUpperCase();
        final headers = Map<String, dynamic>.from(options?['headers'] ?? {});
        final body = options?['body'];
        final data =
            body != null && body is String && body.isNotEmpty
                ? jsonDecode(body)
                : null;

        final response = await dio.request(
          url,
          data: method != 'GET' ? data : null,
          options: Options(
            method: method,
            headers: headers,
            responseType: ResponseType.bytes,
            validateStatus: (_) => true,
          ),
        );

        final responseMap = {
          'status': response.statusCode,
          'statusText': response.statusMessage,
          'url': response.realUri.toString(),
          'headers': Map.fromEntries(
            response.headers.map.entries.map(
              (e) => MapEntry(e.key.toLowerCase(), e.value.join(', ')),
            ),
          ),
          '__body': base64Encode(response.data),
        };

        await dartSendMessage('response:$requestId', '''{
          'status': ${response.statusCode},
          'statusText': "${response.statusMessage ?? ''}",
          'url': "${response.realUri.toString()}",
          'headers': ${jsonEncode(responseMap['headers'])},
          '__body': "${responseMap['__body']}"
        }''');
      } catch (e, stack) {
        debugPrint('Error: $e ($stack)');

        final requestId = req['id'];
        await dartSendMessage('response:$requestId', '''{
          '__fetch_error__': ${jsonEncode(e.toString())},
        }''');
      }
    });
  }
}
