// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ignore2.freezed.dart';
part 'ignore2.g.dart';

@Freezed()
abstract class Ignore2 with _$Ignore2 {
  const factory Ignore2({
    /// Source ID to exclude from the result (optional)
    required String sourceId,

    /// Unique identifier for the eiga to exclude
    @JsonKey(name: 'eiga_text_id')
    required String eigaTextId,
  }) = _Ignore2;
  
  factory Ignore2.fromJson(Map<String, Object?> json) => _$Ignore2FromJson(json);
}
