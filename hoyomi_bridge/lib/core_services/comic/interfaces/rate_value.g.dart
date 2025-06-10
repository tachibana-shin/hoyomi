// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RateValue _$RateValueFromJson(Map<String, dynamic> json) => _RateValue(
      best: (json['best'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$RateValueToJson(_RateValue instance) =>
    <String, dynamic>{
      'best': instance.best,
      'count': instance.count,
      'value': instance.value,
    };
