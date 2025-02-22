import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/core_services/interfaces/follow_item.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';

mixin EigaFollowMixin on AuthMixin {
  Future<List<FollowItem<Eiga>>> getFollows({required int page});
}
