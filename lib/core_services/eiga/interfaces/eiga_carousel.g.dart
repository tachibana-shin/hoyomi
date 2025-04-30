// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eiga_carousel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EigaCarousel _$EigaCarouselFromJson(Map<String, dynamic> json) =>
    _EigaCarousel(
      items:
          (json['items'] as List<dynamic>)
              .map((e) => EigaCarouselItem.fromJson(e as Map<String, dynamic>))
              .toList(),
      aspectRatio: (json['aspectRatio'] as num).toDouble(),
      maxHeightBuilder: (json['maxHeightBuilder'] as num).toDouble(),
    );

Map<String, dynamic> _$EigaCarouselToJson(_EigaCarousel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'aspectRatio': instance.aspectRatio,
      'maxHeightBuilder': instance.maxHeightBuilder,
    };
