import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';

import 'package:honyomi/pages/details_comic/[slug].page.dart';
import 'package:honyomi/pages/details_comic/[slug]/[chap].page.dart';
import 'package:honyomi/pages/home_page.dart';
import 'package:honyomi/pages/manager_page.dart';
import 'package:honyomi/pages/search/[sourceId].page.dart';
import 'package:honyomi/pages/search/index_page.dart';
import 'package:honyomi/pages/webview_page.dart';
import 'package:honyomi/pages/section/[sourceId]/[slug].page.dart';

import 'package:honyomi/widgets/navigation_app.dart';

final List<String> routeIgnoreLayoutDefault = [
  '/details_comic',
  '/webview',
  '/search/',
  '/search?q=',
  '/section'
];

final GoRouter router = GoRouter(
  initialLocation: '/home',
  observers: [GoTransition.observer],
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        final fullPath = state.uri.toString();

        final disableToolbar = routeIgnoreLayoutDefault.firstWhere(
                (route) => fullPath.startsWith(route),
                orElse: () => '') !=
            '';

        return ScaffoldWithNestedNavigation(
          navigationShell: navigationShell,
          disableToolbar: disableToolbar,
        );
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
              builder: (context, state) =>
                  SearchPage(keyword: state.uri.queryParameters['q'] ?? ''),
              routes: [
                GoRoute(
                  path: ':serviceId',
                  pageBuilder: GoTransitions.material.call,
                  builder: (context, state) {
                    if (state.uri.queryParameters['q'] == null) {
                      context.replace("/search");
                      return Stack(children: []);
                    }

                    return SearchSingleSource(
                      serviceId: state.pathParameters['serviceId']!,
                      keyword: state.uri.queryParameters['q']!,
                    );
                  },
                )
              ]),
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
                                  sourceId: state.pathParameters['sourceId']!,
                                  slug: state.pathParameters['slug']!),
                              routes: [
                                GoRoute(
                                    path: "view",
                                    name: "details_comic_reader",
                                    pageBuilder: GoTransitions.material.call,
                                    builder: (context, state) {
                                      final sourceId =
                                          state.pathParameters['sourceId'];
                                      final slug = state.pathParameters['slug'];
                                      final chap =
                                          state.uri.queryParameters['chap']!;

                                      return DetailsComicReader(
                                          sourceId: sourceId!,
                                          slug: slug!,
                                          chap: chap);
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
        StatefulShellBranch(routes: [
          GoRoute(
              path: '/section',
              pageBuilder: GoTransitions.material.call,
              routes: [
                GoRoute(
                    path: ':serviceId',
                    pageBuilder: GoTransitions.material.call,
                    routes: [
                      GoRoute(
                          path: ":slug",
                          builder: (context, state) => SectionPage(
                                serviceId: state.pathParameters['serviceId']!,
                                slug: state.pathParameters['slug']!,
                              ))
                    ])
              ]),
        ]),
      ],
    ),
  ],
);

// Fork stateful navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
class ScaffoldWithNestedNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final bool disableToolbar;

  const ScaffoldWithNestedNavigation(
      {super.key, required this.navigationShell, required this.disableToolbar});

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
              ...disableToolbar
                  ? [
                      NavigationApp(
                        selectedIndex: navigationShell.currentIndex,
                        rail: true,
                        onDestinationSelected: _goBranch,
                      ),
                      const VerticalDivider(thickness: 1, width: 1),
                    ]
                  : [],
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
          bottomNavigationBar: disableToolbar
              ? null
              : NavigationApp(
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
