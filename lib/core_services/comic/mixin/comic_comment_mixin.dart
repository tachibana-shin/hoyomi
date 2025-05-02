import 'package:freezed_annotation/freezed_annotation.dart';

import '../../mixin/export.dart';
import '../main.dart';

part 'comic_comment_mixin.freezed.dart';
part 'comic_comment_mixin.g.dart';

@freezed
sealed class ComicCommentContext with _$ComicCommentContext {
  const factory ComicCommentContext({
    required String comicId,
    required MetaComic metaComic,
    String? chapterId,
    ComicChapter? chapter,
    ComicComment? parent,
  }) = _ComicCommentContext;

  factory ComicCommentContext.fromJson(Map<String, dynamic> json) =>
      _$ComicCommentContextFromJson(json);
}

mixin ComicCommentMixin on AuthMixin {
  // for comment system
  Future<ComicComments> getComments(ComicCommentContext context, {int? page});

  Future<void> deleteComment(
    ComicCommentContext context, {
    required ComicComment comment,
  });

  Future<bool> setLikeComment(
    ComicCommentContext context, {
    required ComicComment comment,
    required bool value,
  }) {
    throw UnimplementedError();
  }
}
