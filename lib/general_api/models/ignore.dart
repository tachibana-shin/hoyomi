// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ignore.freezed.dart';
part 'ignore.g.dart';

@Freezed()
abstract class Ignore with _$Ignore {
  const factory Ignore({
    /// Source ID to exclude from results
    required String sourceId,

    /// Comic text ID to exclude from results
    @JsonKey(name: 'comic_text_id')
    required String comicTextId,
  }) = _Ignore;
  
  factory Ignore.fromJson(Map<String, Object?> json) => _$IgnoreFromJson(json);
}
