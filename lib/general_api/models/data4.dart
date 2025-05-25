// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'data4.freezed.dart';
part 'data4.g.dart';

@Freezed()
abstract class Data4 with _$Data4 {
  const factory Data4({
    /// The timestamp when the watch history entry was created.
    @JsonKey(name: 'created_at')
    required String createdAt,

    /// The identifier for the specific episode of the text.
    @JsonKey(name: 'eiga_text_id')
    required String eigaTextId,

    /// The name of the watch history item (e.g., the episode title).
    required String name,
    @JsonKey(name: 'original_name')
    required String originalName,

    /// The URL for the poster image of the episode.
    required String poster,

    /// The source ID associated with the episode.
    @JsonKey(name: 'source_id')
    required String sourceId,

    /// The current watch position in seconds.
    @JsonKey(name: 'watch_cur')
    required num watchCur,

    /// The total duration of the episode in seconds.
    @JsonKey(name: 'watch_dur')
    required num watchDur,

    /// The unique identifier for the watch session.
    @JsonKey(name: 'watch_id')
    required String watchId,

    /// The name associated with the watch session.
    @JsonKey(name: 'watch_name')
    required String watchName,

    /// The timestamp when the watch history entry was last updated.
    @JsonKey(name: 'watch_updated_at')
    required String watchUpdatedAt,

    /// The name of the season the episode belongs to.
    @JsonKey(name: 'season_name')
    @Default('')
    String seasonName,
  }) = _Data4;
  
  factory Data4.fromJson(Map<String, Object?> json) => _$Data4FromJson(json);
}
