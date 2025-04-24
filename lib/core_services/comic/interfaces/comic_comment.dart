import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';

part 'comic_comment.freezed.dart';
part 'comic_comment.g.dart';

@freezed
sealed class ComicComment with _$ComicComment {
  const factory ComicComment({
    required String id,
    required String comicId,
    String? chapterId,
    required String userId,
    required String name,
    required OImage photoUrl,
    required String content,
    required DateTime timeAgo,
    int? countLike,
    int? countDislike,
    required int countReply,
    @Default(false) bool canDelete,
    bool? like,
  }) = _ComicComment;

  factory ComicComment.fromJson(Map<String, dynamic> json) =>
      _$ComicCommentFromJson(json);

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
}
