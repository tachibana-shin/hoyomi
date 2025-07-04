// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.10.0.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

import 'api/image/auto_trim_image.dart';
import 'api/image/decode_image_rgba.dart';
import 'api/image/get_image_size.dart';
import 'api/image/unscramble_image.dart';
import 'api/image/unscramble_image_columns.dart';
import 'api/image/unscramble_image_rows.dart';
import 'dart:async';
import 'dart:convert';
import 'frb_generated.dart';
import 'frb_generated.io.dart'
    if (dart.library.js_interop) 'frb_generated.web.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

/// Main entrypoint of the Rust API
class RustLib extends BaseEntrypoint<RustLibApi, RustLibApiImpl, RustLibWire> {
  @internal
  static final instance = RustLib._();

  RustLib._();

  /// Initialize flutter_rust_bridge
  static Future<void> init({
    RustLibApi? api,
    BaseHandler? handler,
    ExternalLibrary? externalLibrary,
  }) async {
    await instance.initImpl(
      api: api,
      handler: handler,
      externalLibrary: externalLibrary,
    );
  }

  /// Initialize flutter_rust_bridge in mock mode.
  /// No libraries for FFI are loaded.
  static void initMock({required RustLibApi api}) {
    instance.initMockImpl(api: api);
  }

  /// Dispose flutter_rust_bridge
  ///
  /// The call to this function is optional, since flutter_rust_bridge (and everything else)
  /// is automatically disposed when the app stops.
  static void dispose() => instance.disposeImpl();

  @override
  ApiImplConstructor<RustLibApiImpl, RustLibWire> get apiImplConstructor =>
      RustLibApiImpl.new;

  @override
  WireConstructor<RustLibWire> get wireConstructor =>
      RustLibWire.fromExternalLibrary;

  @override
  Future<void> executeRustInitializers() async {}

  @override
  ExternalLibraryLoaderConfig get defaultExternalLibraryLoaderConfig =>
      kDefaultExternalLibraryLoaderConfig;

  @override
  String get codegenVersion => '2.10.0';

  @override
  int get rustContentHash => 676892523;

  static const kDefaultExternalLibraryLoaderConfig =
      ExternalLibraryLoaderConfig(
        stem: 'rust_lib_hoyomi',
        ioDirectory: 'rust/target/release/',
        webPrefix: 'pkg/',
      );
}

abstract class RustLibApi extends BaseApi {
  Future<Uint8List> crateApiImageAutoTrimImageAutoTrimImage({
    required List<int> image,
  });

  Uint8List crateApiImageAutoTrimImageAutoTrimImageSync({
    required List<int> image,
  });

  Future<DecodedImage> crateApiImageDecodeImageRgbaDecodeImageRgba({
    required List<int> imageData,
  });

  Future<(int, int)> crateApiImageGetImageSizeGetImageSize({
    required List<int> data,
  });

  (int, int) crateApiImageGetImageSizeGetImageSizeSync({
    required List<int> data,
  });

  Future<Uint8List> crateApiImageUnscrambleImageUnscrambleImage({
    required List<int> imageData,
    required List<Block> blocks,
    required bool autoTrim,
  });

  Future<Uint8List> crateApiImageUnscrambleImageColumnsUnscrambleImageColumns({
    required List<int> imageData,
    required List<ColumnBlock> blocks,
    required bool autoTrim,
  });

  Uint8List crateApiImageUnscrambleImageColumnsUnscrambleImageColumnsSync({
    required List<int> imageData,
    required List<ColumnBlock> blocks,
    required bool autoTrim,
  });

  Future<Uint8List> crateApiImageUnscrambleImageRowsUnscrambleImageRows({
    required List<int> imageData,
    required List<RowBlock> blocks,
    required bool autoTrim,
  });

  Uint8List crateApiImageUnscrambleImageRowsUnscrambleImageRowsSync({
    required List<int> imageData,
    required List<RowBlock> blocks,
    required bool autoTrim,
  });

  Uint8List crateApiImageUnscrambleImageUnscrambleImageSync({
    required List<int> imageData,
    required List<Block> blocks,
    required bool autoTrim,
  });
}

class RustLibApiImpl extends RustLibApiImplPlatform implements RustLibApi {
  RustLibApiImpl({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @override
  Future<Uint8List> crateApiImageAutoTrimImageAutoTrimImage({
    required List<int> image,
  }) {
    return handler.executeNormal(
      NormalTask(
        callFfi: (port_) {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_list_prim_u_8_loose(image, serializer);
          pdeCallFfi(
            generalizedFrbRustBinding,
            serializer,
            funcId: 1,
            port: port_,
          );
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_list_prim_u_8_strict,
          decodeErrorData: null,
        ),
        constMeta: kCrateApiImageAutoTrimImageAutoTrimImageConstMeta,
        argValues: [image],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta get kCrateApiImageAutoTrimImageAutoTrimImageConstMeta =>
      const TaskConstMeta(debugName: "auto_trim_image", argNames: ["image"]);

  @override
  Uint8List crateApiImageAutoTrimImageAutoTrimImageSync({
    required List<int> image,
  }) {
    return handler.executeSync(
      SyncTask(
        callFfi: () {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_list_prim_u_8_loose(image, serializer);
          return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 2)!;
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_list_prim_u_8_strict,
          decodeErrorData: null,
        ),
        constMeta: kCrateApiImageAutoTrimImageAutoTrimImageSyncConstMeta,
        argValues: [image],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta get kCrateApiImageAutoTrimImageAutoTrimImageSyncConstMeta =>
      const TaskConstMeta(
        debugName: "auto_trim_image_sync",
        argNames: ["image"],
      );

  @override
  Future<DecodedImage> crateApiImageDecodeImageRgbaDecodeImageRgba({
    required List<int> imageData,
  }) {
    return handler.executeNormal(
      NormalTask(
        callFfi: (port_) {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_list_prim_u_8_loose(imageData, serializer);
          pdeCallFfi(
            generalizedFrbRustBinding,
            serializer,
            funcId: 3,
            port: port_,
          );
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_decoded_image,
          decodeErrorData: sse_decode_String,
        ),
        constMeta: kCrateApiImageDecodeImageRgbaDecodeImageRgbaConstMeta,
        argValues: [imageData],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta get kCrateApiImageDecodeImageRgbaDecodeImageRgbaConstMeta =>
      const TaskConstMeta(
        debugName: "decode_image_rgba",
        argNames: ["imageData"],
      );

  @override
  Future<(int, int)> crateApiImageGetImageSizeGetImageSize({
    required List<int> data,
  }) {
    return handler.executeNormal(
      NormalTask(
        callFfi: (port_) {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_list_prim_u_8_loose(data, serializer);
          pdeCallFfi(
            generalizedFrbRustBinding,
            serializer,
            funcId: 4,
            port: port_,
          );
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_record_u_32_u_32,
          decodeErrorData: sse_decode_String,
        ),
        constMeta: kCrateApiImageGetImageSizeGetImageSizeConstMeta,
        argValues: [data],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta get kCrateApiImageGetImageSizeGetImageSizeConstMeta =>
      const TaskConstMeta(debugName: "get_image_size", argNames: ["data"]);

  @override
  (int, int) crateApiImageGetImageSizeGetImageSizeSync({
    required List<int> data,
  }) {
    return handler.executeSync(
      SyncTask(
        callFfi: () {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_list_prim_u_8_loose(data, serializer);
          return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 5)!;
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_record_u_32_u_32,
          decodeErrorData: sse_decode_String,
        ),
        constMeta: kCrateApiImageGetImageSizeGetImageSizeSyncConstMeta,
        argValues: [data],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta get kCrateApiImageGetImageSizeGetImageSizeSyncConstMeta =>
      const TaskConstMeta(debugName: "get_image_size_sync", argNames: ["data"]);

  @override
  Future<Uint8List> crateApiImageUnscrambleImageUnscrambleImage({
    required List<int> imageData,
    required List<Block> blocks,
    required bool autoTrim,
  }) {
    return handler.executeNormal(
      NormalTask(
        callFfi: (port_) {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_list_prim_u_8_loose(imageData, serializer);
          sse_encode_list_block(blocks, serializer);
          sse_encode_bool(autoTrim, serializer);
          pdeCallFfi(
            generalizedFrbRustBinding,
            serializer,
            funcId: 6,
            port: port_,
          );
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_list_prim_u_8_strict,
          decodeErrorData: sse_decode_String,
        ),
        constMeta: kCrateApiImageUnscrambleImageUnscrambleImageConstMeta,
        argValues: [imageData, blocks, autoTrim],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta get kCrateApiImageUnscrambleImageUnscrambleImageConstMeta =>
      const TaskConstMeta(
        debugName: "unscramble_image",
        argNames: ["imageData", "blocks", "autoTrim"],
      );

  @override
  Future<Uint8List> crateApiImageUnscrambleImageColumnsUnscrambleImageColumns({
    required List<int> imageData,
    required List<ColumnBlock> blocks,
    required bool autoTrim,
  }) {
    return handler.executeNormal(
      NormalTask(
        callFfi: (port_) {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_list_prim_u_8_loose(imageData, serializer);
          sse_encode_list_column_block(blocks, serializer);
          sse_encode_bool(autoTrim, serializer);
          pdeCallFfi(
            generalizedFrbRustBinding,
            serializer,
            funcId: 7,
            port: port_,
          );
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_list_prim_u_8_strict,
          decodeErrorData: sse_decode_String,
        ),
        constMeta:
            kCrateApiImageUnscrambleImageColumnsUnscrambleImageColumnsConstMeta,
        argValues: [imageData, blocks, autoTrim],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta
  get kCrateApiImageUnscrambleImageColumnsUnscrambleImageColumnsConstMeta =>
      const TaskConstMeta(
        debugName: "unscramble_image_columns",
        argNames: ["imageData", "blocks", "autoTrim"],
      );

  @override
  Uint8List crateApiImageUnscrambleImageColumnsUnscrambleImageColumnsSync({
    required List<int> imageData,
    required List<ColumnBlock> blocks,
    required bool autoTrim,
  }) {
    return handler.executeSync(
      SyncTask(
        callFfi: () {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_list_prim_u_8_loose(imageData, serializer);
          sse_encode_list_column_block(blocks, serializer);
          sse_encode_bool(autoTrim, serializer);
          return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 8)!;
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_list_prim_u_8_strict,
          decodeErrorData: sse_decode_String,
        ),
        constMeta:
            kCrateApiImageUnscrambleImageColumnsUnscrambleImageColumnsSyncConstMeta,
        argValues: [imageData, blocks, autoTrim],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta
  get kCrateApiImageUnscrambleImageColumnsUnscrambleImageColumnsSyncConstMeta =>
      const TaskConstMeta(
        debugName: "unscramble_image_columns_sync",
        argNames: ["imageData", "blocks", "autoTrim"],
      );

  @override
  Future<Uint8List> crateApiImageUnscrambleImageRowsUnscrambleImageRows({
    required List<int> imageData,
    required List<RowBlock> blocks,
    required bool autoTrim,
  }) {
    return handler.executeNormal(
      NormalTask(
        callFfi: (port_) {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_list_prim_u_8_loose(imageData, serializer);
          sse_encode_list_row_block(blocks, serializer);
          sse_encode_bool(autoTrim, serializer);
          pdeCallFfi(
            generalizedFrbRustBinding,
            serializer,
            funcId: 9,
            port: port_,
          );
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_list_prim_u_8_strict,
          decodeErrorData: sse_decode_String,
        ),
        constMeta:
            kCrateApiImageUnscrambleImageRowsUnscrambleImageRowsConstMeta,
        argValues: [imageData, blocks, autoTrim],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta
  get kCrateApiImageUnscrambleImageRowsUnscrambleImageRowsConstMeta =>
      const TaskConstMeta(
        debugName: "unscramble_image_rows",
        argNames: ["imageData", "blocks", "autoTrim"],
      );

  @override
  Uint8List crateApiImageUnscrambleImageRowsUnscrambleImageRowsSync({
    required List<int> imageData,
    required List<RowBlock> blocks,
    required bool autoTrim,
  }) {
    return handler.executeSync(
      SyncTask(
        callFfi: () {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_list_prim_u_8_loose(imageData, serializer);
          sse_encode_list_row_block(blocks, serializer);
          sse_encode_bool(autoTrim, serializer);
          return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 10)!;
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_list_prim_u_8_strict,
          decodeErrorData: sse_decode_String,
        ),
        constMeta:
            kCrateApiImageUnscrambleImageRowsUnscrambleImageRowsSyncConstMeta,
        argValues: [imageData, blocks, autoTrim],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta
  get kCrateApiImageUnscrambleImageRowsUnscrambleImageRowsSyncConstMeta =>
      const TaskConstMeta(
        debugName: "unscramble_image_rows_sync",
        argNames: ["imageData", "blocks", "autoTrim"],
      );

  @override
  Uint8List crateApiImageUnscrambleImageUnscrambleImageSync({
    required List<int> imageData,
    required List<Block> blocks,
    required bool autoTrim,
  }) {
    return handler.executeSync(
      SyncTask(
        callFfi: () {
          final serializer = SseSerializer(generalizedFrbRustBinding);
          sse_encode_list_prim_u_8_loose(imageData, serializer);
          sse_encode_list_block(blocks, serializer);
          sse_encode_bool(autoTrim, serializer);
          return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 11)!;
        },
        codec: SseCodec(
          decodeSuccessData: sse_decode_list_prim_u_8_strict,
          decodeErrorData: sse_decode_String,
        ),
        constMeta: kCrateApiImageUnscrambleImageUnscrambleImageSyncConstMeta,
        argValues: [imageData, blocks, autoTrim],
        apiImpl: this,
      ),
    );
  }

  TaskConstMeta get kCrateApiImageUnscrambleImageUnscrambleImageSyncConstMeta =>
      const TaskConstMeta(
        debugName: "unscramble_image_sync",
        argNames: ["imageData", "blocks", "autoTrim"],
      );

  @protected
  String dco_decode_String(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as String;
  }

  @protected
  Block dco_decode_block(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 6)
      throw Exception('unexpected arr length: expect 6 but see ${arr.length}');
    return Block(
      sx: dco_decode_u_32(arr[0]),
      sy: dco_decode_u_32(arr[1]),
      dx: dco_decode_u_32(arr[2]),
      dy: dco_decode_u_32(arr[3]),
      width: dco_decode_u_32(arr[4]),
      height: dco_decode_u_32(arr[5]),
    );
  }

  @protected
  bool dco_decode_bool(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as bool;
  }

  @protected
  ColumnBlock dco_decode_column_block(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return ColumnBlock(
      dx: dco_decode_u_32(arr[0]),
      width: dco_decode_u_32(arr[1]),
    );
  }

  @protected
  DecodedImage dco_decode_decoded_image(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 3)
      throw Exception('unexpected arr length: expect 3 but see ${arr.length}');
    return DecodedImage(
      pixels: dco_decode_list_prim_u_8_strict(arr[0]),
      width: dco_decode_u_32(arr[1]),
      height: dco_decode_u_32(arr[2]),
    );
  }

  @protected
  List<Block> dco_decode_list_block(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return (raw as List<dynamic>).map(dco_decode_block).toList();
  }

  @protected
  List<ColumnBlock> dco_decode_list_column_block(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return (raw as List<dynamic>).map(dco_decode_column_block).toList();
  }

  @protected
  List<int> dco_decode_list_prim_u_8_loose(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as List<int>;
  }

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as Uint8List;
  }

  @protected
  List<RowBlock> dco_decode_list_row_block(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return (raw as List<dynamic>).map(dco_decode_row_block).toList();
  }

  @protected
  (int, int) dco_decode_record_u_32_u_32(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 2) {
      throw Exception('Expected 2 elements, got ${arr.length}');
    }
    return (dco_decode_u_32(arr[0]), dco_decode_u_32(arr[1]));
  }

  @protected
  RowBlock dco_decode_row_block(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return RowBlock(
      dy: dco_decode_u_32(arr[0]),
      height: dco_decode_u_32(arr[1]),
    );
  }

  @protected
  int dco_decode_u_32(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  int dco_decode_u_8(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  void dco_decode_unit(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return;
  }

  @protected
  String sse_decode_String(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_list_prim_u_8_strict(deserializer);
    return utf8.decoder.convert(inner);
  }

  @protected
  Block sse_decode_block(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_sx = sse_decode_u_32(deserializer);
    var var_sy = sse_decode_u_32(deserializer);
    var var_dx = sse_decode_u_32(deserializer);
    var var_dy = sse_decode_u_32(deserializer);
    var var_width = sse_decode_u_32(deserializer);
    var var_height = sse_decode_u_32(deserializer);
    return Block(
      sx: var_sx,
      sy: var_sy,
      dx: var_dx,
      dy: var_dy,
      width: var_width,
      height: var_height,
    );
  }

  @protected
  bool sse_decode_bool(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8() != 0;
  }

  @protected
  ColumnBlock sse_decode_column_block(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_dx = sse_decode_u_32(deserializer);
    var var_width = sse_decode_u_32(deserializer);
    return ColumnBlock(dx: var_dx, width: var_width);
  }

  @protected
  DecodedImage sse_decode_decoded_image(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_pixels = sse_decode_list_prim_u_8_strict(deserializer);
    var var_width = sse_decode_u_32(deserializer);
    var var_height = sse_decode_u_32(deserializer);
    return DecodedImage(
      pixels: var_pixels,
      width: var_width,
      height: var_height,
    );
  }

  @protected
  List<Block> sse_decode_list_block(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    var len_ = sse_decode_i_32(deserializer);
    var ans_ = <Block>[];
    for (var idx_ = 0; idx_ < len_; ++idx_) {
      ans_.add(sse_decode_block(deserializer));
    }
    return ans_;
  }

  @protected
  List<ColumnBlock> sse_decode_list_column_block(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    var len_ = sse_decode_i_32(deserializer);
    var ans_ = <ColumnBlock>[];
    for (var idx_ = 0; idx_ < len_; ++idx_) {
      ans_.add(sse_decode_column_block(deserializer));
    }
    return ans_;
  }

  @protected
  List<int> sse_decode_list_prim_u_8_loose(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var len_ = sse_decode_i_32(deserializer);
    return deserializer.buffer.getUint8List(len_);
  }

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var len_ = sse_decode_i_32(deserializer);
    return deserializer.buffer.getUint8List(len_);
  }

  @protected
  List<RowBlock> sse_decode_list_row_block(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    var len_ = sse_decode_i_32(deserializer);
    var ans_ = <RowBlock>[];
    for (var idx_ = 0; idx_ < len_; ++idx_) {
      ans_.add(sse_decode_row_block(deserializer));
    }
    return ans_;
  }

  @protected
  (int, int) sse_decode_record_u_32_u_32(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_field0 = sse_decode_u_32(deserializer);
    var var_field1 = sse_decode_u_32(deserializer);
    return (var_field0, var_field1);
  }

  @protected
  RowBlock sse_decode_row_block(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_dy = sse_decode_u_32(deserializer);
    var var_height = sse_decode_u_32(deserializer);
    return RowBlock(dy: var_dy, height: var_height);
  }

  @protected
  int sse_decode_u_32(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint32();
  }

  @protected
  int sse_decode_u_8(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8();
  }

  @protected
  void sse_decode_unit(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }

  @protected
  int sse_decode_i_32(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getInt32();
  }

  @protected
  void sse_encode_String(String self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_list_prim_u_8_strict(utf8.encoder.convert(self), serializer);
  }

  @protected
  void sse_encode_block(Block self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_u_32(self.sx, serializer);
    sse_encode_u_32(self.sy, serializer);
    sse_encode_u_32(self.dx, serializer);
    sse_encode_u_32(self.dy, serializer);
    sse_encode_u_32(self.width, serializer);
    sse_encode_u_32(self.height, serializer);
  }

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self ? 1 : 0);
  }

  @protected
  void sse_encode_column_block(ColumnBlock self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_u_32(self.dx, serializer);
    sse_encode_u_32(self.width, serializer);
  }

  @protected
  void sse_encode_decoded_image(DecodedImage self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_list_prim_u_8_strict(self.pixels, serializer);
    sse_encode_u_32(self.width, serializer);
    sse_encode_u_32(self.height, serializer);
  }

  @protected
  void sse_encode_list_block(List<Block> self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    for (final item in self) {
      sse_encode_block(item, serializer);
    }
  }

  @protected
  void sse_encode_list_column_block(
    List<ColumnBlock> self,
    SseSerializer serializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    for (final item in self) {
      sse_encode_column_block(item, serializer);
    }
  }

  @protected
  void sse_encode_list_prim_u_8_loose(
    List<int> self,
    SseSerializer serializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    serializer.buffer.putUint8List(
      self is Uint8List ? self : Uint8List.fromList(self),
    );
  }

  @protected
  void sse_encode_list_prim_u_8_strict(
    Uint8List self,
    SseSerializer serializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    serializer.buffer.putUint8List(self);
  }

  @protected
  void sse_encode_list_row_block(
    List<RowBlock> self,
    SseSerializer serializer,
  ) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    for (final item in self) {
      sse_encode_row_block(item, serializer);
    }
  }

  @protected
  void sse_encode_record_u_32_u_32((int, int) self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_u_32(self.$1, serializer);
    sse_encode_u_32(self.$2, serializer);
  }

  @protected
  void sse_encode_row_block(RowBlock self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_u_32(self.dy, serializer);
    sse_encode_u_32(self.height, serializer);
  }

  @protected
  void sse_encode_u_32(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint32(self);
  }

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self);
  }

  @protected
  void sse_encode_unit(void self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putInt32(self);
  }
}
