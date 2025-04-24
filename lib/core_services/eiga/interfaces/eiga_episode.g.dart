// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eiga_episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EigaEpisode _$EigaEpisodeFromJson(Map<String, dynamic> json) => _EigaEpisode(
  name: json['name'] as String,
  episodeId: json['episodeId'] as String,
  image:
      json['image'] == null
          ? null
          : OImage.fromJson(json['image'] as Map<String, dynamic>),
  description: json['description'] as String?,
  extra: json['extra'] as String?,
  index: (json['index'] as num?)?.toInt() ?? -1,
);

Map<String, dynamic> _$EigaEpisodeToJson(_EigaEpisode instance) =>
    <String, dynamic>{
      'name': instance.name,
      'episodeId': instance.episodeId,
      'image': instance.image,
      'description': instance.description,
      'extra': instance.extra,
      'index': instance.index,
    };
