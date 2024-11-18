import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';

import 'pages/details_comic/[slug].page.dart';
import 'pages/details_comic/[slug]/[chap].page.dart';
import 'pages/home_page.dart';
import 'pages/search_page.dart';
import 'pages/profile_page.dart';

import 'widgets/navigation_app.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Set default transition values for the entire app.
    GoTransition.defaultCurve = Curves.easeInOut;
    GoTransition.defaultDuration = const Duration(milliseconds: 600);

    final GoRouter router = GoRouter(
      initialLocation: '/home',
      observers: [GoTransition.observer],
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            if (state.fullPath?.startsWith("/details_comic/") ?? false) {
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
                path: '/profile',
                pageBuilder: GoTransitions.material.call,
                builder: (context, state) => ProfilePage(),
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
                                        pageBuilder: GoTransitions
                                            .material.call,
                                        builder: (context, state) =>
                                            DetailsComicReader(
                                                sourceId:
                                                    state.pathParameters[
                                                        'sourceId']!,
                                                slug: state
                                                    .pathParameters['slug']!,
                                                chap: state
                                                    .pathParameters['chap']!))
                                  ])
                            ])
                      ]),
                ]),
          ],
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Flutter App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
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
