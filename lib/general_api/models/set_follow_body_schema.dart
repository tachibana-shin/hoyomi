// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'set_follow_body_schema_status.dart';

part 'set_follow_body_schema.freezed.dart';
part 'set_follow_body_schema.g.dart';

@Freezed()
abstract class SetFollowBodySchema with _$SetFollowBodySchema {
  const factory SetFollowBodySchema({
    /// The unique identifier for the source (e.g., the series or season).
    required String sourceId,

    /// The identifier for the specific comic text.
    @JsonKey(name: 'comic_text_id')
    required String comicTextId,

    /// Comic name.
    required String name,

    /// Comic raw name.
    @JsonKey(name: 'original_name')
    required String originalName,

    /// Poster image URL.
    required String poster,

    /// Season name (optional).
    @JsonKey(name: 'season_name')
    required String seasonName,

    /// Comic status.
    required SetFollowBodySchemaStatus status,

    /// Current chapter name.
    @JsonKey(name: 'current_chapter_name')
    required String currentChapterName,

    /// Current chapter full name.
    @JsonKey(name: 'current_chapter_full_name')
    required String currentChapterFullName,

    /// Current chapter id.
    @JsonKey(name: 'current_chapter_id')
    required String currentChapterId,

    /// Current chapter time (ISO string).
    @JsonKey(name: 'current_chapter_time')
    required DateTime currentChapterTime,

    /// Set to true to follow, false to unfollow.
    required bool value,
  }) = _SetFollowBodySchema;
  
  factory SetFollowBodySchema.fromJson(Map<String, Object?> json) => _$SetFollowBodySchemaFromJson(json);
}
