import 'package:hoyomi/core_services/comic/main.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';

mixin ComicFollowMixin on AuthMixin {
  Future<Paginate<ComicFollow>> getFollows({required int page});

  Future<bool> isFollow({required String comicId});
  Future<void> setFollow({
    required String comicId,
    required MetaComic metaComic,
    required bool value,
  });
}
