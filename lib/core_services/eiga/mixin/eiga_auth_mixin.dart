import 'package:hoyomi/core_services/mixin/auth_mixin.dart';

mixin EigaAuthMixin implements AuthMixin {
  @override
  final bool $noAuth = false;
  Future<bool> isFollowed({required String eigaId});
  Future<bool> setFollow({required String eigaId, required bool value});
  Future<int> getFollowCount({required String eigaId});
}
