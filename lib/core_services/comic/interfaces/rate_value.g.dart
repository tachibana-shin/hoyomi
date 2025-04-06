// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RateValueImpl _$$RateValueImplFromJson(Map<String, dynamic> json) =>
    _$RateValueImpl(
      best: (json['best'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$$RateValueImplToJson(_$RateValueImpl instance) =>
    <String, dynamic>{
      'best': instance.best,
      'count': instance.count,
      'value': instance.value,
    };
