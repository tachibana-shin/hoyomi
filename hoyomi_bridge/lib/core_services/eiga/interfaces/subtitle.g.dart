// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtitle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Subtitle _$SubtitleFromJson(Map<String, dynamic> json) => _Subtitle(
      language: json['language'] as String,
      code: json['code'] as String,
      type: json['type'] as String,
      url: json['url'] as String,
      headers: json['headers'] == null
          ? null
          : Headers.fromJson(json['headers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubtitleToJson(_Subtitle instance) => <String, dynamic>{
      'language': instance.language,
      'code': instance.code,
      'type': instance.type,
      'url': instance.url,
      'headers': instance.headers,
    };
