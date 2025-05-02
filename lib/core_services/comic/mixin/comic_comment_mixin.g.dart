// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_comment_mixin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ComicCommentContext _$ComicCommentContextFromJson(Map<String, dynamic> json) =>
    _ComicCommentContext(
      comicId: json['comicId'] as String,
      metaComic: MetaComic.fromJson(json['metaComic'] as Map<String, dynamic>),
      chapterId: json['chapterId'] as String?,
      chapter:
          json['chapter'] == null
              ? null
              : ComicChapter.fromJson(json['chapter'] as Map<String, dynamic>),
      parent:
          json['parent'] == null
              ? null
              : ComicComment.fromJson(json['parent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicCommentContextToJson(
  _ComicCommentContext instance,
) => <String, dynamic>{
  'comicId': instance.comicId,
  'metaComic': instance.metaComic,
  'chapterId': instance.chapterId,
  'chapter': instance.chapter,
  'parent': instance.parent,
};
