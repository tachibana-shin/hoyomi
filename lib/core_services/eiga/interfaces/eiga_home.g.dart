// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eiga_home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EigaHome _$EigaHomeFromJson(Map<String, dynamic> json) => _EigaHome(
  carousel: json['carousel'] == null
      ? null
      : EigaCarousel.fromJson(json['carousel'] as Map<String, dynamic>),
  categories: (json['categories'] as List<dynamic>)
      .map((e) => HomeEigaCategory.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$EigaHomeToJson(_EigaHome instance) => <String, dynamic>{
  'carousel': instance.carousel,
  'categories': instance.categories,
};
