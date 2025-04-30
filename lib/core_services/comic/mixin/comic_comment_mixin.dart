import '../main.dart';

mixin ComicCommentMixin on ComicAuthMixin {
  // for comment system
  Future<ComicComments> getComments({
    required String comicId,
    String? chapterId,
    ComicComment? parent,
    int? page,
  });

  Future<void> deleteComment({
    required String comicId,
    String? chapterId,
    ComicComment? parent,
    required ComicComment comment,
  });

  Future<bool> setLikeComment({
    required String comicId,
    String? chapterId,
    ComicComment? parent,
    required ComicComment comment,
    required bool value,
  }) {
    throw UnimplementedError();
  }
}
