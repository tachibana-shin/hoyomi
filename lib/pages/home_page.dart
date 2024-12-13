import 'package:flutter/material.dart';
import 'package:honyomi/core_services/main.dart';
import 'package:honyomi/views/home/tab_view.dart';
import 'package:honyomi/widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Widget? _overlayQuickSearch;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: services.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _setOverlay(Widget? overlay) {
    setState(() {
      _overlayQuickSearch = overlay;
    });
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
        title: CustomSearchBar(
            keyword: '',
            onOverlayChange: (overlay) {
              setState(() {
                _setOverlay(overlay);
              });
            }),
        centerTitle: true,
        titleSpacing: 0.0,
        bottom: _overlayQuickSearch != null
            ? null
            : TabBar(
                controller: _tabController,
                isScrollable: true,
                splashBorderRadius: BorderRadius.circular(35.0),
                tabs:
                    services.map((service) => Tab(text: service.name)).toList(),
              ),
      ),
      body: Stack(children: [
        TabBarView(
          controller: _tabController,
          children: services
              .map(
                  (service) => TabView(key: Key(service.uid), service: service))
              .toList(),
        ),
        ...(_overlayQuickSearch != null ? [_overlayQuickSearch!] : [])
      ]),
    );
  }
}
