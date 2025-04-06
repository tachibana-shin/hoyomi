// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComicImpl _$$ComicImplFromJson(Map<String, dynamic> json) => _$ComicImpl(
      name: json['name'] as String,
      comicId: json['comicId'] as String,
      originalName: json['originalName'] as String?,
      image: OImage.fromJson(json['image'] as Map<String, dynamic>),
      lastChap: json['lastChap'] == null
          ? null
          : ComicChapter.fromJson(json['lastChap'] as Map<String, dynamic>),
      timeAgo: json['timeAgo'] == null
          ? null
          : DateTime.parse(json['timeAgo'] as String),
      notice: json['notice'] as String?,
      pending: json['pending'] as bool? ?? false,
      preRelease: json['preRelease'] == null
          ? null
          : DateTime.parse(json['preRelease'] as String),
      rate: (json['rate'] as num?)?.toDouble(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$ComicImplToJson(_$ComicImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'comicId': instance.comicId,
      'originalName': instance.originalName,
      'image': instance.image,
      'lastChap': instance.lastChap,
      'timeAgo': instance.timeAgo?.toIso8601String(),
      'notice': instance.notice,
      'pending': instance.pending,
      'preRelease': instance.preRelease?.toIso8601String(),
      'rate': instance.rate,
      'description': instance.description,
    };
