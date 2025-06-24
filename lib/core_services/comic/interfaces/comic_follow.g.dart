// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_follow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ComicFollow _$ComicFollowFromJson(Map<String, dynamic> json) => _ComicFollow(
  sourceId: json['sourceId'] as String,
  item: Comic.fromJson(json['item'] as Map<String, dynamic>),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
  lastChapter:
      json['lastChapter'] == null
          ? null
          : ComicChapter.fromJson(json['lastChapter'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ComicFollowToJson(_ComicFollow instance) =>
    <String, dynamic>{
      'sourceId': instance.sourceId,
      'item': instance.item,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'lastChapter': instance.lastChapter,
    };
