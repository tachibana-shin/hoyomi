// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_eiga_follow_body_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SetEigaFollowBodySchema _$SetEigaFollowBodySchemaFromJson(
  Map<String, dynamic> json,
) => _SetEigaFollowBodySchema(
  sourceId: json['sourceId'] as String,
  eigaTextId: json['eiga_text_id'] as String,
  name: json['name'] as String,
  originalName: json['original_name'] as String,
  poster: json['poster'] as String,
  seasonName: json['season_name'] as String,
  status: SetEigaFollowBodySchemaStatus.fromJson(json['status'] as String),
  currentEpisodeName: json['current_episode_name'] as String,
  currentEpisodeId: json['current_episode_id'] as String,
  currentEpisodeTime: DateTime.parse(json['current_episode_time'] as String),
  value: json['value'] as bool,
);

Map<String, dynamic> _$SetEigaFollowBodySchemaToJson(
  _SetEigaFollowBodySchema instance,
) => <String, dynamic>{
  'sourceId': instance.sourceId,
  'eiga_text_id': instance.eigaTextId,
  'name': instance.name,
  'original_name': instance.originalName,
  'poster': instance.poster,
  'season_name': instance.seasonName,
  'status': _$SetEigaFollowBodySchemaStatusEnumMap[instance.status]!,
  'current_episode_name': instance.currentEpisodeName,
  'current_episode_id': instance.currentEpisodeId,
  'current_episode_time': instance.currentEpisodeTime.toIso8601String(),
  'value': instance.value,
};

const _$SetEigaFollowBodySchemaStatusEnumMap = {
  SetEigaFollowBodySchemaStatus.ongoing: 'ongoing',
  SetEigaFollowBodySchemaStatus.completed: 'completed',
  SetEigaFollowBodySchemaStatus.cancelled: 'cancelled',
  SetEigaFollowBodySchemaStatus.unknown: 'unknown',
  SetEigaFollowBodySchemaStatus.onHiatus: 'on_hiatus',
  SetEigaFollowBodySchemaStatus.publishingFinished: 'publishing_finished',
  SetEigaFollowBodySchemaStatus.$unknown: r'$unknown',
};
