import 'package:hoyomi/core_services/mixin/base_auth_mixin.dart';

import 'use_user.dart';

Future<UserData> useUserAsync(BaseAuthMixin service) async {
  final out = useUser(service, immediate: false);

  await out.refresh();

  return out;
}
