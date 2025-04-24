import 'dart:typed_data';
import 'dart:js_interop';

/// External JS function from pako
@JS('_inflateRaw')
external JSUint8Array _inflateRaw(JSUint8Array data);

Uint8List inflateRaw(Uint8List data) {
  final result = _inflateRaw(data.toJS);
  return result.toDart;
}
