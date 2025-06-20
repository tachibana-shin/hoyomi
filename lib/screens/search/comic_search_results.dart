import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/comic/main.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/router/extensions/to_router.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:kaeru/kaeru.dart';

class ComicSearchResults extends StatefulWidget {
  final String keyword;

  const ComicSearchResults({super.key, required this.keyword});

  @override
  State<ComicSearchResults> createState() => _ComicSearchResultsState();
}

class _ComicSearchResultsState extends State<ComicSearchResults>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final Map<ABComicService, Widget> _itemsStore = {};

  Widget _itemBuilderCache(ABComicService service) {
    if (_itemsStore[service] != null) return _itemsStore[service]!;

    final searchResult = service.search(
      keyword: widget.keyword,
      page: 1,
      filters: {},
      quick: false,
    );
    final itemsFuture = searchResult.then(
      (data) =>
          data.items
              .map((item) => ComicExtend(comic: item, sourceId: service.uid))
              .toList(),
    );

    String subtitle = '';

    return _itemsStore[service] = StatefulBuilder(
      builder: (context, setState) {
        if (subtitle == '') {
          searchResult.then((data) {
            if (!mounted || !context.mounted) return;
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
            more: ToRoute(
              name: 'search_comic',
              pathParameters: {'sourceId': service.uid},
              queryParameters: {'q': widget.keyword},
            ),
          ),
        );
      },
    );
  }

  Widget _buildWidgetMain() {
    return Watch(
      () => ListView.builder(
        itemCount: comicServices.value.length,
        itemBuilder: (context, index) {
          return _itemBuilderCache(comicServices.value.elementAt(index));
        },
      ),
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
        _itemsStore.clear();
        return false;
      },
      onLoadFake: () => true,
      builder: (loading, _) => _buildWidgetMain(),
    );
  }
}
