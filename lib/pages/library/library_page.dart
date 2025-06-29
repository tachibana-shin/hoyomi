import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/constraints/fluent.dart';
import 'package:hoyomi/constraints/huge_icons.dart';
import 'package:hoyomi/core_services/comic/main.dart';
import 'package:hoyomi/core_services/eiga/main.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/mixin/export.dart';
import 'package:hoyomi/router/extensions/to_router.dart';
import 'package:hoyomi/stores.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:kaeru/kaeru.dart';
import 'package:responsive_grid/responsive_grid.dart';

typedef FNService =
    ({
      String name,
      bool isComic,
      bool isGeneral,
      String sourceId,
      Future<dynamic> Function({required int page})? history,
      Future<dynamic> Function({required int page})? follow,
    });

FNService _serviceToFNService(Service comic) {
  return comic is ABComicService
      ? (
        name: comic.name,
        isComic: true,
        isGeneral: false,
        sourceId: comic.uid,
        history: ({required int page}) {
          return comic.getWatchHistory(page: page);
        },
        follow: ({required int page}) {
          return comic.getFollows(page: page);
        },
      )
      : (
        name: comic.name,
        isComic: false,
        isGeneral: false,
        sourceId: comic.uid,
        history: ({required int page}) {
          return (comic as EigaWatchTimeMixin).getWatchHistory(page: page);
        },
        follow: ({required int page}) {
          return (comic as EigaFollowMixin).getFollows(page: page);
        },
      );
}

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with SingleTickerProviderStateMixin, KaeruMixin {
  TabController? _tabController;

  late final _services = computed<List<FNService>>(() {
    final List<ComicWatchPageGeneralMixin> generalComic = [];
    final List<EigaWatchTimeGeneralMixin> generalEiga = [];

    final List<ABComicService> normalComic = [];
    final List<ABEigaService> normalEiga = [];

    for (final service in allServices.value) {
      if (service is ABComicService && !(service as AuthMixin).$noAuth) {
        normalComic.add(service);
        continue;
      }
      if (service is ABEigaService && !(service as AuthMixin).$noAuth) {
        normalEiga.add(service);
        continue;
      }
      if (service is ComicWatchPageGeneralMixin) {
        generalComic.add(service);
        continue;
      }
      if (service is EigaWatchTimeGeneralMixin) {
        generalEiga.add(service);
        continue;
      }
    }

    final Map<String, Service> allNormalService = Map.fromEntries(
      [
        ...normalComic,
        ...normalEiga,
      ].map((service) => MapEntry(service.uid, service)),
    );

    final FNService generalComicService = (
      name: 'General Comic',
      isComic: true,
      isGeneral: true,
      sourceId: generalComic.first.uid,
      history:
          ({required int page}) =>
              ComicWatchPageGeneralMixin.getAllWatchHistory(page: page),
      follow:
          ({required int page}) =>
              ComicFollowGeneralMixin.getAllListFollow(page: page),
    );
    final FNService generalEigaService = (
      name: 'General Eiga',
      isComic: false,
      isGeneral: true,
      sourceId: generalEiga.first.uid,
      history:
          ({required int page}) =>
              EigaWatchTimeGeneralMixin.getAllWatchHistory(page: page),
      follow:
          ({required int page}) =>
              EigaFollowGeneralMixin.getAllListFollow(page: page),
    );

    final List<FNService> normalService =
        sortLibraryService.value
            .map((id) {
              return switch (id) {
                == '\$\$comic\$\$' => generalComicService,
                == '\$\$eiga\$\$' => generalEigaService,
                _ =>
                  allNormalService[id] != null
                      ? _serviceToFNService(allNormalService[id]!)
                      : null,
              };
            })
            .whereType<FNService>()
            .toList();

    for (final service in allNormalService.values) {
      if (!sortLibraryService.value.contains(service.uid)) {
        normalService.add(_serviceToFNService(service));
      }
    }

    if (!normalService.contains(generalComicService)) {
      normalService.insert(0, generalComicService);
    }
    if (!normalService.contains(generalEigaService)) {
      normalService.insert(0, generalEigaService);
    }

    return normalService;
  });

  @override
  Widget build(BuildContext context) {
    return Watch(() {
      if (_tabController?.length != _services.value.length) {
        _tabController?.dispose();
        _tabController = TabController(
          length: _services.value.length + 1,
          vsync: this,
        );
      }

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          scrolledUnderElevation: 0.0,
          // floating: _overlayQuickSearch == null,
          // snap: _overlayQuickSearch == null,
          // pinned: _overlayQuickSearch == null,
          title: Text('Library'),
          actions: [
            IconButton(
              onPressed: () {
                showServiceManagerDialog(
                  context,
                  items:
                      _services.value.map((service) {
                        if (service.isGeneral) {
                          return switch (service.isComic) {
                            true => ServiceManagerItem(
                              uid: '\$\$comic\$\$',
                              name: 'General Comic',
                              avatar: Iconify(Fluent.extension20),
                            ),
                            false => ServiceManagerItem(
                              uid: '\$\$eiga\$\$',
                              name: 'General Eiga',
                              avatar: Iconify(Fluent.extension20),
                            ),
                          };
                        }

                        final serviceA = getService(service.sourceId);

                        return ServiceManagerItem(
                          uid: serviceA.uid,
                          name: serviceA.name,
                          service: serviceA,
                        );
                      }).toList(),
                  onDone: (newValue) {
                    sortLibraryService.value =
                        newValue
                            .map((item) => item.uid ?? item.service!.uid)
                            .toList();
                  },
                );
              },
              icon: Iconify(Fluent.extension20),
            ),
            IconButton(
              icon: Iconify(Ion.download),
              onPressed: () => context.pushNamed('downloader_comic'),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            splashBorderRadius: BorderRadius.circular(35.0),
            tabs: [
              Tab(icon: Iconify(Fluent.extension24Filled)),
              ..._services.value.map((service) => Tab(text: service.name)),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildTabExplorer(),
            ..._services.value.map((service) => _TabView(service)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _tabController?.animateTo(0),
          tooltip: 'Explorer',
          child: Iconify(Fluent.extension24Filled),
        ),
      );
    });
  }

  Widget _buildTabExplorer() {
    return SingleChildScrollView(
      child: ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            child: Text('Comic').paddingSymmetric(horizontal: 8.0),
          ),
          for (final service in comicServices.value)
            ResponsiveGridCol(
              sm: 6,
              md: 4,
              child: ItemServiceManager((
                service: service,
                onTap:
                    () => context.pushNamed(
                      'library_explorer',
                      pathParameters: {'sourceId': service.uid},
                    ),
                trailing: Iconify(Hg.safari),
              )),
            ),

          ResponsiveGridCol(child: 10.heightBox),

          ResponsiveGridCol(
            child: Text('Eiga').paddingSymmetric(horizontal: 8.0),
          ),
          for (final service in eigaServices.value)
            ResponsiveGridCol(
              sm: 6,
              md: 4,
              child: ItemServiceManager((
                service: service,
                onTap:
                    () => context.pushNamed(
                      'library_explorer',
                      pathParameters: {'sourceId': service.uid},
                    ),
                trailing: Iconify(Hg.safari),
              )),
            ),
        ],
      ),
    );
  }
}

class _TabView extends StatefulWidget {
  final FNService source;

  const _TabView(this.source);

  @override
  State<_TabView> createState() => _TabViewState();
}

class _TabViewState extends State<_TabView> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (widget.source.follow == null && widget.source.history == null) {
      return Center(child: Text('This service not support history or follow'));
    }

    return PullRefreshPage(
      onLoadData: () async {
        return UniqueKey();
      },
      onLoadFake: () => UniqueKey(),
      builder: (data, _) {
        return ListView(
          key: data,
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          children: [
            if (widget.source.isComic && widget.source.history != null)
              HorizontalComicHistoryList(
                sourceId: widget.source.sourceId,
                more:
                    !widget.source.isGeneral
                        ? null
                        : ToRoute(
                          name: 'history_comic',
                          pathParameters: {'sourceId': 'general'},
                        ),
                fn: widget.source.history as dynamic,
                isGeneral: widget.source.isGeneral,
              ),
            if (widget.source.isComic && widget.source.follow != null)
              HorizontalComicFollowList(
                sourceId: widget.source.sourceId,
                more:
                    !widget.source.isGeneral
                        ? null
                        : ToRoute(
                          name: 'follow_comic',
                          pathParameters: {'sourceId': 'general'},
                        ),
                fn: widget.source.follow as dynamic,
                isGeneral: widget.source.isGeneral,
              ),
            if (!widget.source.isComic && widget.source.history != null)
              HorizontalEigaHistoryList(
                sourceId: widget.source.sourceId,
                more:
                    !widget.source.isGeneral
                        ? null
                        : '/library/history/eiga/general',
                fn: widget.source.history as dynamic,
                isGeneral: widget.source.isGeneral,
              ),
            if (!widget.source.isComic && widget.source.follow != null)
              HorizontalEigaFollowList(
                sourceId: widget.source.sourceId,
                more:
                    !widget.source.isGeneral
                        ? null
                        : ToRoute(
                          name: 'follow_eiga',
                          pathParameters: {'sourceId': 'general'},
                        ),
                fn: widget.source.follow as dynamic,
              ),
          ],
        );
      },
    );
  }
}
