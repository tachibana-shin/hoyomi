// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'data5.freezed.dart';
part 'data5.g.dart';

@Freezed()
abstract class Data5 with _$Data5 {
  const factory Data5({
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
  }) = _Data5;
  
  factory Data5.fromJson(Map<String, Object?> json) => _$Data5FromJson(json);
}
