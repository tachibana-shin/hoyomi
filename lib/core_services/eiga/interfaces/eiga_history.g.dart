// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eiga_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EigaHistory _$EigaHistoryFromJson(Map<String, dynamic> json) => _EigaHistory(
  sourceId: json['sourceId'] as String,
  item: Eiga.fromJson(json['item'] as Map<String, dynamic>),
  watchUpdatedAt: DateTime.parse(json['watchUpdatedAt'] as String),
  lastEpisode: EigaEpisode.fromJson(
    json['lastEpisode'] as Map<String, dynamic>,
  ),
  watchTime: WatchTime.fromJson(json['watchTime'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EigaHistoryToJson(_EigaHistory instance) =>
    <String, dynamic>{
      'sourceId': instance.sourceId,
      'item': instance.item,
      'watchUpdatedAt': instance.watchUpdatedAt.toIso8601String(),
      'lastEpisode': instance.lastEpisode,
      'watchTime': instance.watchTime,
    };
