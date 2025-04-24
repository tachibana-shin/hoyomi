// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opening_ending.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DurationRange _$DurationRangeFromJson(Map<String, dynamic> json) =>
    _DurationRange(
      start: Duration(microseconds: (json['start'] as num).toInt()),
      end: Duration(microseconds: (json['end'] as num).toInt()),
    );

Map<String, dynamic> _$DurationRangeToJson(_DurationRange instance) =>
    <String, dynamic>{
      'start': instance.start.inMicroseconds,
      'end': instance.end.inMicroseconds,
    };

_OpeningEnding _$OpeningEndingFromJson(Map<String, dynamic> json) =>
    _OpeningEnding(
      opening:
          json['opening'] == null
              ? null
              : DurationRange.fromJson(json['opening'] as Map<String, dynamic>),
      ending:
          json['ending'] == null
              ? null
              : DurationRange.fromJson(json['ending'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OpeningEndingToJson(_OpeningEnding instance) =>
    <String, dynamic>{'opening': instance.opening, 'ending': instance.ending};
