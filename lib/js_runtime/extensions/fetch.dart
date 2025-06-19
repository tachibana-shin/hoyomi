import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_js/flutter_js.dart';

import '../embed.dart';

extension FetchJavascriptRuntimeExtension on JavascriptRuntime {
  Future<JsEvalResult> evalAsync(String code) async {
    final output = await evaluateAsync(code);

    if (output.isError || output.stringResult.contains('SyntaxError')) {
      throw output;
    }
    if (output.isPromise ||
        output.stringResult.contains('Instance of \'Future')) {
      return await handlePromise(output);
    }

    return output;
  }

  Future<void> dartSendMessage(String event, String data) async {
    // final jsonStr = jsonEncode(data);

    await evalAsync('__\$\$DART_SEND_MESSAGE\$\$__("$event", $data)');
  }

  Future<void> activateFetch() async {
    await evalAsync(jsRuntimePolyfill);

    final dio = Dio();

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
