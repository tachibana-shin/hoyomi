// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
  createdAt: json['created_at'] as String,
  comicTextId: json['comic_text_id'] as String,
  name: json['name'] as String,
  originalName: json['original_name'] as String,
  poster: json['poster'] as String,
  sourceId: json['source_id'] as String,
  watchCur: json['watch_cur'] as num,
  watchDur: json['watch_dur'] as num,
  watchId: json['watch_id'] as String,
  watchName: json['watch_name'] as String,
  watchUpdatedAt: json['watch_updated_at'] as String,
  seasonName: json['season_name'] as String? ?? '',
);

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
  'created_at': instance.createdAt,
  'comic_text_id': instance.comicTextId,
  'name': instance.name,
  'original_name': instance.originalName,
  'poster': instance.poster,
  'source_id': instance.sourceId,
  'watch_cur': instance.watchCur,
  'watch_dur': instance.watchDur,
  'watch_id': instance.watchId,
  'watch_name': instance.watchName,
  'watch_updated_at': instance.watchUpdatedAt,
  'season_name': instance.seasonName,
};
