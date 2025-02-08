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
import 'package:hoyomi/pages/search/comic/%5BsourceId%5D.page.dart';
import 'package:hoyomi/pages/search/eiga/%5BsourceId%5D.page.dart';
import 'package:hoyomi/pages/search/index_page.dart';
import 'package:hoyomi/pages/section_comic/[sourceId]/[sectionId].page.dart';
import 'package:hoyomi/pages/section_eiga/[sourceId]/[sectionId].page.dart';
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
  '/section_comic',
  '/section_eiga'
];

/// 日本語のコメント: ルートナビゲーターのためのグローバルキー。
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home_eiga',
  observers: [GoTransition.observer],
  routes: [
    // --- Shell route cho bottom navigation (5 items) ---
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // Decide immediately whether to show the toolbar.
        final showToolbar = shouldShowToolbar(state.uri.toString());
        return PersistentScaffold(
          navigationShell: navigationShell,
          showToolbar: showToolbar,
        );
      },
      branches: [
        // Bottom Navigation Item: Home Book
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/home_book',
            pageBuilder: GoTransitions.zoom.call,
            builder: (context, state) => HomeBookPage(),
          )
        ]),
        // Bottom Navigation Item: Home Eiga
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/home_eiga',
            pageBuilder: GoTransitions.zoom.call,
            builder: (context, state) => HomeEigaPage(),
          )
        ]),
        // Bottom Navigation Item: Search
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/search',
            pageBuilder: GoTransitions.zoom.call,
            builder: (context, state) => SearchPage(
              keyword: state.uri.queryParameters['q'] ?? '',
            ),
            routes: [
              GoRoute(
                path: 'comic/:serviceId',
                pageBuilder: GoTransitions.zoom.call,
                builder: (context, state) {
                  if (state.uri.queryParameters['q'] == null) {
                    context.replace("/search");
                    return const SizedBox();
                  }
                  return SearchComicPage(
                    serviceId: state.pathParameters['serviceId']!,
                    keyword: state.uri.queryParameters['q']!,
                  );
                },
              ),
              GoRoute(
                path: 'eiga/:serviceId',
                pageBuilder: GoTransitions.zoom.call,
                builder: (context, state) {
                  if (state.uri.queryParameters['q'] == null) {
                    context.replace("/search");
                    return const SizedBox();
                  }
                  return SearchEigaPage(
                    serviceId: state.pathParameters['serviceId']!,
                    keyword: state.uri.queryParameters['q']!,
                  );
                },
              )
            ],
          ),
        ]),
        // Bottom Navigation Item: Library
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/library',
            pageBuilder: GoTransitions.zoom.call,
            builder: (context, state) => LibraryPage(),
            routes: [
              GoRoute(
                path: 'history',
                pageBuilder: GoTransitions.zoom.call,
                builder: (context, state) => HistoryPage(),
              ),
              GoRoute(
                path: 'follow',
                pageBuilder: GoTransitions.zoom.call,
                builder: (context, state) => FollowPage(),
              )
            ],
          ),
        ]),
        // Bottom Navigation Item: Manager
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/manager',
            pageBuilder: GoTransitions.zoom.call,
            builder: (context, state) => ManagerPage(),
          ),
        ]),
      ],
    ),

    // --- Top-level routes ---
    // Details Comic Route
    GoRoute(
      path: '/details_comic/:sourceId/:bookId',
      name: 'details_comic',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: GoTransitions.zoom.call,
      builder: (context, state) => DetailsComic(
        sourceId: state.pathParameters['sourceId']!,
        bookId: state.pathParameters['bookId']!,
      ),
      routes: [
        GoRoute(
          path: 'view',
          name: 'details_comic_reader',
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: GoTransitions.zoom.call,
          builder: (context, state) {
            final chapterId = state.uri.queryParameters['chap']!;
            return DetailsComicReader(
              key: Key(state.pathParameters['bookId']!),
              sourceId: state.pathParameters['sourceId']!,
              bookId: state.pathParameters['bookId']!,
              chapterId: chapterId,
              book: state.extra != null
                  ? (state.extra as Map)['book'] as MetaBook
                  : null,
            );
          },
        ),
        GoRoute(
          path: 'similar',
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: GoTransitions.zoom.call,
          builder: (context, state) => SimilarPage(
            sourceId: state.pathParameters['sourceId']!,
            bookId: state.pathParameters['bookId']!,
            book:
                (state.extra is Map && (state.extra as Map).containsKey('book'))
                    ? (state.extra as Map)['book']
                    : null,
          ),
        )
      ],
    ),

    // Details Eiga Route
    GoRoute(
      path: '/details_eiga/:sourceId/:eigaId',
      name: 'details_eiga',
      parentNavigatorKey: _rootNavigatorKey, // Sử dụng root navigator
      pageBuilder: GoTransitions.zoom.call,
      builder: (context, state) => DetailsEigaPage(
        sourceId: state.pathParameters['sourceId']!,
        eigaId: state.pathParameters['eigaId']!,
        episodeId: state.uri.queryParameters['episodeId'],
      ),
    ),

    // Webview Route
    GoRoute(
      path: '/webview/:serviceId',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: GoTransitions.zoom.call,
      builder: (context, state) => WebviewPage(
        serviceId: state.pathParameters['serviceId']!,
      ),
    ),

    // Section Comic Route
    GoRoute(
      path: '/section_comic/:serviceId/:sectionId',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: GoTransitions.zoom.call,
      builder: (context, state) => SectionComicPage(
        serviceId: state.pathParameters['serviceId']!,
        sectionId: state.pathParameters['sectionId']!,
      ),
    ),

    // Section Eiga Route
    GoRoute(
      path: '/section_eiga/:serviceId/:sectionId',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: GoTransitions.zoom.call,
      builder: (context, state) => SectionEigaPage(
        serviceId: state.pathParameters['serviceId']!,
        sectionId: state.pathParameters['sectionId']!,
      ),
    ),
  ],
);

/// 日本語のコメント: 現在のURIに基づいてボトムツールバーを表示するかどうかを判定する関数。
bool shouldShowToolbar(String uriString) {
  const mainRoutes = [
    '/home_book',
    '/home_eiga',
    '/search',
    '/library',
    '/manager',
  ];

  for (final route in mainRoutes) {
    if (uriString == route || uriString.startsWith('$route/')) {
      return true;
    }
  }
  return false;
}

class PersistentScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final bool showToolbar;

  const PersistentScaffold({
    super.key,
    required this.navigationShell,
    required this.showToolbar,
  });

  @override
  Widget build(BuildContext context) {
    // 日本語のコメント:
    // ボトムナビゲーションバーはアニメーションするコンテンツの外側に構築される。

    final railMode = MediaQuery.of(context).size.width > 600;
    return railMode ? _buildRailMode() : _buildBottomNavigationBar();
  }

  Widget _buildRailMode() {
    return Scaffold(
      body: Row(
        children: [
          if (!showToolbar) ...[
            NavigationApp(
              selectedIndex: navigationShell.currentIndex,
              rail: true,
              onDestinationSelected: (index) {
                navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                );
              },
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
      body: navigationShell, // This area will have transition animations.
      bottomNavigationBar: showToolbar
          ? NavigationApp(
              selectedIndex: navigationShell.currentIndex,
              rail: false,
              onDestinationSelected: (index) {
                navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                );
              },
            )
          : null,
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
