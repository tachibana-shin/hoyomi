// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eiga_episodes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EigaEpisodesImpl _$$EigaEpisodesImplFromJson(Map<String, dynamic> json) =>
    _$EigaEpisodesImpl(
      episodes: (json['episodes'] as List<dynamic>)
          .map((e) => EigaEpisode.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'] == null
          ? null
          : OImage.fromJson(json['image'] as Map<String, dynamic>),
      poster: json['poster'] == null
          ? null
          : OImage.fromJson(json['poster'] as Map<String, dynamic>),
      schedule: json['schedule'] == null
          ? null
          : DateTime.parse(json['schedule'] as String),
    );

Map<String, dynamic> _$$EigaEpisodesImplToJson(_$EigaEpisodesImpl instance) =>
    <String, dynamic>{
      'episodes': instance.episodes,
      'image': instance.image,
      'poster': instance.poster,
      'schedule': instance.schedule?.toIso8601String(),
    };
