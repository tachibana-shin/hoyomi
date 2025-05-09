

import 'package:hoyomi/core_services/comic/main.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';

mixin ComicFollowMixin on AuthMixin {
  Future<Paginate<FollowItem<Comic>>> getFollows({required int page});
}
