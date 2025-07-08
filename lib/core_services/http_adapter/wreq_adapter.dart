import 'dart:typed_data';
import 'dart:convert';
import 'package:dio/dio.dart';

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
          rawBytes = utf8.encode(options.data as String) as Uint8List;
        } else if (options.data is Map<String, dynamic>) {
          final contentType = options.headers['content-type']?.toString().toLowerCase();

          if (contentType != null && contentType.contains('application/x-www-form-urlencoded')) {
            final formEncoded = (options.data as Map<String, dynamic>)
                .entries
                .map((e) => '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value.toString())}')
                .join('&');
            rawBytes = utf8.encode(formEncoded) as Uint8List;
          } else {
            // Default: convert to JSON
            rawBytes = utf8.encode(json.encode(options.data)) as Uint8List;
          }
        } else {
          throw UnsupportedError('Unsupported data type: ${options.data.runtimeType}');
        }
      }

      final headers = Headers.fromMap(
        Map.fromEntries(
          options.headers.entries.map(
            (entry) => MapEntry(entry.key, entry.value.toString()),
          ),
        ),
      );

      final req = RustHttpRequest(
        method: options.method,
        url: options.uri.toString(),
        headers: headers.toMap(),
        bodyBytes: rawBytes,
      );

      final res = await rust.rustSendHttp(req);

      return ResponseBody.fromBytes(
        res.body,
        res.status,
        headers: {
          for (final h in res.headers) h.$1: [h.$2]
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
