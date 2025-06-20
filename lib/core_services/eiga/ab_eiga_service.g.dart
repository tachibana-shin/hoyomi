// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ab_eiga_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EigaSourceContext _$EigaSourceContextFromJson(Map<String, dynamic> json) =>
    _EigaSourceContext(
      eigaId: json['eigaId'] as String,
      metaEiga: MetaEiga.fromJson(json['metaEiga'] as Map<String, dynamic>),
      episode: EigaEpisode.fromJson(json['episode'] as Map<String, dynamic>),
      source: SourceVideo.fromJson(json['source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EigaSourceContextToJson(_EigaSourceContext instance) =>
    <String, dynamic>{
      'eigaId': instance.eigaId,
      'metaEiga': instance.metaEiga,
      'episode': instance.episode,
      'source': instance.source,
    };
