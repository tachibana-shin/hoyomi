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
      poster: json['poster'] as String,
      seasonName: json['season_name'] as String,
      chapterId: json['chapter_Id'] as String,
      currentChapters:
          (json['current_chapters'] as List<dynamic>)
              .map((e) => CurrentChapters.fromJson(e as Map<String, dynamic>))
              .toList(),
      value: json['value'] as bool,
    );

Map<String, dynamic> _$SetFollowBodySchemaToJson(
  _SetFollowBodySchema instance,
) => <String, dynamic>{
  'sourceId': instance.sourceId,
  'comic_text_id': instance.comicTextId,
  'name': instance.name,
  'poster': instance.poster,
  'season_name': instance.seasonName,
  'chapter_Id': instance.chapterId,
  'current_chapters': instance.currentChapters,
  'value': instance.value,
};
