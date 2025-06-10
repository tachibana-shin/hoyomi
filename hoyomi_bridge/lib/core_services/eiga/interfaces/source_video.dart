import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:eval_annotation/eval_annotation.dart';

part 'source_video.freezed.dart';
part 'source_video.g.dart';

@freezed
@Bind()
sealed class SourceVideo with _$SourceVideo {
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
