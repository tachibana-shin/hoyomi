import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic.dart';
import 'package:hoyomi/core_services/interfaces/paginate.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/widgets/comic/horizontal_comic_list.dart';
import 'package:hoyomi/widgets/pull_refresh_page.dart';

class ComicSearchResults extends StatefulWidget {
  final String keyword;
  final Function()? onDismissed;

  const ComicSearchResults(
      {super.key, this.onDismissed, required this.keyword});

  @override
  State<ComicSearchResults> createState() => _ComicSearchResultsState();
}

class _ComicSearchResultsState extends State<ComicSearchResults>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final Map<String, Future<Paginate<Comic>>> _searchFutures = {};

  Future<void> _fetchSearchResults() async {
    // Trigger search for each service
    for (var service in comicServices) {
      _searchFutures[service.uid] =
          service.search(keyword: widget.keyword, page: 1, filters: {});
    }
    await Future.wait(_searchFutures.values);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.keyword.isEmpty) {
      return const Center(
        child: Text(
          'Please enter a keyword to search.',
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return PullRefreshPage(
      onLoadData: _fetchSearchResults,
      onLoadFake: () => [],
      builder: (_, __) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: comicServices.map((service) {
          final searchResult = _searchFutures[service.uid]!;
          final itemsFuture = searchResult.then((data) => data.items
              .map((item) => ComicExtend(comic: item, sourceId: service.uid))
              .toList());
          String subtitle = '';

          return StatefulBuilder(builder: (context, setState) {
            if (subtitle == '') {
              searchResult.then((data) {
                setState(() {
                  subtitle = '${data.totalItems} results';
                });
              });
            }

            return HorizontalComicList(
              itemsFuture: itemsFuture,
              title: service.name,
              subtitle: subtitle,
              more: '/search/comic/${service.uid}?q=${widget.keyword}',
            );
          });
        }).toList(),
      ),
    );
  }
}
