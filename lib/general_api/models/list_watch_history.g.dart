// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_watch_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListWatchHistory _$ListWatchHistoryFromJson(Map<String, dynamic> json) =>
    _ListWatchHistory(
      data:
          (json['data'] as List<dynamic>)
              .map((e) => Data.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ListWatchHistoryToJson(_ListWatchHistory instance) =>
    <String, dynamic>{'data': instance.data};
