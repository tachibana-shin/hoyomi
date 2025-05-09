import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/comic/main.dart';
import 'package:hoyomi/core_services/eiga/main.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:kaeru/kaeru.dart';

typedef FNService =
    ({
      String name,
      bool isComic,
      bool isGeneral,
      String sourceId,
      Future<dynamic> Function({required int page})? history,
      Future<dynamic> Function({required int page})? follow,
    });

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with SingleTickerProviderStateMixin, KaeruMixin {
  TabController? _tabController;

  List<FNService> get _services {
    final List<ComicWatchPageGeneralMixin> generalComic = [];
    final List<EigaWatchTimeGeneralMixin> generalEiga = [];

    final List<ABComicService> normalComic = [];
    final List<ABEigaService> normalEiga = [];

    for (final service in allServices.value) {
      if (service is ComicWatchPageGeneralMixin) {
        generalComic.add(service);
        continue;
      }
      if (service is EigaWatchTimeGeneralMixin) {
        generalEiga.add(service);
        continue;
      }
      if (service is ABComicService) {
        normalComic.add(service);
        continue;
      }
      if (service is ABEigaService) {
        normalEiga.add(service);
        continue;
      }
    }

    return [
      if (generalComic.isNotEmpty)
        (
          name: 'General Comic',
          isComic: true,
          isGeneral: true,
          sourceId: generalComic.first.uid,
          history:
              ({required int page}) =>
                  ComicWatchPageGeneralMixin.getAllWatchHistory(page: page),
          follow: null,
        ),

      if (generalEiga.isNotEmpty)
        (
          name: 'General Eiga',
          isComic: false,
          isGeneral: true,
          sourceId: generalEiga.first.uid,
          history:
              ({required int page}) =>
                  EigaWatchTimeGeneralMixin.getAllWatchHistory(page: page),
          follow: null,
        ),
      ...normalComic.map(
        (comic) => (
          name: comic.name,
          isComic: true,
          isGeneral: false,
          sourceId: comic.uid,
          history: ({required int page}) {
            if (comic is ComicWatchPageMixin) {
              return (comic as ComicWatchPageMixin).getWatchHistory(page: page);
            }

            throw UnimplementedError();
          },
          follow: ({required int page}) {
            if (comic is ComicFollowMixin) {
              return (comic as ComicFollowMixin).getFollows(page: page);
            }

            throw UnimplementedError();
          },
        ),
      ),
      ...normalEiga.map(
        (comic) => (
          name: comic.name,
          isComic: false,
          isGeneral: false,
          sourceId: comic.uid,
          history: ({required int page}) {
            if (comic is EigaWatchTimeMixin) {
              return (comic as EigaWatchTimeMixin).getWatchHistory(page: page);
            }

            throw UnimplementedError();
          },
          follow: ({required int page}) {
            if (comic is EigaFollowMixin) {
              return (comic as EigaFollowMixin).getFollows(page: page);
            }

            throw UnimplementedError();
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Watch(() {
      if (_tabController?.length != _services.length) {
        _tabController?.dispose();
        _tabController = TabController(length: _services.length, vsync: this);
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
              icon: Iconify(Ion.download),
              onPressed: () => context.pushNamed('downloader_comic'),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            splashBorderRadius: BorderRadius.circular(35.0),
            tabs: _services.map((service) => Tab(text: service.name)).toList(),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: _services.map((service) => _TabView(service)).toList(),
        ),
      );
    });
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
                more: '/library/history/comic/general',
                fn: widget.source.history as dynamic,
              ),
            // if (_service is ComicFollowMixin)
            // HorizontalComicFollowList(sourceId: widget.sourceId),
            if (!widget.source.isComic && widget.source.history != null)
              HorizontalEigaHistoryList(
                sourceId: widget.source.sourceId,
                more: '/library/history/eiga/general',
                fn: widget.source.history as dynamic,
              ),
            if (!widget.source.isComic && widget.source.follow != null)
              HorizontalEigaFollowList(
                sourceId: widget.source.sourceId,
                more: '/library/follow/eiga/general',
                fn: widget.source.follow as dynamic,
              ),
          ],
        );
      },
    );
  }
}
