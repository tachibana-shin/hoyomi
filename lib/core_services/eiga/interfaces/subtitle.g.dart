// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtitle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubtitleImpl _$$SubtitleImplFromJson(Map<String, dynamic> json) =>
    _$SubtitleImpl(
      language: json['language'] as String,
      code: json['code'] as String,
      type: $enumDecode(_$SubtitleTypeEnumMap, json['type']),
      url: json['url'] as String,
      headers: (json['headers'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$SubtitleImplToJson(_$SubtitleImpl instance) =>
    <String, dynamic>{
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
