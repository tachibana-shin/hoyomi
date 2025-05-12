// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ComicChapter _$ComicChapterFromJson(Map<String, dynamic> json) =>
    _ComicChapter(
      name: json['name'] as String,
      fullName: json['fullName'] as String?,
      order: (json['order'] as num).toInt(),
      chapterId: json['chapterId'] as String,
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      extra: json['extra'] as String?,
    );

Map<String, dynamic> _$ComicChapterToJson(_ComicChapter instance) =>
    <String, dynamic>{
      'name': instance.name,
      'fullName': instance.fullName,
      'order': instance.order,
      'chapterId': instance.chapterId,
      'time': instance.time?.toIso8601String(),
      'extra': instance.extra,
    };
