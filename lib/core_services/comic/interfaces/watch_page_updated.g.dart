// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_page_updated.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WatchPageUpdatedImpl _$$WatchPageUpdatedImplFromJson(
        Map<String, dynamic> json) =>
    _$WatchPageUpdatedImpl(
      currentPage: (json['currentPage'] as num).toInt(),
      totalPage: (json['totalPage'] as num).toInt(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$WatchPageUpdatedImplToJson(
        _$WatchPageUpdatedImpl instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'totalPage': instance.totalPage,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
