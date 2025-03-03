import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/widgets/comic/horizontal_comic_list.dart';
import 'package:hoyomi/widgets/pull_refresh_page.dart';

class ComicSearchResults extends StatefulWidget {
  final String keyword;
  final Function()? onDismissed;

  const ComicSearchResults({
    super.key,
    this.onDismissed,
    required this.keyword,
  });

  @override
  State<ComicSearchResults> createState() => _ComicSearchResultsState();
}

class _ComicSearchResultsState extends State<ComicSearchResults>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  Widget? _widgetMain;

  void _buildWidgetMain() {
    _widgetMain = ListView.builder(
      itemCount: comicServices.length,
      itemBuilder: (context, index) {
        final service = comicServices.elementAt(index);

        final searchResult = service.search(
          keyword: widget.keyword,
          page: 1,
          filters: {},
        );
        final itemsFuture = searchResult.then(
          (data) => data.items
              .map(
                (item) => ComicExtend(
                  comic: item,
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
              child: HorizontalComicList(
                itemsFuture: itemsFuture,
                title: service.name,
                subtitle: subtitle,
                more: '/search/comic/${service.uid}?q=${widget.keyword}',
              ),
            );
          },
        );
      },
    );
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
      onLoadData: () async {
        _buildWidgetMain();
        return false;
      },
      onLoadFake: () => true,
      builder: (loading, __) => _widgetMain!,
    );
  }
}
