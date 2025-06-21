// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ComicHistory _$ComicHistoryFromJson(Map<String, dynamic> json) =>
    _ComicHistory(
      sourceId: json['sourceId'] as String,
      item: Comic.fromJson(json['item'] as Map<String, dynamic>),
      watchUpdatedAt: DateTime.parse(json['watchUpdatedAt'] as String),
      lastChapter: ComicChapter.fromJson(
        json['lastChapter'] as Map<String, dynamic>,
      ),
      watchPage: WatchPage.fromJson(json['watchPage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicHistoryToJson(_ComicHistory instance) =>
    <String, dynamic>{
      'sourceId': instance.sourceId,
      'item': instance.item,
      'watchUpdatedAt': instance.watchUpdatedAt.toIso8601String(),
      'lastChapter': instance.lastChapter,
      'watchPage': instance.watchPage,
    };
