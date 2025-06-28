import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/router/index.dart';
import 'package:hoyomi/screens/export.dart';
import 'package:hoyomi/stores.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:kaeru/kaeru.dart';

class HomeComicPage extends StatefulWidget {
  final String? service;

  const HomeComicPage({super.key, required this.service});

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
          initialIndex: comicServices.value
              .indexWhere((service) => service.uid == widget.service)
              .clamp(0, comicServices.value.length - 1),
          length: comicServices.value.length,
          vsync: this,
        );

        _tabController!.addListener(() {
          context.replaceNamed(
            'home_comic',
            queryParameters: {
              'service': comicServices.value[_tabController!.index].uid,
            },
          );
          lastTabActiveApp.value =
              '/home_comic?service=${comicServices.value[_tabController!.index].uid}';
          serviceSelect.value = comicServices.value[_tabController!.index].uid;
          PersistentScaffold.tabComic.value =
              comicServices.value[_tabController!.index].uid;
        });
      }

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          scrolledUnderElevation: 0.0,
          title: const GlobalSearchBar(pageIsSearch: false),
          centerTitle: true,
          titleSpacing: 0.0,
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            splashBorderRadius: BorderRadius.circular(35.0),
            tabAlignment: TabAlignment.start,
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
