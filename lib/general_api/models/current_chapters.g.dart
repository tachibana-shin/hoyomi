// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_chapters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CurrentChapters _$CurrentChaptersFromJson(Map<String, dynamic> json) =>
    _CurrentChapters(
      name: json['name'] as String,
      fullName: json['fullName'] as String,
      order: json['order'] as num,
      chapterId: json['chapterId'] as String,
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$CurrentChaptersToJson(_CurrentChapters instance) =>
    <String, dynamic>{
      'name': instance.name,
      'fullName': instance.fullName,
      'order': instance.order,
      'chapterId': instance.chapterId,
      'time': instance.time.toIso8601String(),
    };
