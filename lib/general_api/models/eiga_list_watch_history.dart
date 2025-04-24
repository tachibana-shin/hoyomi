// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'data4.dart';

part 'eiga_list_watch_history.freezed.dart';
part 'eiga_list_watch_history.g.dart';

/// An array of watch history items. Schema representing an individual watch history item.
@Freezed()
sealed class EigaListWatchHistory with _$EigaListWatchHistory {
  const factory EigaListWatchHistory({
    required List<Data4> data,
  }) = _EigaListWatchHistory;

  factory EigaListWatchHistory.fromJson(Map<String, Object?> json) =>
      _$EigaListWatchHistoryFromJson(json);
}
