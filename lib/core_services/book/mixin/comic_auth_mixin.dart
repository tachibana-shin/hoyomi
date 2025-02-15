import 'package:hoyomi/core_services/mixin/auth_mixin.dart';
import 'package:hoyomi/core_services/book/interfaces/book_comments.dart';
import 'package:hoyomi/core_services/book/interfaces/book_comment.dart';

mixin ComicAuthMixin on AuthMixin {
  Future<bool> isLiked({required String bookId});
  Future<bool> setLike({required String bookId, required bool value});

// for comment system
  Future<BookComments> Function(
      {required String bookId,
      String? chapterId,
      BookComment? parent,
      int? page})? get getComments;

  Future<void> Function(
      {required String bookId,
      String? chapterId,
      BookComment? parent,
      required BookComment comment})? get deleteComment;

  Future<bool> Function(
      {required String bookId,
      String? chapterId,
      BookComment? parent,
      required BookComment comment,
      required bool value})? get setLikeComment;
}
