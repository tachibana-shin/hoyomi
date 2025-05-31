// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'comic_list_watch_history.freezed.dart';
part 'comic_list_watch_history.g.dart';

/// An array of watch history items. Schema representing an individual watch history item.
@Freezed()
abstract class ComicListWatchHistory with _$ComicListWatchHistory {
  const factory ComicListWatchHistory({required List<Data> data}) =
      _ComicListWatchHistory;

  factory ComicListWatchHistory.fromJson(Map<String, Object?> json) =>
      _$ComicListWatchHistoryFromJson(json);
}
