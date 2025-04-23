import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/screens/rss/news_feed.dart';
import 'package:hoyomi/screens/search/comic_search_results.dart';
import 'package:hoyomi/screens/search/eiga_search_results.dart';
import 'package:hoyomi/widgets/global_search_bar.dart';
import 'package:kaeru/kaeru.dart';

class SearchPage extends StatefulWidget {
  final String keyword;
  final String? from;

  const SearchPage({super.key, required this.keyword, required this.from});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: widget.from == 'eiga' ? 1 : 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        scrolledUnderElevation: 0.0,
        title: GlobalSearchBar(keyword: widget.keyword, pageIsSearch: true),
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          splashBorderRadius: BorderRadius.circular(35.0),
          tabs: [Tab(text: 'Comic'), Tab(text: 'Eiga')],
        ),
      ),
      body: Stack(
        children: [
          if (widget.keyword.trim().isNotEmpty)
            _buildBodySearch(context)
          else
            _buildBodyGetStarting(context)
        ],
      ),
    );
  }

  Widget _buildBodySearch(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0,
      ).copyWith(bottom: 0),
      child: TabBarView(
        controller: _tabController,
        children: [
          ComicSearchResults(keyword: widget.keyword),
          EigaSearchResults(keyword: widget.keyword),
        ],
      ),
    );
  }

  Widget _buildBodyGetStarting(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0,
      ).copyWith(bottom: 0),
      child: TabBarView(
        controller: _tabController,
        children: [
          Watch(() => NewsFeedScreen(services: comicServices.value)),
          Watch(() => NewsFeedScreen(services: eigaServices.value)),
        ],
      ),
    );
  }
}
