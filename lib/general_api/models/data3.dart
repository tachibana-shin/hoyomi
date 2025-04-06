// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'data3.freezed.dart';
part 'data3.g.dart';

@Freezed()
class Data3 with _$Data3 {
  const factory Data3({
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
  }) = _Data3;
  
  factory Data3.fromJson(Map<String, Object?> json) => _$Data3FromJson(json);
}
