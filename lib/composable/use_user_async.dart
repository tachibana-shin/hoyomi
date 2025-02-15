import 'package:hoyomi/core_services/mixin/auth_mixin.dart';

import 'use_user.dart';

Future<UserData> useUserAsync(AuthMixin service) async {
  final out = useUser(service, immediate: false);

  await out.refresh();

  return out;
}
