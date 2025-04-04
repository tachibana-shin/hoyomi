export 'video_polyfill_stub.dart'
    if (XPlatform.isWindows) 'video_polyfill_win_linux.dart'
    if (XPlatform.isLinux) 'video_polyfill_win_linux.dart';
