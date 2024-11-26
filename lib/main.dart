import 'globals.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:honyomi/pages/webview_page.dart';

import 'pages/details_comic/[slug].page.dart';
import 'pages/details_comic/[slug]/[chap].page.dart';
import 'pages/home_page.dart';
import 'pages/search_page.dart';
import 'pages/manager_page.dart';

import 'widgets/navigation_app.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static List<String> routeIgnoreLayoutDefault = ['/details_comic', '/webview'];

  @override
  Widget build(BuildContext context) {
    /// Set default transition values for the entire app.
    GoTransition.defaultCurve = Curves.easeInOut;
    GoTransition.defaultDuration = const Duration(milliseconds: 600);

    final GoRouter router = GoRouter(
      initialLocation: '/details_comic/truyengg/toi-o-day-de-tra-thu-44867',
      observers: [GoTransition.observer],
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            if (state.fullPath != null &&
                MainApp.routeIgnoreLayoutDefault.firstWhere(
                        (route) => state.fullPath!.startsWith(route),
                        orElse: () => '') !=
                    '') {
              return Scaffold(body: navigationShell);
            }

            return ScaffoldWithNestedNavigation(
                navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/home',
                pageBuilder: GoTransitions.material.call,
                builder: (context, state) => HomePage(),
              )
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/search',
                pageBuilder: GoTransitions.material.call,
                builder: (context, state) => SearchPage(),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/manager',
                pageBuilder: GoTransitions.material.call,
                builder: (context, state) => ManagerPage(),
              ),
            ]),
            StatefulShellBranch(
                // navigatorKey: _shellNavigatorAKey,
                routes: [
                  // features
                  GoRoute(
                      path: "/details_comic",
                      pageBuilder: GoTransitions.material.call,
                      routes: [
                        GoRoute(
                            path: ":sourceId",
                            pageBuilder: GoTransitions.material.call,
                            routes: [
                              GoRoute(
                                  path: ":slug",
                                  pageBuilder: GoTransitions.material.call,
                                  builder: (context, state) => DetailsComic(
                                      sourceId:
                                          state.pathParameters['sourceId']!,
                                      slug: state.pathParameters['slug']!),
                                  routes: [
                                    GoRoute(
                                        path: ":chap",
                                        name: "details_comic_reader",
                                        pageBuilder:
                                            GoTransitions.material.call,
                                        builder: (context, state) {
                                          final sourceId =
                                              state.pathParameters['sourceId'];
                                          final slug =
                                              state.pathParameters['slug'];
                                          final chap =
                                              state.pathParameters['chap'];

                                          if (chap != null) {
                                            return DetailsComicReader(
                                                sourceId: sourceId!,
                                                slug: slug!,
                                                chap: chap);
                                          }

                                          return Stack(children: []);
                                        })
                                  ])
                            ])
                      ]),
                ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  path: '/webview',
                  pageBuilder: GoTransitions.material.call,
                  routes: [
                    GoRoute(
                      path: ':serviceId',
                      pageBuilder: GoTransitions.material.call,
                      builder: (context, state) => WebviewPage(
                          serviceId: state.pathParameters['serviceId']!),
                    )
                  ]),
            ]),
          ],
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Flutter App',
      scaffoldMessengerKey: snackbarKey,
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      scrollBehavior: AppScrollBehavior(),
      routerConfig: router,
    );
  }
}

// Fork stateful navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    super.key,
    required this.navigationShell,
  });
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final railMode = constraints.maxWidth > 600;
      if (railMode) {
        return Scaffold(
          body: Row(
            children: [
              NavigationApp(
                selectedIndex: navigationShell.currentIndex,
                rail: true,
                onDestinationSelected: _goBranch,
              ),
              const VerticalDivider(thickness: 1, width: 1),
              // This is the main content.
              Expanded(
                child: navigationShell,
              ),
            ],
          ),
        );
      }

      return Scaffold(
          body: navigationShell,
          bottomNavigationBar: NavigationApp(
            selectedIndex: navigationShell.currentIndex,
            rail: false,
            onDestinationSelected: _goBranch,
          ));
    });
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
