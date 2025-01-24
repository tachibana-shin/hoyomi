import 'package:hoyomi/core_services/base_auth_service.dart';

abstract class EigaAuthService extends BaseAuthService {
  Future<bool> isFollowed({required String eigaId});
  Future<bool> setFollow({required String eigaId, required bool value});
  Future<int> getFollowCount({required String eigaId});
}
