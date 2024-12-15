import 'package:flutter/material.dart';
import 'package:honyomi/core_services/main.dart';
import 'package:honyomi/screens/rss/news_feed.dart';
import 'package:honyomi/widgets/search_bar.dart';

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

class _SearchState extends State<Search> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  Widget? _overlayQuickSearch;

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
        ),
        body: Stack(children: [
          widget.keyword.trim().isNotEmpty
              ? _buildBodySearch(context)
              : _buildBodyGetStarting(context),
          ...(_overlayQuickSearch != null ? [_overlayQuickSearch!] : [])
        ]));
  }

  Widget _buildBodySearch(BuildContext context) {
    return QuickSearchScreen(
      keyword: widget.keyword,
    );
  }

  Widget _buildBodyGetStarting(BuildContext context) {
    return NewsFeedScreen(
      services: services,
    );
  }
}
