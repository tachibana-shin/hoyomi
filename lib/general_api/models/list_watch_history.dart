// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'list_watch_history.freezed.dart';
part 'list_watch_history.g.dart';

/// An array of watch history items. Schema representing an individual watch history item.
@Freezed()
class ListWatchHistory with _$ListWatchHistory {
  const factory ListWatchHistory({
    required List<Data> data,
  }) = _ListWatchHistory;
  
  factory ListWatchHistory.fromJson(Map<String, Object?> json) => _$ListWatchHistoryFromJson(json);
}
