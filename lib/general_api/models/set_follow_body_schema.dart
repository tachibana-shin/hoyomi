// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'current_chapters.dart';

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

    /// Poster image URL.
    required String poster,

    /// Season name (optional).
    @JsonKey(name: 'season_name')
    required String seasonName,

    /// Current chapter id.
    @JsonKey(name: 'chapter_Id')
    required String chapterId,

    /// Array of chapter meta info.
    @JsonKey(name: 'current_chapters')
    required List<CurrentChapters> currentChapters,

    /// Set to true to follow, false to unfollow.
    required bool value,
  }) = _SetFollowBodySchema;
  
  factory SetFollowBodySchema.fromJson(Map<String, Object?> json) => _$SetFollowBodySchemaFromJson(json);
}
