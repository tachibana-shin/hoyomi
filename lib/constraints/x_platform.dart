import 'dart:io';

import 'package:flutter/foundation.dart';

class XPlatform {
  static final isAndroid = !kIsWeb && Platform.isAndroid;
  static final isIOS = !kIsWeb && Platform.isIOS;
  static final isWindows = !kIsWeb && Platform.isWindows;
  static final isLinux = !kIsWeb && Platform.isLinux;
  static final isMacOS = !kIsWeb && Platform.isMacOS;
  static final isWeb = kIsWeb;
}
