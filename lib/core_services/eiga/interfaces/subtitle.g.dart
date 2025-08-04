// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtitle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Subtitle _$SubtitleFromJson(Map<String, dynamic> json) => _Subtitle(
  language: json['language'] as String,
  code: json['code'] as String,
  type: $enumDecode(_$SubtitleTypeEnumMap, json['type']),
  url: json['url'] as String,
  headers: json['headers'] == null
      ? null
      : Headers.fromJson(json['headers'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SubtitleToJson(_Subtitle instance) => <String, dynamic>{
  'language': instance.language,
  'code': instance.code,
  'type': _$SubtitleTypeEnumMap[instance.type]!,
  'url': instance.url,
  'headers': instance.headers,
};

const _$SubtitleTypeEnumMap = {
  SubtitleType.srt: 'srt',
  SubtitleType.ssa: 'ssa',
  SubtitleType.ttml: 'ttml',
  SubtitleType.dfxp: 'dfxp',
  SubtitleType.sbv: 'sbv',
  SubtitleType.vtt: 'vtt',
  SubtitleType.custom: 'custom',
};
