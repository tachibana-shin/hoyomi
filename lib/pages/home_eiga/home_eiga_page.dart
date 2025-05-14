import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/screens/export.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:kaeru/kaeru.dart';

class HomeEigaPage extends StatefulWidget {
  final String? service;

  const HomeEigaPage({super.key, required this.service});

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
          initialIndex: eigaServices.value
              .indexWhere((service) => service.uid == widget.service)
              .clamp(0, eigaServices.value.length - 1),
          length: eigaServices.value.length,
          vsync: this,
        );

        _tabController!.addListener(() {
          context.replaceNamed(
            'home_eiga',
            queryParameters: {
              'service': eigaServices.value[_tabController!.index].uid,
            },
          );
        });
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
