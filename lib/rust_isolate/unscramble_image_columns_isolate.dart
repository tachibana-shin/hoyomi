import 'dart:isolate';
import 'dart:typed_data';

import 'package:hoyomi/rust/api/image/unscramble_image_columns.dart';
import 'package:hoyomi/rust/frb_generated.dart';

export 'package:hoyomi/rust/api/image/unscramble_image_columns.dart'
    show ColumnBlock;

Future<Uint8List> unscrambleImageColumnsIsolate({
  required List<int> imageData,
  required List<ColumnBlock> blocks,
  required bool autoTrim,
}) {
  return Isolate.run(() async {
    await RustLib.init();

    final output = unscrambleImageColumnsSync(
      imageData: imageData,
      blocks: blocks,
      autoTrim: false,
    );

    RustLib.dispose();

    return output;
  });
}
