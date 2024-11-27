import 'package:flutter/material.dart';
import 'package:honyomi/widgets/search_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Search(),
    );
  }
}

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  Widget? _overlayQuickSearch;

  @override
  Widget build(BuildContext context) {
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
                  title: CustomSearchBar(onOverlayChange: (overlay) {
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
              Text("ok"),
              ...(_overlayQuickSearch != null ? [_overlayQuickSearch!] : [])
            ])));
  }
}
