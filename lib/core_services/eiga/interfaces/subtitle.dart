import 'package:freezed_annotation/freezed_annotation.dart';

import 'main.dart';

export 'package:subtitle/subtitle.dart' show SubtitleType;

part 'subtitle.freezed.dart';
part 'subtitle.g.dart';

@freezed
sealed class Subtitle with _$Subtitle {
  const factory Subtitle({
    required String language,
    required String code,
    required SubtitleType type,
    required String url,
    Headers? headers,
  }) = _Subtitle;

  factory Subtitle.fromJson(Map<String, dynamic> json) =>
      _$SubtitleFromJson(json);
}
