import 'package:honyomi/core_services/interfaces/basic_image.dart';

class BasicComment {
  final String id;
  final String bookId;
  final String? chapterId;
  final String userId;
  final String name;
  final BasicImage photoUrl;
  final String content;
  final DateTime timeAgo;

  final int? like;
  final int? dislike;
  final int countReply;

  final bool canDelete;

  BasicComment(
      {required this.id,
      required this.bookId,
      this.chapterId,
      required this.userId,
      required this.name,
      required this.photoUrl,
      required this.content,
      required this.timeAgo,
      this.like,
      this.dislike,
      required this.countReply,
      this.canDelete = false});
}
