// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuerySchemaImpl _$$QuerySchemaImplFromJson(Map<String, dynamic> json) =>
    _$QuerySchemaImpl(
      sourceId: json['sourceId'] as String,
      name: json['name'] as String,
      poster: json['poster'] as String,
      eigaTextId: json['eiga_text_id'] as String,
      seasonName: json['season_name'] as String,
      cur: json['cur'] as num,
      dur: json['dur'] as num,
      episodeName: json['episode_name'] as String,
      episodeId: json['episode_id'] as String,
    );

Map<String, dynamic> _$$QuerySchemaImplToJson(_$QuerySchemaImpl instance) =>
    <String, dynamic>{
      'sourceId': instance.sourceId,
      'name': instance.name,
      'poster': instance.poster,
      'eiga_text_id': instance.eigaTextId,
      'season_name': instance.seasonName,
      'cur': instance.cur,
      'dur': instance.dur,
      'episode_name': instance.episodeName,
      'episode_id': instance.episodeId,
    };
