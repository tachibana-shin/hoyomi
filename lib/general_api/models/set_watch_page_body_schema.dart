// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'set_watch_page_body_schema_status.dart';

part 'set_watch_page_body_schema.freezed.dart';
part 'set_watch_page_body_schema.g.dart';

@Freezed()
abstract class SetWatchPageBodySchema with _$SetWatchPageBodySchema {
  const factory SetWatchPageBodySchema({
    /// The unique identifier for the source (e.g., series or season).
    required String sourceId,

    /// The name of the episode.
    required String name,

    /// Comic raw name.
    @JsonKey(name: 'original_name')
    required String originalName,

    /// URL to the poster image for the episode.
    required String poster,

    /// Unique identifier for the comic (movie/show) text.
    @JsonKey(name: 'comic_text_id') required String comicTextId,

    /// The name of the season.
    @JsonKey(name: 'season_name') required dynamic seasonName,

    /// Comic status.
    required SetWatchPageBodySchemaStatus status,

    /// The current watch page in seconds.
    required num cur,

    /// The total page of the episode in seconds.
    required num dur,

    /// The name of the episode.
    @JsonKey(name: 'episode_name') required String episodeName,

    /// Unique identifier for the episode.
    @JsonKey(name: 'episode_id') required String episodeId,
  }) = _SetWatchPageBodySchema;

  factory SetWatchPageBodySchema.fromJson(Map<String, Object?> json) =>
      _$SetWatchPageBodySchemaFromJson(json);
}
