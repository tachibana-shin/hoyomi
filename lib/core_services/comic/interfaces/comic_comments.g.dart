// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicComments _$ComicCommentsFromJson(Map<String, dynamic> json) =>
    ComicComments(
      items:
          (json['items'] as List<dynamic>)
              .map((e) => ComicComment.fromJson(e as Map<String, dynamic>))
              .toList(),
      page: (json['page'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$ComicCommentsToJson(ComicComments instance) =>
    <String, dynamic>{
      'items': instance.items,
      'page': instance.page,
      'totalItems': instance.totalItems,
      'totalPages': instance.totalPages,
    };
