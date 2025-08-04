// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eiga_follow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EigaFollow _$EigaFollowFromJson(Map<String, dynamic> json) => _EigaFollow(
  sourceId: json['sourceId'] as String,
  item: Eiga.fromJson(json['item'] as Map<String, dynamic>),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  lastEpisode: json['lastEpisode'] == null
      ? null
      : EigaEpisode.fromJson(json['lastEpisode'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EigaFollowToJson(_EigaFollow instance) =>
    <String, dynamic>{
      'sourceId': instance.sourceId,
      'item': instance.item,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'lastEpisode': instance.lastEpisode,
    };
