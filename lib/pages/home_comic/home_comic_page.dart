import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/screens/home_comic/tab_view_comic.dart';
import 'package:hoyomi/widgets/global_search_bar.dart';

class HomeComicPage extends StatelessWidget {
  const HomeComicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomeComic());
  }
}

class HomeComic extends StatefulWidget {
  const HomeComic({super.key});

  @override
  State<HomeComic> createState() => _HomeComicState();
}

class _HomeComicState extends State<HomeComic>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: comicServices.length, vsync: this);
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
            tabs: comicServices
                .map((service) => Tab(text: service.name))
                .toList(),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: comicServices
              .map(
                (service) =>
                    TabViewComic(key: Key(service.uid), service: service),
              )
              .toList(),
        ));
  }
}
