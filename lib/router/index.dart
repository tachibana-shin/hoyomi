import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:hoyomi/constraints/x_platform.dart';
import 'package:hoyomi/controller/update_available.dart';
import 'package:hoyomi/core_services/comic/main.dart';

import 'package:hoyomi/plugins/export.dart';
import 'package:hoyomi/stores.dart';
import 'package:hoyomi/widgets/export.dart';

import 'package:kaeru/kaeru.dart';

import '../pages/export.dart';

final shellRouteKey = GlobalKey<State<StatefulWidget>>();

const branches = [
  '/home_comic',
  '/home_eiga',
  '/search',
  '/library',
  '/manager',
];

class _RestorableGoRoute extends GoRoute {
  _RestorableGoRoute({
    required super.path,
    super.builder,
    super.name,
    super.pageBuilder,
    super.parentNavigatorKey,
    super.redirect,
    super.routes,
  });

  @override
  int get hashCode => path.hashCode;

  @override
  bool operator ==(Object other) {
    return super == other ||
        (other is _RestorableGoRoute && hashCode == other.hashCode);
  }
}

/// 日本語のコメント: ルートナビゲーターのためのグローバルキー。
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final pageBuilder =
    (!XPlatform.isAndroid && !XPlatform.isIOS) ||
            (androidSdkInt != null && androidSdkInt! < 29)
        ? GoTransitions.zoom.call
        : null;

final routes = [
  // --- Shell route cho bottom navigation (5 items) ---
  StatefulShellRoute.indexedStack(
    restorationScopeId: 'root',
    builder: (context, state, navigationShell) {
      // Decide immediately whether to show the toolbar.
      final showToolbar = shouldShowToolbar(GoRouter.of(context).state.name);
      return PersistentScaffold(
        key: shellRouteKey,
        navigationShell: navigationShell,
        showToolbar: showToolbar,
      );
    },
    branches: [
      // Bottom Navigation Item: Home Comic
      StatefulShellBranch(
        restorationScopeId: 'home_comic',
        routes: [
          _RestorableGoRoute(
            path: '/home_comic',
            name: 'home_comic',
            pageBuilder: pageBuilder,
            builder:
                (context, state) => HomeComicPage(
                  service: state.uri.queryParameters['service'],
                ),
          ),
        ],
      ),
      // Bottom Navigation Item: Home Eiga
      StatefulShellBranch(
        restorationScopeId: 'home_eiga',
        routes: [
          _RestorableGoRoute(
            path: '/home_eiga',
            name: 'home_eiga',
            pageBuilder: pageBuilder,
            builder:
                (context, state) =>
                    HomeEigaPage(service: state.uri.queryParameters['service']),
          ),
        ],
      ),
      // Bottom Navigation Item: Search
      StatefulShellBranch(
        restorationScopeId: 'search',
        routes: [
          _RestorableGoRoute(
            path: '/search',
            name: 'search',
            pageBuilder: pageBuilder,
            builder:
                (context, state) =>
                    SearchPage(from: state.uri.queryParameters['from']),
            routes: [
              _RestorableGoRoute(
                path: 'comic/:sourceId',
                name: 'search_comic',
                pageBuilder: pageBuilder,
                builder: (context, state) {
                  if (state.uri.queryParameters['q'] == null) {
                    context.pushReplacement("/search");
                    return const SizedBox();
                  }
                  return SearchComicPage(
                    sourceId: state.pathParameters['sourceId']!,
                    keyword: state.uri.queryParameters['q']!,
                  );
                },
              ),
              _RestorableGoRoute(
                path: 'eiga/:sourceId',
                name: 'search_eiga',
                pageBuilder: pageBuilder,
                builder: (context, state) {
                  if (state.uri.queryParameters['q'] == null) {
                    context.pushReplacement("/search");
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
        restorationScopeId: 'library',
        routes: [
          _RestorableGoRoute(
            path: '/library',
            name: 'library',
            pageBuilder: pageBuilder,
            builder: (context, state) => LibraryPage(),
            routes: [
              _RestorableGoRoute(
                path: 'history/comic/:sourceId',
                name: 'history_comic',
                pageBuilder: pageBuilder,
                builder:
                    (context, state) => HistoryComicPage(
                      sourceId: state.pathParameters['sourceId']!,
                    ),
              ),
              _RestorableGoRoute(
                path: 'follow/comic/:sourceId',
                name: 'follow_comic',
                pageBuilder: pageBuilder,
                builder:
                    (context, state) => FollowsComicPage(
                      sourceId: state.pathParameters['sourceId']!,
                    ),
              ),
              _RestorableGoRoute(
                path: 'history/eiga/:sourceId',
                name: 'history_eiga',
                pageBuilder: pageBuilder,
                builder:
                    (context, state) => HistoryEigaPage(
                      sourceId: state.pathParameters['sourceId']!,
                    ),
              ),
              _RestorableGoRoute(
                path: 'follow/eiga/:sourceId',
                name: 'follow_eiga',
                pageBuilder: pageBuilder,
                builder:
                    (context, state) => FollowsEigaPage(
                      sourceId: state.pathParameters['sourceId']!,
                    ),
              ),
              _RestorableGoRoute(
                path: 'downloader',
                pageBuilder: pageBuilder,
                builder: (context, state) {
                  context.replaceNamed('downloader_comic');
                  return SizedBox.shrink();
                },
                routes: [
                  _RestorableGoRoute(
                    path: 'comic',
                    name: 'downloader_comic',
                    pageBuilder: pageBuilder,
                    builder: (context, state) => DownloaderComicPage(),
                  ),
                ],
              ),
              _RestorableGoRoute(
                path: '/explorer/:sourceId',
                name: 'library_explorer',
                pageBuilder: pageBuilder,
                builder:
                    (context, state) => ExplorerPage(
                      sourceId: state.pathParameters['sourceId']!,
                    ),
              ),
            ],
          ),
        ],
      ),
      // Bottom Navigation Item: Manager
      StatefulShellBranch(
        restorationScopeId: 'manager',
        routes: [
          _RestorableGoRoute(
            path: '/manager',
            name: 'manager',
            pageBuilder: pageBuilder,
            builder: (context, state) => ManagerPage(),
          ),
          _RestorableGoRoute(
            path: '/manager/logger',
            name: 'manager_logger',
            pageBuilder: pageBuilder,
            builder: (context, state) => LoggerPage(),
          ),
        ],
      ),
    ],
  ),

  // --- Top-level routes ---
  // Index Route
  _RestorableGoRoute(
    path: '/',
    name: 'home',
    redirect: (context, state) => '/home_eiga',
  ),
  // Details Comic Route
  _RestorableGoRoute(
    path: '/details_comic/:sourceId/:comicId',
    name: 'details_comic',
    pageBuilder: pageBuilder,
    parentNavigatorKey: rootNavigatorKey,
    builder:
        (context, state) => DetailsComic(
          sourceId: state.pathParameters['sourceId']!,
          comicId: state.pathParameters['comicId']!,
          comic:
              state.extra != null
                  ? (state.extra as Map)['comic'] as MetaComic
                  : null,
        ),
    routes: [
      _RestorableGoRoute(
        path: 'view',
        name: 'details_comic_reader',
        pageBuilder: pageBuilder,
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) {
          final chapterId = state.uri.queryParameters['chap']!;
          return DetailsComicReader(
            key: Key(state.pathParameters['comicId']!),
            sourceId: state.pathParameters['sourceId']!,
            comicId: state.pathParameters['comicId']!,
            chapterId: chapterId,
            comic:
                state.extra != null
                    ? (state.extra as Map)['comic'] as MetaComic
                    : null,
          );
        },
      ),
      _RestorableGoRoute(
        path: 'similar',
        name: 'similar_comic',
        pageBuilder: pageBuilder,
        parentNavigatorKey: rootNavigatorKey,
        builder:
            (context, state) => SimilarPage(
              sourceId: state.pathParameters['sourceId']!,
              comicId: state.pathParameters['comicId']!,
              comic:
                  (state.extra is Map &&
                          (state.extra as Map).containsKey('comic'))
                      ? (state.extra as Map)['comic']
                      : null,
            ),
      ),
    ],
  ),

  // Details Eiga Route
  _RestorableGoRoute(
    path: '/details_eiga/:sourceId/:eigaId',
    name: 'details_eiga',
    pageBuilder: pageBuilder,
    parentNavigatorKey: rootNavigatorKey,
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

  // Sign In Route
  _RestorableGoRoute(
    path: '/sign_in/main',
    name: 'sign_in_main',
    pageBuilder: pageBuilder,
    parentNavigatorKey: rootNavigatorKey,
    builder: (context, state) => SignInMainPage(),
  ),

  // Webview Route
  _RestorableGoRoute(
    path: '/webview/:sourceId',
    name: 'webview',
    pageBuilder: pageBuilder,
    parentNavigatorKey: rootNavigatorKey,
    builder:
        (context, state) => WebviewPage(
          sourceId: state.pathParameters['sourceId']!,
          logout: state.uri.queryParameters['logout'] == 'true',
        ),
  ),

  // Category Comic Route
  _RestorableGoRoute(
    path: '/category_comic/:sourceId/:categoryId',
    name: 'category_comic',
    pageBuilder: pageBuilder,
    parentNavigatorKey: rootNavigatorKey,
    builder:
        (context, state) => CategoryComicPage(
          sourceId: state.pathParameters['sourceId']!,
          categoryId: state.pathParameters['categoryId']!,
        ),
  ),

  // Category Eiga Route
  _RestorableGoRoute(
    path: '/category_eiga/:sourceId/:categoryId',
    name: 'category_eiga',
    pageBuilder: pageBuilder,
    parentNavigatorKey: rootNavigatorKey,
    builder:
        (context, state) => CategoryEigaPage(
          sourceId: state.pathParameters['sourceId']!,
          categoryId: state.pathParameters['categoryId']!,
        ),
  ),

  // Category Service Setting Route
  _RestorableGoRoute(
    path: '/service_settings/:sourceId',
    name: 'service_settings',
    pageBuilder: pageBuilder,
    parentNavigatorKey: rootNavigatorKey,
    builder:
        (context, state) =>
            ServiceSettingsPage(sourceId: state.pathParameters['sourceId']!),
  ),
];

late final GoRouter router;
void initializeRouter() {
  router = GoRouter(
    restorationScopeId: 'router',
    navigatorKey: rootNavigatorKey,
    initialLocation: lastTabActiveApp.value ?? '/home_eiga',
    observers: [GoTransition.observer],
    routes: routes,
  );
}

/// 日本語のコメント: 現在のURIに基づいてボトムツールバーを表示するかどうかを判定する関数。
bool shouldShowToolbar(String? name) {
  const mainRoutes = [
    'history_comic',
    'follow_comic',
    'history_eiga',
    'follow_eiga',
    'downloader',
  ];

  return name != null &&
      (mainRoutes.contains(name) || branches.contains('/$name'));

  // for (final route in mainRoutes) {
  //   if (uriString.startsWith(route) || uriString.startsWith('$route/')) {
  //     if (route.startsWith('/search') ? (route == '/search' || route.startsWith('/search?')) : false) return true;
  //     return true;

  //     // if (route == '/search'
  //     //     ? (Uri.parse(uriString).queryParameters['q']?.trim().isNotEmpty !=
  //     //         true)
  //     //     : true) {
  //     //   return true;
  //     // }
  //   }
  // }

  // return false;
}

void goBranch(BuildContext context, String name) {
  final router = StatefulNavigationShell.of(context);
  final index = branches.indexOf('/$name') >>> 0;

  router.goBranch(index, initialLocation: index == router.currentIndex);
}

class PersistentScaffold extends StatelessWidget {
  static final tabComic = Ref<String?>(null);
  static final tabEiga = Ref<String?>(null);

  final StatefulNavigationShell navigationShell;
  final bool showToolbar;

  const PersistentScaffold({
    super.key,
    required this.navigationShell,
    required this.showToolbar,
  });

  void _onDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );

    lastTabActiveApp.value =
        branches[index] +
        (switch (branches[index]) {
          == '/home_comic' =>
            '?service=${serviceSelect.value = tabComic.value ?? comicServices.value.first.uid}',
          == '/home_eiga' =>
            '?service=${serviceSelect.value = tabEiga.value ?? eigaServices.value.first.uid}',
          _ => '',
        });
  }

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
          if (showToolbar) ...[
            NavigationApp(
              selectedIndex: navigationShell.currentIndex,
              rail: true,
              onDestinationSelected: _onDestinationSelected,
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
      bottomNavigationBar:
          showToolbar
              ? NavigationApp(
                selectedIndex: navigationShell.currentIndex,
                rail: false,
                onDestinationSelected: _onDestinationSelected,
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
