// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.11.1.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// These functions are ignored because they are not marked as `pub`: `crop_image`, `encode_png`, `trim_image`

Uint8List autoTrimImageSync({required List<int> image}) => RustLib.instance.api
    .crateApiImageAutoTrimImageAutoTrimImageSync(image: image);

Future<Uint8List> autoTrimImage({required List<int> image}) =>
    RustLib.instance.api.crateApiImageAutoTrimImageAutoTrimImage(image: image);
