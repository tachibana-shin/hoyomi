import 'package:hoyomi/core_services/mixin/auth_mixin.dart';

mixin ComicAuthMixin implements AuthMixin {
  @override
  final bool $noAuth = false;
}
