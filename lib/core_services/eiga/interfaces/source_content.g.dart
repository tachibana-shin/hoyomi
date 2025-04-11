// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SourceContentImpl _$$SourceContentImplFromJson(Map<String, dynamic> json) =>
    _$SourceContentImpl(
      content: json['content'] as String,
      url: Uri.parse(json['url'] as String),
      headers: json['headers'] == null
          ? null
          : Headers.fromJson(json['headers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SourceContentImplToJson(_$SourceContentImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'url': instance.url.toString(),
      'headers': instance.headers,
    };
