// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_list_watch_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ComicListWatchHistory _$ComicListWatchHistoryFromJson(
        Map<String, dynamic> json) =>
    _ComicListWatchHistory(
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicListWatchHistoryToJson(
        _ComicListWatchHistory instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
