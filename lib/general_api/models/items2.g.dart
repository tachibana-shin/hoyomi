// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Items2 _$Items2FromJson(Map<String, dynamic> json) => _Items2(
  createdAt: json['created_at'] as String,
  eigaTextId: json['eiga_text_id'] as String,
  name: json['name'] as String,
  poster: json['poster'] as String,
  seasonName: json['season_name'] as String?,
  sourceId: json['source_id'] as String,
  episodeName: json['episode_name'] as String,
  episodeId: json['episode_id'] as String,
  episodeTime: json['episode_time'] as String?,
);

Map<String, dynamic> _$Items2ToJson(_Items2 instance) => <String, dynamic>{
  'created_at': instance.createdAt,
  'eiga_text_id': instance.eigaTextId,
  'name': instance.name,
  'poster': instance.poster,
  'season_name': instance.seasonName,
  'source_id': instance.sourceId,
  'episode_name': instance.episodeName,
  'episode_id': instance.episodeId,
  'episode_time': instance.episodeTime,
};
