import 'package:flutter/material.dart';
import 'package:honyomi/services/main.dart';
import 'package:honyomi/views/home/tab_view.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
              foregroundColor: Colors.transparent,
              scrolledUnderElevation : 0.0,
              floating: true,
              snap: true,
              pinned: true,
              title: _buildSearchBar(context),
              centerTitle: true,
              titleSpacing: 0.0,
              bottom: TabBar(
                controller: _tabController,
                isScrollable: true,
                splashBorderRadius: BorderRadius.circular(35.0),
                tabs:
                    services.map((service) => Tab(text: service.name)).toList(),
              ),
            )
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children:
              services.map((service) => TabView(service: service)).toList(),
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
      child: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius:
                  BorderRadius.circular(30.0), // Đặt giá trị lớn để bo tròn hơn
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.search, color: Colors.grey),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Search...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, color: Colors.grey),
                  onSelected: (String value) {
                    if (value == 'clear_history') {
                      // Xử lý xóa lịch sử
                    } else if (value == 'settings') {
                      // Xử lý mở cài đặt
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'clear_history',
                      child: Text("Clear History"),
                    ),
                    const PopupMenuItem<String>(
                      value: 'settings',
                      child: Text("Settings"),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
