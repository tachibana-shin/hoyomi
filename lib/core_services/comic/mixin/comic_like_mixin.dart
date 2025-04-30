import 'package:hoyomi/core_services/comic/mixin/comic_auth_mixin.dart';

mixin ComicLikeMixin on ComicAuthMixin {
  Future<bool> isLiked({required String comicId});
  Future<bool> setLike({required String comicId, required bool value});
}
