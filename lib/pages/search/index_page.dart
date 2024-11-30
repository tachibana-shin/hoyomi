import 'package:flutter/material.dart';
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
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  foregroundColor: Colors.transparent,
                  scrolledUnderElevation: 0.0,
                  floating: true,
                  snap: true,
                  pinned: true,
                  title: CustomSearchBar(
                      keyword: widget.keyword,
                      backMode: true,
                      onOverlayChange: (overlay) {
                        setState(() {
                          _overlayQuickSearch = overlay;
                        });
                      }),
                  centerTitle: true,
                  titleSpacing: 0.0,
                )
              ];
            },
            body: Stack(children: [
              widget.keyword.trim().isNotEmpty
                  ? _buildBodySearch(context)
                  : _buildBodyGetStarting(context),
              ...(_overlayQuickSearch != null ? [_overlayQuickSearch!] : [])
            ])));
  }

  Widget _buildBodySearch(BuildContext context) {
    return QuickSearchScreen(
      onDismissed: () {},
      keyword: widget.keyword,
    );
  }

  Widget _buildBodyGetStarting(BuildContext context) {
    return Scaffold();
  }
}
