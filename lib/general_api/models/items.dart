// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'items.freezed.dart';
part 'items.g.dart';

@Freezed()
abstract class Items with _$Items {
  const factory Items({
    @JsonKey(name: 'created_at')
    required String createdAt,
    @JsonKey(name: 'comic_text_id')
    required String comicTextId,
    required String name,
    @JsonKey(name: 'original_name')
    required String originalName,
    required String poster,
    @JsonKey(name: 'season_name')
    required String? seasonName,
    @JsonKey(name: 'source_id')
    required String sourceId,
    @JsonKey(name: 'chapter_name')
    required String chapterName,
    @JsonKey(name: 'chapter_id')
    required String chapterId,
    @JsonKey(name: 'chapter_time')
    required String? chapterTime,
  }) = _Items;
  
  factory Items.fromJson(Map<String, Object?> json) => _$ItemsFromJson(json);
}
