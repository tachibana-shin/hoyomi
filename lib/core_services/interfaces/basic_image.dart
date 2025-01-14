import 'package:flutter/material.dart';
import 'package:hoyomi/controller/cookie.dart';

class BasicImage {
  final String src;
  final Map<String, String>? headers;

  static final fake = "fake:";

  BasicImage({required this.src, this.headers});

  // Convert from JSON
  factory BasicImage.fromJson(Map<String, dynamic> json) {
    return BasicImage(
      src: json['src'],
      headers: (json['headers'] as Map<String, dynamic>?)
          ?.map((key, value) => MapEntry(key, value as String)),
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'src': src,
      'headers': headers,
    };
  }

  factory BasicImage.createFakeData() {
    return BasicImage(src: fake);
  }

  static Widget network(
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
    Map<String, String>? headers,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    if (src == fake) {
      return Image.asset('assets/images/blank.png',
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
          cacheHeight: cacheHeight);
    }

    final cookie = CookieController.get(sourceId: sourceId);

    return Image.network(src,
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
        headers: {
          'set-cookie': cookie?.cookie ?? '',
          'user-agent': cookie?.userAgent ?? '',
          ...headers ?? {}
        },
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight);
  }
}
