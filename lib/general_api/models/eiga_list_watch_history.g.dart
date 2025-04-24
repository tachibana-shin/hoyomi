// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eiga_list_watch_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EigaListWatchHistory _$EigaListWatchHistoryFromJson(
  Map<String, dynamic> json,
) => _EigaListWatchHistory(
  data:
      (json['data'] as List<dynamic>)
          .map((e) => Data4.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$EigaListWatchHistoryToJson(
  _EigaListWatchHistory instance,
) => <String, dynamic>{'data': instance.data};
