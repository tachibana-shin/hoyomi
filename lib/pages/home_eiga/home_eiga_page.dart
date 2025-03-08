import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/screens/home_eiga/tab_view_eiga.dart';
import 'package:hoyomi/widgets/global_search_bar.dart';

class HomeEigaPage extends StatefulWidget {
  const HomeEigaPage({super.key});

  @override
  State<HomeEigaPage> createState() => _HomeEigaPageState();
}

class _HomeEigaPageState extends State<HomeEigaPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: eigaServices.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        scrolledUnderElevation: 0.0,
        // floating: _overlayQuickSearch == null,
        // snap: _overlayQuickSearch == null,
        // pinned: _overlayQuickSearch == null,
        title: GlobalSearchBar(keyword: '', pageIsSearch: false),
        centerTitle: true,
        titleSpacing: 0.0,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          splashBorderRadius: BorderRadius.circular(35.0),
          tabs: eigaServices.map((service) => Tab(text: service.name)).toList(),
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: eigaServices
              .map(
                (service) =>
                    TabViewEiga(key: Key(service.uid), service: service),
              )
              .toList()),
    );
  }
}
