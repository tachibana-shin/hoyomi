// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_time_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WatchTimeData _$WatchTimeDataFromJson(Map<String, dynamic> json) =>
    _WatchTimeData(
      eigaId: json['eigaId'] as String,
      episodeId: json['episodeId'] as String,
      watchTime:
          json['watchTime'] == null
              ? null
              : WatchTime.fromJson(json['watchTime'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WatchTimeDataToJson(_WatchTimeData instance) =>
    <String, dynamic>{
      'eigaId': instance.eigaId,
      'episodeId': instance.episodeId,
      'watchTime': instance.watchTime,
    };
