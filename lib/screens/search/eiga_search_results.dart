import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/ab_eiga_service.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/widgets/eiga/horizontal_eiga_list.dart';
import 'package:hoyomi/widgets/pull_refresh_page.dart';
import 'package:kaeru/kaeru.dart';

class EigaSearchResults extends StatefulWidget {
  final String keyword;

  const EigaSearchResults({super.key, required this.keyword});

  @override
  State<EigaSearchResults> createState() => _EigaSearchResultsState();
}

class _EigaSearchResultsState extends State<EigaSearchResults>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final Map<ABEigaService, Widget> _itemsStore = {};

  Widget _itemBuilderCache(ABEigaService service) {
    if (_itemsStore[service] != null) return _itemsStore[service]!;

    final searchResult = service.search(
      keyword: widget.keyword,
      page: 1,
      filters: {},
      quick: false,
    );
    final itemsFuture = searchResult.then(
      (data) => data.items
          .map((item) => EigaExtend(eiga: item, sourceId: service.uid))
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
          child: HorizontalEigaList(
            itemsFuture: itemsFuture,
            title: service.name,
            subtitle: subtitle,
            more: '/search/eiga/${service.uid}?q=${widget.keyword}',
          ),
        );
      },
    );
  }

  Widget _buildWidgetMain() {
    return Watch(() {
      _itemsStore.clear();

      return ListView.builder(
        itemCount: eigaServices.value.length,
        itemBuilder: (context, index) {
          return _itemBuilderCache(eigaServices.value.elementAt(index));
        },
      );
    });
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
      builder: (loading, __) => _buildWidgetMain(),
    );
  }
}
