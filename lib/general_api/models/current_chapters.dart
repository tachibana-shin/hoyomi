// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_chapters.freezed.dart';
part 'current_chapters.g.dart';

@Freezed()
abstract class CurrentChapters with _$CurrentChapters {
  const factory CurrentChapters({
    required String name,
    required String fullName,
    required num order,
    required String chapterId,
    required DateTime time,
  }) = _CurrentChapters;
  
  factory CurrentChapters.fromJson(Map<String, Object?> json) => _$CurrentChaptersFromJson(json);
}
