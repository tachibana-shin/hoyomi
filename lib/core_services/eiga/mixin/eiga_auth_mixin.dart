import 'package:hoyomi/core_services/mixin/base_auth_mixin.dart';

mixin EigaAuthMixin on BaseAuthMixin {
  Future<bool> isFollowed({required String eigaId});
  Future<bool> setFollow({required String eigaId, required bool value});
  Future<int> getFollowCount({required String eigaId});
}
