// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eiga_home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EigaHomeImpl _$$EigaHomeImplFromJson(Map<String, dynamic> json) =>
    _$EigaHomeImpl(
      carousel: json['carousel'] == null
          ? null
          : Carousel.fromJson(json['carousel'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => HomeEigaCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EigaHomeImplToJson(_$EigaHomeImpl instance) =>
    <String, dynamic>{
      'carousel': instance.carousel,
      'categories': instance.categories,
    };
