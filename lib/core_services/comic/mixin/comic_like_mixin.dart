import '../../mixin/auth_mixin.dart';

mixin ComicLikeMixin on AuthMixin {
  Future<bool> isLiked({required String comicId});
  Future<bool> setLike({required String comicId, required bool value});
}
