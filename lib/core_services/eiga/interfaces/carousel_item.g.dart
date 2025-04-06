// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarouselItemImpl _$$CarouselItemImplFromJson(Map<String, dynamic> json) =>
    _$CarouselItemImpl(
      image: OImage.fromJson(json['image'] as Map<String, dynamic>),
      eigaId: json['eigaId'] as String,
      name: json['name'] as String,
      originalName: json['originalName'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      notice: json['notice'] as String?,
      year: json['year'] as String?,
      description: json['description'] as String?,
      studio: json['studio'] as String?,
      duration: json['duration'] as String?,
      language: json['language'] as String?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      actors: (json['actors'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CarouselItemImplToJson(_$CarouselItemImpl instance) =>
    <String, dynamic>{
      'image': instance.image,
      'eigaId': instance.eigaId,
      'name': instance.name,
      'originalName': instance.originalName,
      'rate': instance.rate,
      'notice': instance.notice,
      'year': instance.year,
      'description': instance.description,
      'studio': instance.studio,
      'duration': instance.duration,
      'language': instance.language,
      'genres': instance.genres,
      'actors': instance.actors,
    };
