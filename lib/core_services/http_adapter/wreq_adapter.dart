import 'dart:typed_data';
import 'dart:convert';
import 'package:dio/dio.dart' hide Headers;
import 'package:hoyomi/core_services/interfaces/headers.dart';
import 'package:hoyomi/rust/api/http/http.dart';

class WReqAdapter implements HttpClientAdapter {
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    try {
      Uint8List? rawBytes;

      if (requestStream != null) {
        final bytes = <int>[];
        await for (final chunk in requestStream) {
          bytes.addAll(chunk);
        }
        rawBytes = Uint8List.fromList(bytes);
      } else if (options.data != null) {
        if (options.data is Uint8List) {
          rawBytes = options.data as Uint8List;
        } else if (options.data is String) {
          rawBytes = utf8.encode(options.data as String);
        } else if (options.data is Map<String, dynamic>) {
          final contentType =
              options.headers['content-type']?.toString().toLowerCase();

          if (contentType != null &&
              contentType.contains('application/x-www-form-urlencoded')) {
            final formEncoded = (options.data as Map<String, dynamic>).entries
                .map(
                  (e) =>
                      '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value.toString())}',
                )
                .join('&');
            rawBytes = utf8.encode(formEncoded);
          } else {
            // Default: convert to JSON
            rawBytes = utf8.encode(json.encode(options.data));
          }
        } else {
          throw UnsupportedError(
            'Unsupported data type: ${options.data.runtimeType}',
          );
        }
      }

      final headers = Headers.fromMap(
        Map.fromEntries(
          options.headers.entries.map(
            (entry) => MapEntry(entry.key, entry.value is List ? entry.value.join(', ') : entry.value.toString()),
          ),
        ),
      );

      final req = RustHttpRequest(
        emulation: Emulation.chrome136,
        method: options.method,
        url: options.uri.toString(),
        headers:
            headers
                .toMap()
                .entries
                .map((entry) => (entry.key, entry.value))
                .toList(),
        bodyBytes: rawBytes,
        redirectSettings:
            options.followRedirects
                ? RedirectSettings.limitedRedirects(5)
                : null,
        userAgent: headers.get('user-agent'),
      );

      final res = await rustHttpRequest(req: req);

      return ResponseBody.fromBytes(
        res.body,
        res.status,
        headers: {
          for (final h in res.headers) h.$1: [h.$2],
        },
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
  void close({bool force = false}) {}
}
