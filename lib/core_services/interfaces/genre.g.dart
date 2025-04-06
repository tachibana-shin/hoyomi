// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenreImpl _$$GenreImplFromJson(Map<String, dynamic> json) => _$GenreImpl(
      name: json['name'] as String,
      genreId: json['genreId'] as String,
      description: json['description'] as String?,
      image: json['image'] == null
          ? null
          : OImage.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GenreImplToJson(_$GenreImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'genreId': instance.genreId,
      'description': instance.description,
      'image': instance.image,
    };
