// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eiga_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EigaContext _$EigaContextFromJson(Map<String, dynamic> json) => _EigaContext(
  eigaId: json['eigaId'] as String,
  metaEiga: MetaEiga.fromJson(json['metaEiga'] as Map<String, dynamic>),
  episode: EigaEpisode.fromJson(json['episode'] as Map<String, dynamic>),
  season:
      json['season'] == null
          ? null
          : Season.fromJson(json['season'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EigaContextToJson(_EigaContext instance) =>
    <String, dynamic>{
      'eigaId': instance.eigaId,
      'metaEiga': instance.metaEiga,
      'episode': instance.episode,
      'season': instance.season,
    };
