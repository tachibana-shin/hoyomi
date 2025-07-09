import 'dart:io';

import 'package:app_links/app_links.dart';
import 'package:hoyomi/core_services/js_core/install_js_service.dart';
import 'package:win32_registry/win32_registry.dart';

Future<void> initializeAppLinks() async {
  if (Platform.isWindows) {
    final appPath = Platform.resolvedExecutable;

    final protocolRegKey = 'Software\\Classes\\hoyomi';
    final protocolRegValue = RegistryValue.string('URL Protocol', '');
    final protocolCmdRegKey = 'shell\\open\\command';
    final protocolCmdRegValue = RegistryValue.string('', '"$appPath" "%1"');

    final regKey = Registry.currentUser.createKey(protocolRegKey);
    regKey.createValue(protocolRegValue);
    regKey.createKey(protocolCmdRegKey).createValue(protocolCmdRegValue);
  }

  AppLinks().uriLinkStream.listen((uri) {
    if (uri.host == 'add-plugin') {
      final url = uri.queryParameters['url'];
      if (url?.isNotEmpty == true) {
        showInstallJsServiceModal(null, url);
      }
    }
  });
}
