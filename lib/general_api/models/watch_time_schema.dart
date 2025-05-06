// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'data5.dart';

part 'watch_time_schema.freezed.dart';
part 'watch_time_schema.g.dart';

/// The watch time object, which can be null if no data is available.
@Freezed()
abstract class WatchTimeSchema with _$WatchTimeSchema {
  const factory WatchTimeSchema({
    required Data5? data,
  }) = _WatchTimeSchema;
  
  factory WatchTimeSchema.fromJson(Map<String, Object?> json) => _$WatchTimeSchemaFromJson(json);
}
