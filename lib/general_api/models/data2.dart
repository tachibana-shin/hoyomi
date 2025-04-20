// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'data2.freezed.dart';
part 'data2.g.dart';

@Freezed()
class Data2 with _$Data2 {
  const factory Data2({
    /// The current page in the episode in seconds.
    required num cur,

    /// The total page of the episode in seconds.
    required num dur,

    /// The name of the episode.
    required String name,

    /// Timestamp when the watch page was recorded, in ISO 8601 format.
    required String createdAt,

    /// Timestamp when the watch page was last updated, in ISO 8601 format.
    required String updatedAt,

    /// The unique identifier for the chapter within the episode or series.
    required String chapId,
  }) = _Data2;
  
  factory Data2.fromJson(Map<String, Object?> json) => _$Data2FromJson(json);
}
