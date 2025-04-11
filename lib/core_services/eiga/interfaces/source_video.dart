import 'package:freezed_annotation/freezed_annotation.dart';

import 'main.dart';

part 'source_video.freezed.dart';
part 'source_video.g.dart';

@freezed
class SourceVideo with _$SourceVideo {
  const factory SourceVideo({
    required String src,
    required Uri url,
    required String type,
    Headers? headers,
    String? extra,
  }) = _SourceVideo;

  factory SourceVideo.fromJson(Map<String, dynamic> json) =>
      _$SourceVideoFromJson(json);
}
