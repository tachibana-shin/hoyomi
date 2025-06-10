import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:eval_annotation/eval_annotation.dart';

part 'source_content.freezed.dart';
part 'source_content.g.dart';

@freezed
@Bind()
sealed class SourceContent with _$SourceContent {
  const factory SourceContent({
    required String content,
    required Uri url,
    Headers? headers,
  }) = _SourceContent;

  factory SourceContent.fromJson(Map<String, dynamic> json) =>
      _$SourceContentFromJson(json);
}
