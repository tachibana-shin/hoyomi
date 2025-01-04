import 'package:hoyomi/core_services/interfaces/basic_image.dart';

class BasicComment {
  final String id;
  final String bookId;
  final String? chapterId;
  final String userId;
  final String name;
  final BasicImage photoUrl;
  final String content;
  final DateTime timeAgo;

   int? countLike;
   int? countDislike;
  final int countReply;

  final bool canDelete;
  bool? like;

  BasicComment(
      {required this.id,
      required this.bookId,
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
