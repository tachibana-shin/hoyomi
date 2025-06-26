import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:hoyomi/rust/api/image/unscramble_image.dart';
import 'package:hoyomi/rust/api/image/unscramble_image_columns.dart';
import 'package:hoyomi/rust/api/image/unscramble_image_rows.dart';

import 'fetch.dart';

extension RustApiJavascriptRuntimeExtension on JavascriptRuntime {
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

        final result = await unscrambleImageColumns(
          imageData: imageData,
          blocks: blocks,
          autoTrim: autoTrim,
        );

        dartSendMessage(
          'unscrambleImageColumnsResponse:$requestId',
          'base64Decode(${jsonEncode(base64Encode(result))})',
        );
      } catch (e, stack) {
        debugPrint('Error: $e ($stack)');

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

        final result = await unscrambleImageRows(
          imageData: imageData,
          blocks: blocks,
          autoTrim: autoTrim,
        );

        dartSendMessage(
          'unscrambleImageRowsResponse:$requestId',
          'base64Decode(${jsonEncode(base64Encode(result))})',
        );
      } catch (e, stack) {
        debugPrint('Error: $e ($stack)');

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

        final result = await unscrambleImage(
          imageData: imageData,
          blocks: blocks,
          autoTrim: autoTrim,
        );

        dartSendMessage(
          'unscrambleImageResponse:$requestId',
          'base64Decode(${jsonEncode(base64Encode(result))})',
        );
      } catch (e, stack) {
        debugPrint('Error: $e ($stack)');

        dartSendMessage(
          'unscrambleImageResponse:$requestId',
          jsonEncode(e.toString()),
        );
      }
    });
  }
}
