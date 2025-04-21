// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_watch_time_body_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SetWatchTimeBodySchemaImpl _$$SetWatchTimeBodySchemaImplFromJson(
        Map<String, dynamic> json) =>
    _$SetWatchTimeBodySchemaImpl(
      sourceId: json['sourceId'] as String,
      name: json['name'] as String,
      poster: json['poster'] as String,
      eigaTextId: json['eiga_text_id'] as String,
      seasonName: json['season_name'],
      cur: json['cur'] as num,
      dur: json['dur'] as num,
      episodeName: json['episode_name'] as String,
      episodeId: json['episode_id'] as String,
    );

Map<String, dynamic> _$$SetWatchTimeBodySchemaImplToJson(
        _$SetWatchTimeBodySchemaImpl instance) =>
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
