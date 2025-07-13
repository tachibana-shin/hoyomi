import 'dart:isolate';
import 'dart:typed_data';

import 'package:hoyomi/rust/api/image/unscramble_image_rows.dart';
import 'package:hoyomi/rust/frb_generated.dart';

export 'package:hoyomi/rust/api/image/unscramble_image_rows.dart' show RowBlock;

Future<Uint8List> unscrambleImageRowsIsolate({
  required List<int> imageData,
  required List<RowBlock> blocks,
  required bool autoTrim,
}) {
  return Isolate.run(() async {
    await RustLib.init();

    final output = unscrambleImageRowsSync(
      imageData: imageData,
      blocks: blocks,
      autoTrim: false,
    );

    RustLib.dispose();

    return output;
  });
}
