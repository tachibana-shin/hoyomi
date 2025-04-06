// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opening_ending.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DurationRangeImpl _$$DurationRangeImplFromJson(Map<String, dynamic> json) =>
    _$DurationRangeImpl(
      start: Duration(microseconds: (json['start'] as num).toInt()),
      end: Duration(microseconds: (json['end'] as num).toInt()),
    );

Map<String, dynamic> _$$DurationRangeImplToJson(_$DurationRangeImpl instance) =>
    <String, dynamic>{
      'start': instance.start.inMicroseconds,
      'end': instance.end.inMicroseconds,
    };

_$OpeningEndingImpl _$$OpeningEndingImplFromJson(Map<String, dynamic> json) =>
    _$OpeningEndingImpl(
      opening: json['opening'] == null
          ? null
          : DurationRange.fromJson(json['opening'] as Map<String, dynamic>),
      ending: json['ending'] == null
          ? null
          : DurationRange.fromJson(json['ending'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OpeningEndingImplToJson(_$OpeningEndingImpl instance) =>
    <String, dynamic>{
      'opening': instance.opening,
      'ending': instance.ending,
    };
