// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eiga_episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EigaEpisodeImpl _$$EigaEpisodeImplFromJson(Map<String, dynamic> json) =>
    _$EigaEpisodeImpl(
      name: json['name'] as String,
      episodeId: json['episodeId'] as String,
      image: json['image'] == null
          ? null
          : OImage.fromJson(json['image'] as Map<String, dynamic>),
      description: json['description'] as String?,
      extra: json['extra'] as String?,
    );

Map<String, dynamic> _$$EigaEpisodeImplToJson(_$EigaEpisodeImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'episodeId': instance.episodeId,
      'image': instance.image,
      'description': instance.description,
      'extra': instance.extra,
    };
