import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:hoyomi/core_services/book/interfaces/meta_book.dart';

import 'package:hoyomi/pages/details_comic/[sourceId]/[bookId].page.dart';
import 'package:hoyomi/pages/details_comic/[sourceId]/[bookId]/[chapterId].page.dart';
import 'package:hoyomi/pages/home_comic/home_comic_page.dart';
import 'package:hoyomi/pages/home_eiga/home_eiga_page.dart';
import 'package:hoyomi/pages/library/follow/follow_page.dart';
import 'package:hoyomi/pages/library/history/history_page.dart';
import 'package:hoyomi/pages/library/library_page.dart';
import 'package:hoyomi/pages/manager_page.dart';
import 'package:hoyomi/pages/search/[sourceId].page.dart';
import 'package:hoyomi/pages/search/index_page.dart';
import 'package:hoyomi/pages/section_comic/[sourceId]/[sectionId].page.dart';
import 'package:hoyomi/pages/webview_page.dart';

import 'package:hoyomi/widgets/navigation_app.dart';

import '../pages/details_comic/[sourceId]/[bookId]/similar/similar_page.dart';
import '../pages/details_eiga/[sourceId]/[eigaId].page.dart';

final List<String> routeIgnoreLayoutDefault = [
  '/details_comic',
  '/details_eiga',
  '/webview',
  '/search/',
  '/search?q=',
  '/section_comic'
];

final router = createRouter();

GoRouter createRouter() {
  return GoRouter(
    initialLocation: '/home_eiga',
    observers: [GoTransition.observer],
    routes: [
      createStatefulShellRoute(),
    ],
  );
}

StatefulShellRoute createStatefulShellRoute() {
  return StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      final fullPath = state.uri.toString();
      final disableToolbar = routeIgnoreLayoutDefault.any((route) => fullPath.startsWith(route));

      return ScaffoldWithNestedNavigation(
        navigationShell: navigationShell,
        disableToolbar: disableToolbar,
      );
    },
    branches: [
      createHomeBookBranch(),
      createHomeEigaBranch(),
      createSearchBranch(),
      createLibraryBranch(),
      createManagerBranch(),
      createDetailsComicBranch(),
      createDetailsEigaBranch(),
      createWebviewBranch(),
      createSectionComicBranch(),
    ],
  );
}

StatefulShellBranch createHomeBookBranch() {
  return StatefulShellBranch(routes: [
    GoRoute(
      path: '/home_book',
      pageBuilder: GoTransitions.material.call,
      builder: (context, state) => HomeBookPage(),
    )
  ]);
}

StatefulShellBranch createHomeEigaBranch() {
  return StatefulShellBranch(routes: [
    GoRoute(
      path: '/home_eiga',
      pageBuilder: GoTransitions.material.call,
      builder: (context, state) => HomeEigaPage(),
    )
  ]);
}

StatefulShellBranch createSearchBranch() {
  return StatefulShellBranch(routes: [
    GoRoute(
      path: '/search',
      pageBuilder: GoTransitions.material.call,
      builder: (context, state) => SearchPage(keyword: state.uri.queryParameters['q'] ?? ''),
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
      ],
    ),
  ]);
}

StatefulShellBranch createLibraryBranch() {
  return StatefulShellBranch(routes: [
    GoRoute(
      path: '/library',
      pageBuilder: GoTransitions.material.call,
      builder: (context, state) => LibraryPage(),
      routes: [
        GoRoute(
          path: 'history',
          pageBuilder: GoTransitions.material.call,
          builder: (context, state) => HistoryPage(),
        ),
        GoRoute(
          path: 'follow',
          pageBuilder: GoTransitions.material.call,
          builder: (context, state) => FollowPage(),
        )
      ],
    ),
  ]);
}

StatefulShellBranch createManagerBranch() {
  return StatefulShellBranch(routes: [
    GoRoute(
      path: '/manager',
      pageBuilder: GoTransitions.material.call,
      builder: (context, state) => ManagerPage(),
    ),
  ]);
}

StatefulShellBranch createDetailsComicBranch() {
  return StatefulShellBranch(routes: [
    GoRoute(
      path: "/details_comic",
      name: "details_comic",
      pageBuilder: GoTransitions.material.call,
      routes: [
        GoRoute(
          path: ":sourceId",
          pageBuilder: GoTransitions.material.call,
          routes: [
            GoRoute(
              path: ":bookId",
              pageBuilder: GoTransitions.material.call,
              builder: (context, state) => DetailsComic(
                sourceId: state.pathParameters['sourceId']!,
                bookId: state.pathParameters['bookId']!,
              ),
              routes: [
                GoRoute(
                  path: "view",
                  name: "details_comic_reader",
                  pageBuilder: GoTransitions.material.call,
                  builder: (context, state) {
                    final sourceId = state.pathParameters['sourceId'];
                    final bookId = state.pathParameters['bookId'];
                    final chapterId = state.uri.queryParameters['chap']!;

                    return DetailsComicReader(
                      key: Key(bookId!),
                      sourceId: sourceId!,
                      bookId: bookId,
                      chapterId: chapterId,
                      book: state.extra != null
                          ? (state.extra as Map)['book'] as MetaBook
                          : null,
                    );
                  },
                ),
                GoRoute(
                  path: "similar",
                  pageBuilder: GoTransitions.material.call,
                  builder: (context, state) => SimilarPage(
                    sourceId: state.pathParameters['sourceId']!,
                    bookId: state.pathParameters['bookId']!,
                    book: (state.extra is Map && (state.extra as Map).containsKey('book')) == true
                        ? (state.extra as Map)['book']
                        : null,
                  ),
                )
              ],
            )
          ],
        )
      ],
    ),
  ]);
}

StatefulShellBranch createDetailsEigaBranch() {
  return StatefulShellBranch(routes: [
    GoRoute(
      path: "/details_eiga",
      name: "details_eiga",
      pageBuilder: GoTransitions.material.call,
      routes: [
        GoRoute(
          path: ":sourceId",
          pageBuilder: GoTransitions.material.call,
          routes: [
            GoRoute(
              path: ":eigaId",
              pageBuilder: GoTransitions.material.call,
              builder: (context, state) => DetailsEigaPage(
                sourceId: state.pathParameters['sourceId']!,
                eigaId: state.pathParameters['eigaId']!,
                episodeId: state.uri.queryParameters['episodeId'],
              ),
            )
          ],
        )
      ],
    ),
  ]);
}

StatefulShellBranch createWebviewBranch() {
  return StatefulShellBranch(routes: [
    GoRoute(
      path: '/webview',
      pageBuilder: GoTransitions.material.call,
      routes: [
        GoRoute(
          path: ':serviceId',
          pageBuilder: GoTransitions.material.call,
          builder: (context, state) => WebviewPage(
            serviceId: state.pathParameters['serviceId']!,
          ),
        )
      ],
    ),
  ]);
}

StatefulShellBranch createSectionComicBranch() {
  return StatefulShellBranch(routes: [
    GoRoute(
      path: '/section_comic',
      pageBuilder: GoTransitions.material.call,
      routes: [
        GoRoute(
          path: ':serviceId',
          pageBuilder: GoTransitions.material.call,
          routes: [
            GoRoute(
              path: ":sectionId",
              builder: (context, state) => SectionComicPage(
                serviceId: state.pathParameters['serviceId']!,
                sectionId: state.pathParameters['sectionId']!,
              ),
            )
          ],
        )
      ],
    ),
  ]);
}

class ScaffoldWithNestedNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final bool disableToolbar;

  const ScaffoldWithNestedNavigation({
    super.key,
    required this.navigationShell,
    required this.disableToolbar,
  });

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final railMode = constraints.maxWidth > 600;
        return railMode ? _buildRailMode() : _buildBottomNavigationBar();
      },
    );
  }

  Widget _buildRailMode() {
    return Scaffold(
      body: Row(
        children: [
          if (!disableToolbar) ...[
            NavigationApp(
              selectedIndex: navigationShell.currentIndex,
              rail: true,
              onDestinationSelected: _goBranch,
            ),
            const VerticalDivider(thickness: 1, width: 1),
          ],
          Expanded(
            child: navigationShell,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: disableToolbar
          ? null
          : NavigationApp(
              selectedIndex: navigationShell.currentIndex,
              rail: false,
              onDestinationSelected: _goBranch,
            ),
    );
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