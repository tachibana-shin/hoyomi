// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eiga_context_with_episodes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EigaContextWithEpisodes _$EigaContextWithEpisodesFromJson(
  Map<String, dynamic> json,
) => _EigaContextWithEpisodes(
  eigaId: json['eigaId'] as String,
  metaEiga: MetaEiga.fromJson(json['metaEiga'] as Map<String, dynamic>),
  season: json['season'] == null
      ? null
      : Season.fromJson(json['season'] as Map<String, dynamic>),
  episodes: (json['episodes'] as List<dynamic>)
      .map((e) => EigaEpisode.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$EigaContextWithEpisodesToJson(
  _EigaContextWithEpisodes instance,
) => <String, dynamic>{
  'eigaId': instance.eigaId,
  'metaEiga': instance.metaEiga,
  'season': instance.season,
  'episodes': instance.episodes,
};
