import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/screens/home_comic/tab_view_comic.dart';
import 'package:hoyomi/widgets/global_search_bar.dart';
import 'package:kaeru/kaeru.dart';

class HomeComicPage extends StatefulWidget {
  const HomeComicPage({super.key});

  @override
  State<HomeComicPage> createState() => _HomeComicPageState();
}

class _HomeComicPageState extends State<HomeComicPage>
    with SingleTickerProviderStateMixin, KaeruMixin {
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Watch(() {
      if (_tabController?.length != comicServices.value.length) {
        _tabController?.dispose();
        _tabController = TabController(
          length: comicServices.value.length,
          vsync: this,
        );
      }

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          scrolledUnderElevation: 0.0,
          title: const GlobalSearchBar(keyword: '', pageIsSearch: false),
          centerTitle: true,
          titleSpacing: 0.0,
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            splashBorderRadius: BorderRadius.circular(35.0),
            tabs:
                comicServices.value
                    .map((service) => Tab(text: service.name))
                    .toList(),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children:
              comicServices.value
                  .map(
                    (service) =>
                        TabViewComic(key: Key(service.uid), service: service),
                  )
                  .toList(),
        ),
      );
    });
  }
}
