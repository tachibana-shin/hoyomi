// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'data3.dart';

part 'watch_page_schema.freezed.dart';
part 'watch_page_schema.g.dart';

/// The watch page object, which can be null if no data is available.
@Freezed()
abstract class WatchPageSchema with _$WatchPageSchema {
  const factory WatchPageSchema({
    required Data3? data,
  }) = _WatchPageSchema;
  
  factory WatchPageSchema.fromJson(Map<String, Object?> json) => _$WatchPageSchemaFromJson(json);
}
