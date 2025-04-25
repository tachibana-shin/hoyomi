import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/comic/ab_comic_service.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/widgets/comic/horizontal_comic_list.dart';
import 'package:hoyomi/widgets/pull_refresh_page.dart';
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

  Widget? _widgetMain;

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
            more: '/search/comic/${service.uid}?q=${widget.keyword}',
          ),
        );
      },
    );
  }

  void _buildWidgetMain() {
    _widgetMain = Watch(
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
        _buildWidgetMain();
        return false;
      },
      onLoadFake: () => true,
      builder: (loading, __) => _widgetMain!,
    );
  }
}
