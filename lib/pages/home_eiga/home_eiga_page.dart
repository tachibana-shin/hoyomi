import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/screens/export.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:kaeru/kaeru.dart';

class HomeEigaPage extends StatefulWidget {
  const HomeEigaPage({super.key});

  @override
  State<HomeEigaPage> createState() => _HomeEigaPageState();
}

class _HomeEigaPageState extends State<HomeEigaPage>
    with SingleTickerProviderStateMixin, KaeruMixin {
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Watch(() {
      if (_tabController?.length != eigaServices.value.length) {
        _tabController?.dispose();
        _tabController = TabController(
          length: eigaServices.value.length,
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
          title: GlobalSearchBar(pageIsSearch: false),
          centerTitle: true,
          titleSpacing: 0.0,
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            splashBorderRadius: BorderRadius.circular(35.0),
            tabs:
                eigaServices.value
                    .map((service) => Tab(text: service.name))
                    .toList(),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children:
              eigaServices.value
                  .map(
                    (service) =>
                        TabViewEiga(key: Key(service.uid), service: service),
                  )
                  .toList(),
        ),
      );
    });
  }
}
