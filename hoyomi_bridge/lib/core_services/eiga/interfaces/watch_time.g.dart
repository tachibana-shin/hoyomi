// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WatchTime _$WatchTimeFromJson(Map<String, dynamic> json) => _WatchTime(
      position: Duration(microseconds: (json['position'] as num).toInt()),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
    );

Map<String, dynamic> _$WatchTimeToJson(_WatchTime instance) =>
    <String, dynamic>{
      'position': instance.position.inMicroseconds,
      'duration': instance.duration.inMicroseconds,
    };
