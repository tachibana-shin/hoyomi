// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      createdAt: json['created_at'] as String,
      eigaTextId: json['eiga_text_id'] as String,
      name: json['name'] as String,
      poster: json['poster'] as String,
      seasonName: json['season_name'] as String,
      sourceId: json['source_id'] as String,
      watchCur: json['watch_cur'] as num,
      watchDur: json['watch_dur'] as num,
      watchId: json['watch_id'] as String,
      watchName: json['watch_name'] as String,
      watchUpdatedAt: json['watch_updated_at'] as String,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'eiga_text_id': instance.eigaTextId,
      'name': instance.name,
      'poster': instance.poster,
      'season_name': instance.seasonName,
      'source_id': instance.sourceId,
      'watch_cur': instance.watchCur,
      'watch_dur': instance.watchDur,
      'watch_id': instance.watchId,
      'watch_name': instance.watchName,
      'watch_updated_at': instance.watchUpdatedAt,
    };
