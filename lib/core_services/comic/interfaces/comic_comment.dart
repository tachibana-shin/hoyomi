import 'package:hoyomi/core_services/interfaces/o_image.dart';

class ComicComment {
  final String id;
  final String comicId;
  final String? chapterId;
  final String userId;
  final String name;
  final OImage photoUrl;
  final String content;
  final DateTime timeAgo;

  int? countLike;
  int? countDislike;
  final int countReply;

  final bool canDelete;
  bool? like;

  ComicComment(
      {required this.id,
      required this.comicId,
      this.chapterId,
      required this.userId,
      required this.name,
      required this.photoUrl,
      required this.content,
      required this.timeAgo,
      this.countLike,
      this.countDislike,
      required this.countReply,
      this.canDelete = false,
      this.like});
}
