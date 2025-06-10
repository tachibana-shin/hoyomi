// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_time_updated.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WatchTimeUpdated _$WatchTimeUpdatedFromJson(Map<String, dynamic> json) =>
    _WatchTimeUpdated(
      position: Duration(microseconds: (json['position'] as num).toInt()),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$WatchTimeUpdatedToJson(_WatchTimeUpdated instance) =>
    <String, dynamic>{
      'position': instance.position.inMicroseconds,
      'duration': instance.duration.inMicroseconds,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
