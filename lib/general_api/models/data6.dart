// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'data6.freezed.dart';
part 'data6.g.dart';

@Freezed()
abstract class Data6 with _$Data6 {
  const factory Data6({
    /// The current time in seconds for the episode.
    required num cur,

    /// The total duration of the episode in seconds.
    required num dur,

    /// The name of the episode.
    required String name,

    /// ISO 8601 format timestamp when the watch time was recorded.
    required String createdAt,

    /// ISO 8601 format timestamp when the watch time was last updated.
    required String updatedAt,
  }) = _Data6;

  factory Data6.fromJson(Map<String, Object?> json) => _$Data6FromJson(json);
}
