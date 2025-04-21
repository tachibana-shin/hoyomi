// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_watch_time_body_schema.freezed.dart';
part 'set_watch_time_body_schema.g.dart';

@Freezed()
class SetWatchTimeBodySchema with _$SetWatchTimeBodySchema {
  const factory SetWatchTimeBodySchema({
    /// The unique identifier for the source (e.g., series or season).
    required String sourceId,

    /// The name of the episode.
    required String name,

    /// URL to the poster image for the episode.
    required String poster,

    /// Unique identifier for the eiga (movie/show) text.
    @JsonKey(name: 'eiga_text_id')
    required String eigaTextId,

    /// The name of the season.
    @JsonKey(name: 'season_name')
    required String seasonName,

    /// The current watch time in seconds.
    required num cur,

    /// The total duration of the episode in seconds.
    required num dur,

    /// The name of the episode.
    @JsonKey(name: 'episode_name')
    required String episodeName,

    /// Unique identifier for the episode.
    @JsonKey(name: 'episode_id')
    required String episodeId,
  }) = _SetWatchTimeBodySchema;
  
  factory SetWatchTimeBodySchema.fromJson(Map<String, Object?> json) => _$SetWatchTimeBodySchemaFromJson(json);
}
