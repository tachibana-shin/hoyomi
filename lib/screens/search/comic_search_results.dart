import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/book/interfaces/basic_book.dart';
import 'package:hoyomi/core_services/interfaces/paginate.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/widgets/book/horizontal_book_list.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

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

  final RefreshController _refreshController = RefreshController();
  final Map<String, Future<Paginate<BasicBook>>> _searchFutures = {};

  @override
  void initState() {
    super.initState();
    _fetchSearchResults();
  }

  void _fetchSearchResults() {
    // Trigger search for each service
    for (var service in bookServices) {
      _searchFutures[service.uid] =
          service.search(keyword: widget.keyword, page: 1, filters: {});
    }
  }

  Future<void> _onRefresh() async {
    try {
      _fetchSearchResults();
      await Future.wait(_searchFutures.values);
      _refreshController.refreshCompleted();
      setState(() {});
    } catch (e) {
      debugPrint('Refresh error: $e');
      _refreshController.refreshFailed();
    }
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

    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      enablePullDown: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: bookServices.map((service) {
          final searchResult = _searchFutures[service.uid]!;
          return HorizontalBookList(
              itemsFuture: searchResult.then((data) => data.items
                  .map((item) =>
                      BasicBookExtend(book: item, sourceId: service.uid))
                  .toList()),
              totalItems: searchResult.then((data) => data.totalItems),
              title: service.name,
              more: '/search/comic/${service.uid}?q=${widget.keyword}',
              onTapChild: widget.onDismissed);
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
