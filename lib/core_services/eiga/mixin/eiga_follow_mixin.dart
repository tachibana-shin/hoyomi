import 'package:hoyomi/core_services/eiga/export.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';

mixin EigaFollowMixin on AuthMixin {
  Future<EigaCategory> getFollows({required int page});

  Future<int> getFollowCount(String eigaId) {
    throw UnimplementedError();
  }

  Future<bool> isFollow(String eigaId);
  Future<void> setFollow(EigaContextWithEpisodes context, bool value);
}
