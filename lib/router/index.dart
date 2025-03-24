import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:hoyomi/controller/update_available.dart';
import 'package:hoyomi/core_services/comic/interfaces/meta_comic.dart';

import 'package:hoyomi/pages/details_comic/[sourceId]/[comicId].page.dart';
import 'package:hoyomi/pages/details_comic/[sourceId]/[comicId]/[chapterId].page.dart';
import 'package:hoyomi/pages/home_comic/home_comic_page.dart';
import 'package:hoyomi/pages/home_eiga/home_eiga_page.dart';
import 'package:hoyomi/pages/library/follow/eiga/[sourceId].page.dart';
import 'package:hoyomi/pages/library/history/eiga/[sourceId].page.dart';
import 'package:hoyomi/pages/library/library_page.dart';
import 'package:hoyomi/pages/manager_page.dart';
import 'package:hoyomi/pages/search/comic/[sourceId].page.dart';
import 'package:hoyomi/pages/search/eiga/[sourceId].page.dart';
import 'package:hoyomi/pages/search/index_page.dart';
import 'package:hoyomi/pages/category_comic/%5BsourceId%5D/%5BcategoryId%5D.page.dart';
import 'package:hoyomi/pages/category_eiga/%5BsourceId%5D/%5BcategoryId%5D.page.dart';
import 'package:hoyomi/pages/service_settings/[sourceId].page.dart';
import 'package:hoyomi/pages/webview_page.dart';
import 'package:hoyomi/plugins/android_sdk_int.dart';

import 'package:hoyomi/widgets/navigation_app.dart';

import '../pages/details_comic/[sourceId]/[comicId]/similar/similar_page.dart';
import '../pages/details_eiga/[sourceId]/[eigaId].page.dart';

final List<String> routeIgnoreLayoutDefault = [
  '/details_comic',
  '/details_eiga',
  '/webview',
  '/search/',
  '/search?q=',
  '/category_comic',
  '/category_eiga',
];

/// 日本語のコメント: ルートナビゲーターのためのグローバルキー。
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final pageBuilder = (androidSdkInt != null && androidSdkInt! < 29)
    ? GoTransitions.zoom.call
    : null;
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
        // Bottom Navigation Item: Home Comic
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home_comic',
              name: 'home_comic',
              pageBuilder: pageBuilder,
              builder: (context, state) => HomeComicPage(),
            ),
          ],
        ),
        // Bottom Navigation Item: Home Eiga
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home_eiga',
              name: 'home_eiga',
              pageBuilder: pageBuilder,
              builder: (context, state) => HomeEigaPage(),
            ),
          ],
        ),
        // Bottom Navigation Item: Search
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/search',
              name: 'search',
              pageBuilder: pageBuilder,
              builder: (context, state) => SearchPage(
                  key: ValueKey(state.uri.queryParameters['q'] ?? ''),
                  keyword: state.uri.queryParameters['q'] ?? '',
                  from: state.uri.queryParameters['from']),
              routes: [
                GoRoute(
                  path: 'comic/:sourceId',
                  name: 'search_comic',
                  pageBuilder: pageBuilder,
                  builder: (context, state) {
                    if (state.uri.queryParameters['q'] == null) {
                      context.replace("/search");
                      return const SizedBox();
                    }
                    return SearchComicPage(
                      sourceId: state.pathParameters['sourceId']!,
                      keyword: state.uri.queryParameters['q']!,
                    );
                  },
                ),
                GoRoute(
                  path: 'eiga/:sourceId',
                  name: 'search_eiga',
                  pageBuilder: pageBuilder,
                  builder: (context, state) {
                    if (state.uri.queryParameters['q'] == null) {
                      context.replace("/search");
                      return const SizedBox();
                    }
                    return SearchEigaPage(
                      sourceId: state.pathParameters['sourceId']!,
                      keyword: state.uri.queryParameters['q']!,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        // Bottom Navigation Item: Library
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/library',
              name: 'library',
              pageBuilder: pageBuilder,
              builder: (context, state) => LibraryPage(),
              routes: [
                GoRoute(
                  path: 'history/eiga/:sourceId',
                  name: 'history_eiga',
                  pageBuilder: pageBuilder,
                  builder: (context, state) => HistoryEigaPage(
                    sourceId: state.pathParameters['sourceId']!,
                  ),
                ),
                GoRoute(
                  path: 'follow/eiga/:sourceId',
                  name: 'follow_eiga',
                  pageBuilder: pageBuilder,
                  builder: (context, state) => FollowsEigaPage(
                    sourceId: state.pathParameters['sourceId']!,
                  ),
                ),
              ],
            ),
          ],
        ),
        // Bottom Navigation Item: Manager
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/manager',
              name: 'manager',
              pageBuilder: pageBuilder,
              builder: (context, state) => ManagerPage(),
            ),
          ],
        ),
      ],
    ),

    // --- Top-level routes ---
    // Details Comic Route
    GoRoute(
      path: '/details_comic/:sourceId/:comicId',
      name: 'details_comic',
      pageBuilder: pageBuilder,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => DetailsComic(
        sourceId: state.pathParameters['sourceId']!,
        comicId: state.pathParameters['comicId']!,
      ),
      routes: [
        GoRoute(
          path: 'view',
          name: 'details_comic_reader',
          pageBuilder: pageBuilder,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) {
            final chapterId = state.uri.queryParameters['chap']!;
            return DetailsComicReader(
              key: Key(state.pathParameters['comicId']!),
              sourceId: state.pathParameters['sourceId']!,
              comicId: state.pathParameters['comicId']!,
              chapterId: chapterId,
              comic: state.extra != null
                  ? (state.extra as Map)['comic'] as MetaComic
                  : null,
            );
          },
        ),
        GoRoute(
          path: 'similar',
          name: 'similar_comic',
          pageBuilder: pageBuilder,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => SimilarPage(
            sourceId: state.pathParameters['sourceId']!,
            comicId: state.pathParameters['comicId']!,
            comic: (state.extra is Map &&
                    (state.extra as Map).containsKey('comic'))
                ? (state.extra as Map)['comic']
                : null,
          ),
        ),
      ],
    ),

    // Details Eiga Route
    GoRoute(
      path: '/details_eiga/:sourceId/:eigaId',
      name: 'details_eiga',
      pageBuilder: pageBuilder,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final sourceId = state.pathParameters['sourceId']!;
        final eigaId = state.pathParameters['eigaId']!;
        final episodeId = state.uri.queryParameters['episodeId'];

        return DetailsEigaPage(
          key: ValueKey('$sourceId/$eigaId'),
          sourceId: sourceId,
          eigaId: eigaId,
          episodeId: episodeId,
        );
      },
    ),

    // Webview Route
    GoRoute(
      path: '/webview/:sourceId',
      name: 'webview',
      pageBuilder: pageBuilder,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) =>
          WebviewPage(sourceId: state.pathParameters['sourceId']!),
    ),

    // Category Comic Route
    GoRoute(
      path: '/category_comic/:sourceId/:categoryId',
      name: 'category_comic',
      pageBuilder: pageBuilder,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => CategoryComicPage(
        sourceId: state.pathParameters['sourceId']!,
        categoryId: state.pathParameters['categoryId']!,
      ),
    ),

    // Category Eiga Route
    GoRoute(
      path: '/category_eiga/:sourceId/:categoryId',
      name: 'category_eiga',
      pageBuilder: pageBuilder,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => CategoryEigaPage(
        sourceId: state.pathParameters['sourceId']!,
        categoryId: state.pathParameters['categoryId']!,
      ),
    ),

    // Category Service Setting Route
    GoRoute(
      path: '/service_settings/:sourceId',
      name: 'service_settings',
      pageBuilder: pageBuilder,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) =>
          ServiceSettingsPage(sourceId: state.pathParameters['sourceId']!),
    ),
  ],
);

/// 日本語のコメント: 現在のURIに基づいてボトムツールバーを表示するかどうかを判定する関数。
bool shouldShowToolbar(String uriString) {
  const mainRoutes = [
    '/home_comic',
    '/home_eiga',
    '/search',
    '/library',
    '/manager',
  ];
  const excludeRoutes = ['/search/'];

  if (excludeRoutes.every((exclude) => !uriString.startsWith(exclude))) {
    for (final route in mainRoutes) {
      if (uriString == route || uriString.startsWith('$route/')) {
        return true;
      }
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

    if (!UpdateAvailableController.instance.initialized) {
      Future.delayed(Duration(seconds: 1), () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          UpdateAvailableController.instance.init(context);
        });
      });
    }

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
          Expanded(child: navigationShell),
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
