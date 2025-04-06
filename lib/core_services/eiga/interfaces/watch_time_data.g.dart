// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_time_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WatchTimeDataImpl _$$WatchTimeDataImplFromJson(Map<String, dynamic> json) =>
    _$WatchTimeDataImpl(
      eigaId: json['eigaId'] as String,
      episodeId: json['episodeId'] as String,
      watchTime: json['watchTime'] == null
          ? null
          : WatchTime.fromJson(json['watchTime'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WatchTimeDataImplToJson(_$WatchTimeDataImpl instance) =>
    <String, dynamic>{
      'eigaId': instance.eigaId,
      'episodeId': instance.episodeId,
      'watchTime': instance.watchTime,
    };
