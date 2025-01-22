import 'package:hoyomi/core_services/base_auth_service.dart';

abstract class EigaAuthService extends BaseAuthService {
  Future<bool> isLiked({required String eigaId});
  Future<bool> setLike({required String eigaId, required bool value});
}
