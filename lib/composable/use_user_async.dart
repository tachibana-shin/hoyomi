import 'package:hoyomi/core_services/base_auth_service.dart';

import 'use_user.dart';

Future<UserData> useUserAsync(BaseAuthService service) async {
  final out = useUser(service, immediate: false);

  await out.refresh();

  return out;
}
