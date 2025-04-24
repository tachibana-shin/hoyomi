// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@Freezed()
sealed class Data with _$Data {
  const factory Data({
    /// The timestamp when the watch history entry was created.
    @JsonKey(name: 'created_at') required String createdAt,

    /// The identifier for the specific episode of the text.
    @JsonKey(name: 'comic_text_id') required String comicTextId,

    /// The name of the watch history item (e.g., the episode title).
    required String name,

    /// The URL for the poster image of the episode.
    required String poster,

    /// The name of the season the episode belongs to.
    @JsonKey(name: 'season_name') required String seasonName,

    /// The source ID associated with the episode.
    @JsonKey(name: 'source_id') required String sourceId,

    /// The current watch page in seconds.
    @JsonKey(name: 'watch_cur') required num watchCur,

    /// The total page of the episode in seconds.
    @JsonKey(name: 'watch_dur') required num watchDur,

    /// The unique identifier for the watch session.
    @JsonKey(name: 'watch_id') required String watchId,

    /// The name associated with the watch session.
    @JsonKey(name: 'watch_name') required String watchName,

    /// The timestamp when the watch history entry was last updated.
    @JsonKey(name: 'watch_updated_at') required String watchUpdatedAt,
  }) = _Data;

  factory Data.fromJson(Map<String, Object?> json) => _$DataFromJson(json);
}
