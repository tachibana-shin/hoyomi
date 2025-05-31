// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_watch_time_body_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SetWatchTimeBodySchema _$SetWatchTimeBodySchemaFromJson(
  Map<String, dynamic> json,
) => _SetWatchTimeBodySchema(
  sourceId: json['sourceId'] as String,
  name: json['name'] as String,
  originalName: json['original_name'] as String,
  poster: json['poster'] as String,
  eigaTextId: json['eiga_text_id'] as String,
  seasonName: json['season_name'],
  status: SetWatchTimeBodySchemaStatus.fromJson(json['status'] as String),
  cur: json['cur'] as num,
  dur: json['dur'] as num,
  episodeName: json['episode_name'] as String,
  episodeId: json['episode_id'] as String,
);

Map<String, dynamic> _$SetWatchTimeBodySchemaToJson(
  _SetWatchTimeBodySchema instance,
) => <String, dynamic>{
  'sourceId': instance.sourceId,
  'name': instance.name,
  'original_name': instance.originalName,
  'poster': instance.poster,
  'eiga_text_id': instance.eigaTextId,
  'season_name': instance.seasonName,
  'status': _$SetWatchTimeBodySchemaStatusEnumMap[instance.status]!,
  'cur': instance.cur,
  'dur': instance.dur,
  'episode_name': instance.episodeName,
  'episode_id': instance.episodeId,
};

const _$SetWatchTimeBodySchemaStatusEnumMap = {
  SetWatchTimeBodySchemaStatus.ongoing: 'ongoing',
  SetWatchTimeBodySchemaStatus.completed: 'completed',
  SetWatchTimeBodySchemaStatus.cancelled: 'cancelled',
  SetWatchTimeBodySchemaStatus.unknown: 'unknown',
  SetWatchTimeBodySchemaStatus.onHiatus: 'on_hiatus',
  SetWatchTimeBodySchemaStatus.publishingFinished: 'publishing_finished',
  SetWatchTimeBodySchemaStatus.$unknown: r'$unknown',
};
