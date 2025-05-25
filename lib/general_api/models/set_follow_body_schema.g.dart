// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_follow_body_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SetFollowBodySchema _$SetFollowBodySchemaFromJson(Map<String, dynamic> json) =>
    _SetFollowBodySchema(
      sourceId: json['sourceId'] as String,
      comicTextId: json['comic_text_id'] as String,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      poster: json['poster'] as String,
      seasonName: json['season_name'] as String,
      currentChapterName: json['current_chapter_name'] as String,
      currentChapterFullName: json['current_chapter_full_name'] as String,
      currentChapterId: json['current_chapter_id'] as String,
      currentChapterTime: DateTime.parse(
        json['current_chapter_time'] as String,
      ),
      value: json['value'] as bool,
    );

Map<String, dynamic> _$SetFollowBodySchemaToJson(
  _SetFollowBodySchema instance,
) => <String, dynamic>{
  'sourceId': instance.sourceId,
  'comic_text_id': instance.comicTextId,
  'name': instance.name,
  'original_name': instance.originalName,
  'poster': instance.poster,
  'season_name': instance.seasonName,
  'current_chapter_name': instance.currentChapterName,
  'current_chapter_full_name': instance.currentChapterFullName,
  'current_chapter_id': instance.currentChapterId,
  'current_chapter_time': instance.currentChapterTime.toIso8601String(),
  'value': instance.value,
};
