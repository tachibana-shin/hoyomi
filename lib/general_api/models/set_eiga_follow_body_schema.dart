// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_eiga_follow_body_schema.freezed.dart';
part 'set_eiga_follow_body_schema.g.dart';

@Freezed()
abstract class SetEigaFollowBodySchema with _$SetEigaFollowBodySchema {
  const factory SetEigaFollowBodySchema({
    /// The unique identifier for the source (e.g., the series or season).
    required String sourceId,

    /// The identifier for the specific eiga text.
    @JsonKey(name: 'eiga_text_id')
    required String eigaTextId,

    /// Eiga name.
    required String name,

    /// Eiga raw name.
    @JsonKey(name: 'original_name')
    required String originalName,

    /// Poster image URL.
    required String poster,

    /// Season name (optional).
    @JsonKey(name: 'season_name')
    required String seasonName,

    /// Current episode name.
    @JsonKey(name: 'current_episode_name')
    required String currentEpisodeName,

    /// Current episode id.
    @JsonKey(name: 'current_episode_id')
    required String currentEpisodeId,

    /// Current episode time (ISO string).
    @JsonKey(name: 'current_episode_time')
    required DateTime currentEpisodeTime,

    /// Set to true to follow, false to unfollow.
    required bool value,
  }) = _SetEigaFollowBodySchema;
  
  factory SetEigaFollowBodySchema.fromJson(Map<String, Object?> json) => _$SetEigaFollowBodySchemaFromJson(json);
}
