import 'package:freezed_annotation/freezed_annotation.dart';

part 'subtitle.freezed.dart';
part 'subtitle.g.dart';

@freezed
class Subtitle with _$Subtitle {
  const factory Subtitle({
    required String language,
    required String code,
    required String url,
  }) = _Subtitle;

  factory Subtitle.fromJson(Map<String, dynamic> json) =>
      _$SubtitleFromJson(json);
}
