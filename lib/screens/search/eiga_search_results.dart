import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/core_services/interfaces/paginate.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/widgets/eiga/horizontal_eiga_list.dart';
import 'package:hoyomi/widgets/pull_refresh_page.dart';

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

  final Map<String, Future<Paginate<Eiga>>> _searchFutures = {};

  Future<void> _fetchSearchResults() async {
    // Trigger search for each service
    for (var service in eigaServices) {
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
      onLoadFake: () => null,
      builder: (_) => Column(
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
}
