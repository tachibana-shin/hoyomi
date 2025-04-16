import 'dart:typed_data';

import 'package:archive/archive.dart';

Uint8List inflateRaw(Uint8List data) {
  final archive = ZLibDecoder().decodeBytes(data, raw: true);
  return archive;
}
