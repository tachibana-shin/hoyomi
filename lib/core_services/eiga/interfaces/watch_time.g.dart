// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WatchTimeImpl _$$WatchTimeImplFromJson(Map<String, dynamic> json) =>
    _$WatchTimeImpl(
      position: Duration(microseconds: (json['position'] as num).toInt()),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
    );

Map<String, dynamic> _$$WatchTimeImplToJson(_$WatchTimeImpl instance) =>
    <String, dynamic>{
      'position': instance.position.inMicroseconds,
      'duration': instance.duration.inMicroseconds,
    };
