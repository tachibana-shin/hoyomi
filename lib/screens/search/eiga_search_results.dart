import 'package:flutter/material.dart';
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
      onLoadData: () async => false,
      onLoadFake: () => true,
      builder:
          (loading, __) =>
              loading
                  ? SizedBox.shrink()
                  : ListView.builder(
                    itemCount: eigaServices.length,
                    itemBuilder: (context, index) {
                      final service = eigaServices.elementAt(index);

                      final searchResult = service.search(
                        keyword: widget.keyword,
                        page: 1,
                        filters: {},
                      );
                      final itemsFuture = searchResult.then(
                        (data) =>
                            data.items
                                .map(
                                  (item) => EigaExtend(
                                    eiga: item,
                                    sourceId: service.uid,
                                  ),
                                )
                                .toList(),
                      );

                      String subtitle = '';

                      return StatefulBuilder(
                        builder: (context, setState) {
                          if (subtitle == '') {
                            searchResult.then((data) {
                              setState(() {
                                subtitle = '${data.totalItems} results';
                              });
                            });
                          }

                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: HorizontalEigaList(
                              itemsFuture: itemsFuture,
                              title: service.name,
                              subtitle: subtitle,
                              more:
                                  '/search/eiga/${service.uid}?q=${widget.keyword}',
                            ),
                          );
                        },
                      );
                    },
                  ),
    );
  }
}
