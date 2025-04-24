// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CarouselItem _$CarouselItemFromJson(Map<String, dynamic> json) =>
    _CarouselItem(
      subText: json['subText'] as String?,
      image: OImage.fromJson(json['image'] as Map<String, dynamic>),
      eigaId: json['eigaId'] as String,
      name: json['name'] as String,
      originalName: json['originalName'] as String?,
      type: json['type'] as String?,
      episodeDuration: json['episodeDuration'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      quality: json['quality'] as String?,
      countSub: (json['countSub'] as num?)?.toInt(),
      countDub: (json['countDub'] as num?)?.toInt(),
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

Map<String, dynamic> _$CarouselItemToJson(_CarouselItem instance) =>
    <String, dynamic>{
      'subText': instance.subText,
      'image': instance.image,
      'eigaId': instance.eigaId,
      'name': instance.name,
      'originalName': instance.originalName,
      'type': instance.type,
      'episodeDuration': instance.episodeDuration,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'quality': instance.quality,
      'countSub': instance.countSub,
      'countDub': instance.countDub,
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
