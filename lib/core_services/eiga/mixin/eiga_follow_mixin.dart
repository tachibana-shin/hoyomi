import 'package:hoyomi/core_services/eiga/export.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';

mixin EigaFollowMixin on AuthMixin {
  Future<Paginate<EigaFollow>> getFollows({required int page});

  Future<int> getFollowsCount(String eigaId, MetaEiga metaEiga) {
    throw UnimplementedError();
  }

  Future<bool> isFollow(String eigaId);
  Future<void> setFollow(EigaContextWithEpisodes context, bool value);
}
