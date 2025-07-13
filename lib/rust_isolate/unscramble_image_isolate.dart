import 'dart:isolate';
import 'dart:typed_data';

import 'package:hoyomi/rust/api/image/unscramble_image.dart';
import 'package:hoyomi/rust/frb_generated.dart';

export 'package:hoyomi/rust/api/image/unscramble_image.dart' show Block;

Future<Uint8List> unscrambleImageIsolate({
  required List<int> imageData,
  required List<Block> blocks,
  required bool autoTrim,
}) {
  return Isolate.run(() async {
    await RustLib.init();

    final output = unscrambleImageSync(
      imageData: imageData,
      blocks: blocks,
      autoTrim: false,
    );

    RustLib.dispose();

    return output;
  });
}
