// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_watch_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListWatchHistoryImpl _$$ListWatchHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ListWatchHistoryImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListWatchHistoryImplToJson(
        _$ListWatchHistoryImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
