// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_list_watch_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComicListWatchHistoryImpl _$$ComicListWatchHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ComicListWatchHistoryImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ComicListWatchHistoryImplToJson(
        _$ComicListWatchHistoryImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
