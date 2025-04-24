// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_watch_page_body_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SetWatchPageBodySchema _$SetWatchPageBodySchemaFromJson(
  Map<String, dynamic> json,
) => _SetWatchPageBodySchema(
  sourceId: json['sourceId'] as String,
  name: json['name'] as String,
  poster: json['poster'] as String,
  comicTextId: json['comic_text_id'] as String,
  seasonName: json['season_name'],
  cur: json['cur'] as num,
  dur: json['dur'] as num,
  episodeName: json['episode_name'] as String,
  episodeId: json['episode_id'] as String,
);

Map<String, dynamic> _$SetWatchPageBodySchemaToJson(
  _SetWatchPageBodySchema instance,
) => <String, dynamic>{
  'sourceId': instance.sourceId,
  'name': instance.name,
  'poster': instance.poster,
  'comic_text_id': instance.comicTextId,
  'season_name': instance.seasonName,
  'cur': instance.cur,
  'dur': instance.dur,
  'episode_name': instance.episodeName,
  'episode_id': instance.episodeId,
};
