// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'query_schema.freezed.dart';
part 'query_schema.g.dart';

@Freezed()
class QuerySchema with _$QuerySchema {
  const factory QuerySchema({
    /// The unique identifier for the source (e.g., series or season).
    required String sourceId,

    /// The name of the episode.
    required String name,

    /// URL to the poster image for the episode.
    required String poster,

    /// Unique identifier for the comic (movie/show) text.
    @JsonKey(name: 'comic_text_id')
    required String comicTextId,

    /// The name of the season.
    @JsonKey(name: 'season_name')
    required String seasonName,

    /// The current watch page in seconds.
    required num cur,

    /// The total page of the episode in seconds.
    required num dur,

    /// The name of the episode.
    @JsonKey(name: 'episode_name')
    required String episodeName,

    /// Unique identifier for the episode.
    @JsonKey(name: 'episode_id')
    required String episodeId,
  }) = _QuerySchema;
  
  factory QuerySchema.fromJson(Map<String, Object?> json) => _$QuerySchemaFromJson(json);
}
