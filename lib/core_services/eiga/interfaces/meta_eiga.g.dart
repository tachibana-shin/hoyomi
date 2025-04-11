// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_eiga.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeasonImpl _$$SeasonImplFromJson(Map<String, dynamic> json) => _$SeasonImpl(
      name: json['name'] as String,
      eigaId: json['eigaId'] as String,
    );

Map<String, dynamic> _$$SeasonImplToJson(_$SeasonImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'eigaId': instance.eigaId,
    };

_$MetaEigaImpl _$$MetaEigaImplFromJson(Map<String, dynamic> json) =>
    _$MetaEigaImpl(
      name: json['name'] as String,
      originalName: json['originalName'] as String?,
      image: OImage.fromJson(json['image'] as Map<String, dynamic>),
      poster: json['poster'] == null
          ? null
          : OImage.fromJson(json['poster'] as Map<String, dynamic>),
      description: json['description'] as String,
      rate: (json['rate'] as num?)?.toDouble(),
      countRate: (json['countRate'] as num?)?.toInt(),
      countSub: (json['countSub'] as num?)?.toInt(),
      countDub: (json['countDub'] as num?)?.toInt(),
      duration: json['duration'] as String?,
      yearOf: (json['yearOf'] as num?)?.toInt(),
      views: (json['views'] as num?)?.toInt(),
      seasons: (json['seasons'] as List<dynamic>)
          .map((e) => Season.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      quality: json['quality'] as String?,
      authors: (json['authors'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      countries: (json['countries'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      language: json['language'] as String?,
      studios: (json['studios'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      movieSeason: json['movieSeason'] == null
          ? null
          : Genre.fromJson(json['movieSeason'] as Map<String, dynamic>),
      trailer: json['trailer'] as String?,
      fake: json['fake'] as bool? ?? false,
    );

Map<String, dynamic> _$$MetaEigaImplToJson(_$MetaEigaImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'originalName': instance.originalName,
      'image': instance.image,
      'poster': instance.poster,
      'description': instance.description,
      'rate': instance.rate,
      'countRate': instance.countRate,
      'countSub': instance.countSub,
      'countDub': instance.countDub,
      'duration': instance.duration,
      'yearOf': instance.yearOf,
      'views': instance.views,
      'seasons': instance.seasons,
      'genres': instance.genres,
      'quality': instance.quality,
      'authors': instance.authors,
      'countries': instance.countries,
      'language': instance.language,
      'studios': instance.studios,
      'movieSeason': instance.movieSeason,
      'trailer': instance.trailer,
      'fake': instance.fake,
    };
