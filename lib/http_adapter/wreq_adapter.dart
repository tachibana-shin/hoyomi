import 'dart:async';
import 'dart:convert';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:dio/dio.dart' hide Headers;
import 'package:hoyomi/core_services/interfaces/headers.dart';
import 'package:hoyomi/rust/api/http/http.dart';
import 'package:hoyomi/rust/frb_generated.dart';

// --- Data transfer object to isolate ---
class _IsolateHttpRequestData {
  final SendPort sendPort;
  final RequestOptions options;
  final Uint8List? bodyBytes;

  _IsolateHttpRequestData({
    required this.sendPort,
    required this.options,
    required this.bodyBytes,
  });
}

class WReqAdapter implements HttpClientAdapter {
  final bool useIsolate;

  WReqAdapter({this.useIsolate = false});

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
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
          rawBytes = utf8.encode(json.encode(options.data));
        }
      } else {
        throw UnsupportedError(
          'Unsupported data type: ${options.data.runtimeType}',
        );
      }
    }

    if (useIsolate) {
      final receivePort = ReceivePort();
      final completer = Completer<ResponseBody>();

      final data = _IsolateHttpRequestData(
        sendPort: receivePort.sendPort,
        options: options,
        bodyBytes: rawBytes,
      );

      await Isolate.spawn(_handleRequestInIsolate, data);

      receivePort.listen((message) {
        if (message is ResponseBody) {
          completer.complete(message);
        } else if (message is DioException) {
          completer.completeError(message);
        }
        receivePort.close();
      });

      return completer.future;
    } else {
      return _doFetch(options, rawBytes);
    }
  }

  // 実際に Rust と通信する処理
  Future<ResponseBody> _doFetch(
    RequestOptions options,
    Uint8List? rawBytes,
  ) async {
    try {
      final headers = Headers.fromMap(
        Map.fromEntries(
          options.headers.entries
              .where((entry) => entry.value != null)
              .map(
                (entry) => MapEntry(
                  entry.key,
                  entry.value is List
                      ? entry.value.join(', ')
                      : entry.value.toString(),
                ),
              ),
        ),
      );

      final req = RustHttpRequest(
        emulation: Emulation.chrome136,
        method: options.method,
        url: options.uri.toString(),
        headers: headers.toMap().entries.map((e) => (e.key, e.value)).toList(),
        bodyBytes: rawBytes,
        redirectSettings:
            options.followRedirects
                ? RedirectSettings.limitedRedirects(options.maxRedirects)
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

  // isolate で fetch 実行
  static Future<void> _handleRequestInIsolate(
    _IsolateHttpRequestData data,
  ) async {
    await RustLib.init();

    try {
      final response = await WReqAdapter()._doFetch(
        data.options,
        data.bodyBytes,
      );
      data.sendPort.send(response);
    } catch (e) {
      data.sendPort.send(
        DioException(
          requestOptions: data.options,
          error: e,
          type: DioExceptionType.unknown,
        ),
      );
    }
  }

  @override
  void close({bool force = false}) {}
}
