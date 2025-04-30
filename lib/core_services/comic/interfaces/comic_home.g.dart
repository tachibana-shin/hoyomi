// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ComicHome _$ComicHomeFromJson(Map<String, dynamic> json) => _ComicHome(
  carousel:
      json['carousel'] == null
          ? null
          : ComicCarousel.fromJson(json['carousel'] as Map<String, dynamic>),
  categories:
      (json['categories'] as List<dynamic>)
          .map((e) => HomeComicCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ComicHomeToJson(_ComicHome instance) =>
    <String, dynamic>{
      'carousel': instance.carousel,
      'categories': instance.categories,
    };
