import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/screens/rss/news_feed.dart';
import 'package:hoyomi/screens/search/comic_search_results.dart';
import 'package:hoyomi/screens/search/eiga_search_results.dart';
import 'package:hoyomi/widgets/search_bar.dart';

class SearchPage extends StatelessWidget {
  final String keyword;

  const SearchPage({super.key, required this.keyword});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Search(keyword: keyword),
    );
  }
}

class Search extends StatefulWidget {
  final String keyword;

  const Search({super.key, required this.keyword});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  late TabController _tabController;

  Widget? _overlayQuickSearch;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
          title: CustomSearchBar(
              keyword: widget.keyword,
              backMode: widget.keyword.isNotEmpty,
              onOverlayChange: (overlay) {
                setState(() {
                  _overlayQuickSearch = overlay;
                });
              }),
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
        body: Stack(children: [
          widget.keyword.trim().isNotEmpty
              ? _buildBodySearch(context)
              : _buildBodyGetStarting(context),
          ...(_overlayQuickSearch != null ? [_overlayQuickSearch!] : [])
        ]));
  }

  Widget _buildBodySearch(BuildContext context) {
    return TabBarView(controller: _tabController, children: [
      ComicSearchResults(
        keyword: widget.keyword,
      ),
      EigaSearchResults(keyword: widget.keyword)
    ]);
  }

  Widget _buildBodyGetStarting(BuildContext context) {
    return NewsFeedScreen(
      services: bookServices,
    );
  }
}
