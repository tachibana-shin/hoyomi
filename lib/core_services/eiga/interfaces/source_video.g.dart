// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SourceVideoImpl _$$SourceVideoImplFromJson(Map<String, dynamic> json) =>
    _$SourceVideoImpl(
      src: json['src'] as String,
      url: Uri.parse(json['url'] as String),
      type: json['type'] as String,
      headers: (json['headers'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
    );

Map<String, dynamic> _$$SourceVideoImplToJson(_$SourceVideoImpl instance) =>
    <String, dynamic>{
      'src': instance.src,
      'url': instance.url.toString(),
      'type': instance.type,
      'headers': instance.headers,
    };
