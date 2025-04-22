// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eiga_list_watch_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EigaListWatchHistoryImpl _$$EigaListWatchHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$EigaListWatchHistoryImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Data4.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EigaListWatchHistoryImplToJson(
        _$EigaListWatchHistoryImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
