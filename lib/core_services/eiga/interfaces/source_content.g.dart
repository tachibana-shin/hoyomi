// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SourceContent _$SourceContentFromJson(Map<String, dynamic> json) =>
    _SourceContent(
      content: json['content'] as String,
      url: Uri.parse(json['url'] as String),
      headers: json['headers'] == null
          ? null
          : Headers.fromJson(json['headers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SourceContentToJson(_SourceContent instance) =>
    <String, dynamic>{
      'content': instance.content,
      'url': instance.url.toString(),
      'headers': instance.headers,
    };
