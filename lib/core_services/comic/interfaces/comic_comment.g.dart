// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ComicComment _$ComicCommentFromJson(Map<String, dynamic> json) =>
    _ComicComment(
      id: json['id'] as String,
      chapterId: json['chapterId'] as String?,
      userId: json['userId'] as String,
      name: json['name'] as String,
      photoUrl:
          json['photoUrl'] == null
              ? null
              : OImage.fromJson(json['photoUrl'] as Map<String, dynamic>),
      content: json['content'] as String,
      timeAgo: DateTime.parse(json['timeAgo'] as String),
      countLike: (json['countLike'] as num?)?.toInt(),
      countDislike: (json['countDislike'] as num?)?.toInt(),
      countReply: (json['countReply'] as num).toInt(),
      canDelete: json['canDelete'] as bool? ?? false,
      like: json['like'] as bool?,
      replies:
          (json['replies'] as List<dynamic>?)
              ?.map((e) => ComicComment.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ComicCommentToJson(_ComicComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chapterId': instance.chapterId,
      'userId': instance.userId,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'content': instance.content,
      'timeAgo': instance.timeAgo.toIso8601String(),
      'countLike': instance.countLike,
      'countDislike': instance.countDislike,
      'countReply': instance.countReply,
      'canDelete': instance.canDelete,
      'like': instance.like,
      'replies': instance.replies,
    };
