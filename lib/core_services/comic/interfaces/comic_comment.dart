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

  factory ComicComment.createFakeData() {
    return ComicComment(
      id: "comment_1",
      comicId: "comic_123",
      chapterId: "ch1",
      userId: "user_456",
      name: "Fake User",
      photoUrl: OImage.createFakeData(),
      content: "This is a fake comment for testing purposes.",
      timeAgo: DateTime.now().subtract(Duration(hours: 5)),
      countLike: 12,
      countDislike: 2,
      countReply: 3,
      canDelete: false,
      like: true,
    );
  }

  ComicComment({
    required this.id,
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
    this.like,
  });
}
