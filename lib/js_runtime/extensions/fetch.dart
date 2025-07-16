import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hoyomi/plugins/logger.dart';

import '../js_runtime.dart';

final _dioStore = Expando<Dio>('dio store');

extension FetchJavascriptRuntimeExtension on JsRuntime {
  void setDio(Dio dio) => _dioStore[this] = dio;

  Future<void> activateFetch() async {
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
        logger.e(e, stackTrace: stack);

        final requestId = req['id'];
        await dartSendMessage('response:$requestId', '''{
          '__fetch_error__': ${jsonEncode(e.toString())},
        }''');
      }
    });
  }
}
