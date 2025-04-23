import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/mixin/eiga_follow_mixin.dart';
import 'package:hoyomi/core_services/eiga/mixin/eiga_watch_time_mixin.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/widgets/library/follow/eiga/horizontal_eiga_follow_list.dart';
import 'package:hoyomi/widgets/library/history/eiga/horizontal_eiga_history_list.dart';
import 'package:hoyomi/widgets/pull_refresh_page.dart';
import 'package:kaeru/kaeru.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with SingleTickerProviderStateMixin, KaeruMixin {
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Watch(() {
      if (_tabController?.length != eigaServices.value.length) {
        _tabController?.dispose();
        _tabController =
            TabController(length: eigaServices.value.length, vsync: this);
      }

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          scrolledUnderElevation: 0.0,
          // floating: _overlayQuickSearch == null,
          // snap: _overlayQuickSearch == null,
          // pinned: _overlayQuickSearch == null,
          title: Text('Library'),
          centerTitle: true,
          titleSpacing: 0.0,
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            splashBorderRadius: BorderRadius.circular(35.0),
            tabs: eigaServices.value
                .map((service) => Tab(text: service.name))
                .toList(),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: eigaServices.value
              .map((service) => _TabView(sourceId: service.uid))
              .toList(),
        ),
      );
    });
  }
}

class _TabView extends StatefulWidget {
  final String sourceId;

  const _TabView({required this.sourceId});

  @override
  State<_TabView> createState() => _TabViewState();
}

class _TabViewState extends State<_TabView> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late final Service _service;

  @override
  void initState() {
    _service = getEigaService(widget.sourceId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (_service is! EigaWatchTimeMixin && _service is! EigaFollowMixin) {
      return Center(child: Text('This service not support history or follow'));
    }

    return PullRefreshPage(
      onLoadData: () async {
        return [0x0, 0x0];
      },
      onLoadFake: () => [0x0, 0x0],
      builder: (data, _) {
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          children: [
            if (_service is EigaWatchTimeMixin)
              HorizontalEigaHistoryList(sourceId: widget.sourceId),
            if (_service is EigaFollowMixin)
              HorizontalEigaFollowList(sourceId: widget.sourceId),
          ],
        );
      },
    );
  }
}
