// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:typed_data';
// ignore: depend_on_referenced_packages
import 'package:js/js.dart';

/// External JS function from pako
@JS('_inflateRaw')
external dynamic _inflateRaw(Uint8List data);

Uint8List inflateRaw(Uint8List data) {
  final result = _inflateRaw(data);
  return result;
}
