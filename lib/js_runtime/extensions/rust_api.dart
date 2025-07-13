import 'dart:convert';

import 'package:hoyomi/plugins/logger.dart';
import 'package:hoyomi/rust_isolate/unscramble_image_columns_isolate.dart';
import 'package:hoyomi/rust_isolate/unscramble_image_isolate.dart';
import 'package:hoyomi/rust_isolate/unscramble_image_rows_isolate.dart';

import '../js_runtime.dart';

extension RustApiJavascriptRuntimeExtension on JsRuntime {
  Future<void> activateRustApi() async {
    onMessage('dart_rust_unscramble_image_columns', (dynamic args) async {
      final requestId = args['id'] as String;
      try {
        final imageData = base64Decode(args['imageData'] as String);
        final blocks =
            (args['blocks'] as List)
                .map(
                  (e) =>
                      ColumnBlock(dx: e['dx'] as int, width: e['width'] as int),
                )
                .toList();
        final autoTrim = args['autoTrim'] as bool;

        final result = await unscrambleImageColumnsIsolate(
          imageData: imageData,
          blocks: blocks,
          autoTrim: autoTrim,
        );

        dartSendMessage(
          'unscrambleImageColumnsResponse:$requestId',
          'base64Decode(${jsonEncode(base64Encode(result))})',
        );
      } catch (e, stack) {
        logger.e(e, stackTrace: stack);

        dartSendMessage(
          'unscrambleImageColumnsResponse:$requestId',
          jsonEncode(e.toString()),
        );
      }
    });

    onMessage('dart_rust_unscramble_image_rows', (dynamic args) async {
      final requestId = args['id'] as String;
      try {
        final imageData = base64Decode(args['imageData'] as String);
        final blocks =
            (args['blocks'] as List)
                .map(
                  (e) =>
                      RowBlock(dy: e['dy'] as int, height: e['height'] as int),
                )
                .toList();
        final autoTrim = args['autoTrim'] as bool;

        final result = await unscrambleImageRowsIsolate(
          imageData: imageData,
          blocks: blocks,
          autoTrim: autoTrim,
        );

        dartSendMessage(
          'unscrambleImageRowsResponse:$requestId',
          'base64Decode(${jsonEncode(base64Encode(result))})',
        );
      } catch (e, stack) {
        logger.e(e, stackTrace: stack);

        dartSendMessage(
          'unscrambleImageRowsResponse:$requestId',
          jsonEncode(e.toString()),
        );
      }
    });

    onMessage('dart_rust_unscramble_image', (dynamic args) async {
      // unscrambleImage
      // Block

      final requestId = args['id'] as String;
      try {
        final imageData = base64Decode(args['imageData'] as String);
        final blocks =
            (args['blocks'] as List)
                .map(
                  (e) => Block(
                    sx: e['sx'] as int,
                    sy: e['sy'] as int,
                    dx: e['dx'] as int,
                    dy: e['dy'] as int,
                    width: e['width'] as int,
                    height: e['height'] as int,
                  ),
                )
                .toList();
        final autoTrim = args['autoTrim'] as bool;

        final result = await unscrambleImageIsolate(
          imageData: imageData,
          blocks: blocks,
          autoTrim: autoTrim,
        );

        dartSendMessage(
          'unscrambleImageResponse:$requestId',
          'base64Decode(${jsonEncode(base64Encode(result))})',
        );
      } catch (e, stack) {
        logger.e(e, stackTrace: stack);

        dartSendMessage(
          'unscrambleImageResponse:$requestId',
          jsonEncode(e.toString()),
        );
      }
    });
  }
}
