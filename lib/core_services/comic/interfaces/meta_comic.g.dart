// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_comic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetaComic _$MetaComicFromJson(Map<String, dynamic> json) => _MetaComic(
  name: json['name'] as String,
  originalName: json['originalName'] as String?,
  image: OImage.fromJson(json['image'] as Map<String, dynamic>),
  author: json['author'] as String?,
  translator: json['translator'] as String?,
  status: $enumDecode(_$StatusEnumEnumMap, json['status']),
  views: (json['views'] as num?)?.toInt(),
  likes: (json['likes'] as num?)?.toInt(),
  rate: json['rate'] == null
      ? null
      : RateValue.fromJson(json['rate'] as Map<String, dynamic>),
  genres: (json['genres'] as List<dynamic>)
      .map((e) => Genre.fromJson(e as Map<String, dynamic>))
      .toList(),
  description: json['description'] as String,
  chapters: (json['chapters'] as List<dynamic>)
      .map((e) => ComicChapter.fromJson(e as Map<String, dynamic>))
      .toList(),
  lastModified: DateTime.parse(json['lastModified'] as String),
  fake: json['fake'] as bool? ?? false,
  offlineMode: json['offlineMode'] as bool? ?? false,
  extra: json['extra'] as String?,
);

Map<String, dynamic> _$MetaComicToJson(_MetaComic instance) =>
    <String, dynamic>{
      'name': instance.name,
      'originalName': instance.originalName,
      'image': instance.image,
      'author': instance.author,
      'translator': instance.translator,
      'status': _$StatusEnumEnumMap[instance.status]!,
      'views': instance.views,
      'likes': instance.likes,
      'rate': instance.rate,
      'genres': instance.genres,
      'description': instance.description,
      'chapters': instance.chapters,
      'lastModified': instance.lastModified.toIso8601String(),
      'fake': instance.fake,
      'offlineMode': instance.offlineMode,
      'extra': instance.extra,
    };

const _$StatusEnumEnumMap = {
  StatusEnum.ongoing: 'ongoing',
  StatusEnum.completed: 'completed',
  StatusEnum.canceled: 'canceled',
  StatusEnum.unknown: 'unknown',
  StatusEnum.onHiatus: 'on_hiatus',
  StatusEnum.publishingFinished: 'publishing_finished',
};
