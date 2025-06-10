// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_page_updated.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WatchPageUpdated _$WatchPageUpdatedFromJson(Map<String, dynamic> json) =>
    _WatchPageUpdated(
      currentPage: (json['currentPage'] as num).toInt(),
      totalPage: (json['totalPage'] as num).toInt(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$WatchPageUpdatedToJson(_WatchPageUpdated instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'totalPage': instance.totalPage,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
