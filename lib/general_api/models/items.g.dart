// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Items _$ItemsFromJson(Map<String, dynamic> json) => _Items(
  createdAt: json['created_at'] as String,
  comicTextId: json['comic_text_id'] as String,
  name: json['name'] as String,
  originalName: json['original_name'] as String,
  poster: json['poster'] as String,
  seasonName: json['season_name'] as String?,
  sourceId: json['source_id'] as String,
  chapterName: json['chapter_name'] as String,
  chapterId: json['chapter_id'] as String,
  chapterTime: json['chapter_time'] as String?,
);

Map<String, dynamic> _$ItemsToJson(_Items instance) => <String, dynamic>{
  'created_at': instance.createdAt,
  'comic_text_id': instance.comicTextId,
  'name': instance.name,
  'original_name': instance.originalName,
  'poster': instance.poster,
  'season_name': instance.seasonName,
  'source_id': instance.sourceId,
  'chapter_name': instance.chapterName,
  'chapter_id': instance.chapterId,
  'chapter_time': instance.chapterTime,
};
