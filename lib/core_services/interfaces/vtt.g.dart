// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vtt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Vtt _$VttFromJson(Map<String, dynamic> json) => _Vtt(
  src: json['src'] as String,
  headers: json['headers'] == null
      ? null
      : Headers.fromJson(json['headers'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VttToJson(_Vtt instance) => <String, dynamic>{
  'src': instance.src,
  'headers': instance.headers,
};
