import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/core_services/interfaces/paginate.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/widgets/eiga/horizontal_eiga_list.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class EigaSearchResults extends StatefulWidget {
  final String keyword;
  final Function()? onDismissed;

  const EigaSearchResults({super.key, this.onDismissed, required this.keyword});

  @override
  State<EigaSearchResults> createState() => _EigaSearchResultsState();
}

class _EigaSearchResultsState extends State<EigaSearchResults>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final RefreshController _refreshController = RefreshController();
  final Map<String, Future<Paginate<Eiga>>> _searchFutures = {};

  @override
  void initState() {
    super.initState();
    _fetchSearchResults();
  }

  void _fetchSearchResults() {
    // Trigger search for each service
    for (var service in eigaServices) {
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
        children: eigaServices.map((service) {
          final searchResult = _searchFutures[service.uid]!;
          final itemsFuture = searchResult.then((data) => data.items
              .map((item) => EigaExtend(eiga: item, sourceId: service.uid))
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

            return HorizontalEigaList(
              itemsFuture: itemsFuture,
              title: service.name,
              subtitle: subtitle,
              more: '/search/eiga/${service.uid}?q=${widget.keyword}',
            );
          });
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
