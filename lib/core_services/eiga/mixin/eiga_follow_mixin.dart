import 'package:hoyomi/core_services/eiga/export.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';

mixin EigaFollowMixin on AuthMixin {
  Future<EigaCategory> getFollows({required int page});

  Future<bool> isFollow({required String eigaId});
  Future<void> setFollow({
    required String eigaId,
    required MetaEiga metaEiga,
    required bool value,
  });
}
