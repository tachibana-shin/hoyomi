// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_time_updated.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WatchTimeUpdatedImpl _$$WatchTimeUpdatedImplFromJson(
        Map<String, dynamic> json) =>
    _$WatchTimeUpdatedImpl(
      position: Duration(microseconds: (json['position'] as num).toInt()),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$WatchTimeUpdatedImplToJson(
        _$WatchTimeUpdatedImpl instance) =>
    <String, dynamic>{
      'position': instance.position.inMicroseconds,
      'duration': instance.duration.inMicroseconds,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
