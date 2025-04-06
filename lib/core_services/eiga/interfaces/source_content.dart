import 'package:freezed_annotation/freezed_annotation.dart';

part 'source_content.freezed.dart';
part 'source_content.g.dart';

@freezed
class SourceContent with _$SourceContent {
  const factory SourceContent({
    required String content,
    required Uri url,
    @Default({}) Map<String, String> headers,
  }) = _SourceContent;

  factory SourceContent.fromJson(Map<String, dynamic> json) =>
      _$SourceContentFromJson(json);
}
