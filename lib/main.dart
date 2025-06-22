import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
// import 'package:hoyomi/background_services/comic_changes.dart';
import 'package:hoyomi/constraints/x_platform.dart';
import 'package:hoyomi/plugins/export.dart';
import 'package:hoyomi/router/index.dart';

import 'stores.dart';

// import 'package:go_transitions/go_transitions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeVideoPolyfill();

  await androidSdkIntInit();
  await initializeApplicationDocumentDirectory();
  await initializeCert();
  await initializeDioClient();
  await initializeFirebase();
  await initializeAnalytics();
  await initializeServices();
  await initializeFullscreen();
  await initializeStore();
  // initializeService();
  initializeRouter();

  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  runApp(MainApp(theme: savedThemeMode));

  // register background service
  // if (XPlatform.isAndroid || XPlatform.isIOS) {
  //   ComicChanges().initializeBackgroundService();
  // ComicChanges().checkUpdateAll();
  // }
}

class MainApp extends StatelessWidget {
  final AdaptiveThemeMode? theme;

  const MainApp({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    /// Set default transition values for the entire app.
    // GoTransition.defaultCurve = Curves.easeInOut;
    // GoTransition.defaultDuration = const Duration(milliseconds: 600);
    if ((!XPlatform.isAndroid && !XPlatform.isIOS) ||
        androidSdkInt != null && androidSdkInt! < 29) {
      GoTransition.defaultCurve = Curves.easeInOut;
      GoTransition.defaultDuration = const Duration(milliseconds: 800);
    }

    if (XPlatform.isWeb) {
      usePathUrlStrategy();
      GoRouter.optionURLReflectsImperativeAPIs = true;
    }

    return AdaptiveTheme(
      light: ThemeData.light(useMaterial3: true),
      dark: ThemeData.dark(useMaterial3: true),
      initial: theme ?? AdaptiveThemeMode.system,
      builder:
          (theme, darkTheme) => MaterialApp.router(
            restorationScopeId: 'app',
            title: 'Hoyomi',
            scaffoldMessengerKey: snackbarKey,
            theme: theme,
            darkTheme: darkTheme,
            // themeMode: ThemeMode.system,
            scrollBehavior: AppScrollBehavior(),
            routerConfig: router,
          ),
    );
  }
}
