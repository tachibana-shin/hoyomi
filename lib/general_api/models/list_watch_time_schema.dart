// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'data2.dart';

part 'list_watch_time_schema.freezed.dart';
part 'list_watch_time_schema.g.dart';

/// A list of watch page entries, each representing the page watched for a specific episode.
@Freezed()
class ListWatchTimeSchema with _$ListWatchTimeSchema {
  const factory ListWatchTimeSchema({
    required List<Data2> data,
  }) = _ListWatchTimeSchema;
  
  factory ListWatchTimeSchema.fromJson(Map<String, Object?> json) => _$ListWatchTimeSchemaFromJson(json);
}
