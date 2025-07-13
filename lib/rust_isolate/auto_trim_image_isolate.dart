import 'dart:isolate';
import 'dart:typed_data';

import 'package:hoyomi/rust/api/image/auto_trim_image.dart';
import 'package:hoyomi/rust/frb_generated.dart';

Future<Uint8List> autoTrimImageIsolate({required List<int> image}) {
  return Isolate.run(() async {
    await RustLib.init();

    final output = autoTrimImageSync(image: image);

    RustLib.dispose();

    return output;
  });
}
