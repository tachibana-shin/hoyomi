import 'package:hoyomi/core_services/mixin/auth_mixin.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_comments.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_comment.dart';

mixin ComicAuthMixin on AuthMixin {
  Future<bool> isLiked({required String comicId});
  Future<bool> setLike({required String comicId, required bool value});

  // for comment system
  Future<ComicComments> Function({
    required String comicId,
    String? chapterId,
    ComicComment? parent,
    int? page,
  })? get getComments;

  Future<void> Function({
    required String comicId,
    String? chapterId,
    ComicComment? parent,
    required ComicComment comment,
  })? get deleteComment;

  Future<bool> Function({
    required String comicId,
    String? chapterId,
    ComicComment? parent,
    required ComicComment comment,
    required bool value,
  })? get setLikeComment;
}
