import 'package:freezed_annotation/freezed_annotation.dart';

import 'main.dart';

part 'source_content.freezed.dart';
part 'source_content.g.dart';

@freezed
sealed class SourceContent with _$SourceContent {
  const factory SourceContent({
    required String content,
    required Uri url,
    @Default('hls') String type,
    Headers? headers,
  }) = _SourceContent;

  factory SourceContent.fromJson(Map<String, dynamic> json) =>
      _$SourceContentFromJson(json);
}
