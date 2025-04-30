// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_carousel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ComicCarousel _$ComicCarouselFromJson(Map<String, dynamic> json) =>
    _ComicCarousel(
      items:
          (json['items'] as List<dynamic>)
              .map((e) => ComicCarouselItem.fromJson(e as Map<String, dynamic>))
              .toList(),
      aspectRatio: (json['aspectRatio'] as num).toDouble(),
      maxHeightBuilder: (json['maxHeightBuilder'] as num).toDouble(),
    );

Map<String, dynamic> _$ComicCarouselToJson(_ComicCarousel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'aspectRatio': instance.aspectRatio,
      'maxHeightBuilder': instance.maxHeightBuilder,
    };
