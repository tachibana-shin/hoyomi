// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SourceVideo _$SourceVideoFromJson(Map<String, dynamic> json) => _SourceVideo(
  src: json['src'] as String,
  type: json['type'] as String,
  headers: json['headers'] == null
      ? null
      : Headers.fromJson(json['headers'] as Map<String, dynamic>),
  extra: json['extra'] as String?,
);

Map<String, dynamic> _$SourceVideoToJson(_SourceVideo instance) =>
    <String, dynamic>{
      'src': instance.src,
      'type': instance.type,
      'headers': instance.headers,
      'extra': instance.extra,
    };
