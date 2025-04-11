import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'headers.dart';

part 'o_image.freezed.dart';
part 'o_image.g.dart';

@freezed
class OImage with _$OImage {
  const factory OImage({
    required String src,
    Headers? headers,
  }) = _OImage;

  factory OImage.fromJson(Map<String, dynamic> json) => _$OImageFromJson(json);
  factory OImage.from(String src) => OImage(src: src);

  factory OImage.createFakeData() {
    return OImage(src: "fake:");
  }

  static final fake = "fake:";

  static Image network(
    String src, {
    required String sourceId,
    Key? key,
    double scale = 1.0,
    Widget Function(BuildContext, Widget, int?, bool)? frameBuilder,
    Widget Function(BuildContext, Widget, ImageChunkEvent?)? loadingBuilder,
    Widget Function(BuildContext, Object, StackTrace?)? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    FilterQuality filterQuality = FilterQuality.medium,
    bool isAntiAlias = false,
    Headers? headers,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    if (src == fake) {
      return Image.asset(
        'assets/images/blank.png',
        key: key,
        scale: scale,
        frameBuilder: frameBuilder,
        errorBuilder: errorBuilder,
        semanticLabel: semanticLabel,
        excludeFromSemantics: excludeFromSemantics,
        width: width,
        height: height,
        color: color,
        opacity: opacity,
        colorBlendMode: colorBlendMode,
        fit: fit,
        alignment: alignment,
        repeat: repeat,
        centerSlice: centerSlice,
        matchTextDirection: matchTextDirection,
        gaplessPlayback: gaplessPlayback,
        filterQuality: filterQuality,
        isAntiAlias: isAntiAlias,
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight,
      );
    }

    final service = getService(sourceId);

    return Image.network(
      src,
      key: key,
      scale: scale,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      filterQuality: filterQuality,
      isAntiAlias: isAntiAlias,
      headers: Headers({
        'set-cookie': service.getSetting(key: 'cookie') ?? '',
        'user-agent': service.getSetting(key: 'user_agent') ?? '',
        ...headers?.toMap() ?? {},
      }).toMap(),
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  static Image oNetwork(
    OImage img, {
    required String sourceId,
    Key? key,
    double scale = 1.0,
    Widget Function(BuildContext, Widget, int?, bool)? frameBuilder,
    Widget Function(BuildContext, Widget, ImageChunkEvent?)? loadingBuilder,
    Widget Function(BuildContext, Object, StackTrace?)? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    FilterQuality filterQuality = FilterQuality.medium,
    bool isAntiAlias = false,
    Headers? headers,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return network(
      img.src,
      sourceId: sourceId,
      key: key,
      scale: scale,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      filterQuality: filterQuality,
      isAntiAlias: isAntiAlias,
      headers: img.headers ?? headers,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }
}
