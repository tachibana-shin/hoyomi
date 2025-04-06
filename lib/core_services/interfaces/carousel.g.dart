// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarouselImpl _$$CarouselImplFromJson(Map<String, dynamic> json) =>
    _$CarouselImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => CarouselItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      aspectRatio: (json['aspectRatio'] as num).toDouble(),
      maxHeightBuilder: (json['maxHeightBuilder'] as num).toDouble(),
    );

Map<String, dynamic> _$$CarouselImplToJson(_$CarouselImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'aspectRatio': instance.aspectRatio,
      'maxHeightBuilder': instance.maxHeightBuilder,
    };
