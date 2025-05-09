import 'package:flutter/material.dart' hide TimeOfDay;
import 'package:hoyomi/core_services/comic/main.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/widgets/export.dart';

class FollowsComicPage extends StatefulWidget {
  final String sourceId;

  const FollowsComicPage({super.key, required this.sourceId});

  @override
  State<FollowsComicPage> createState() => _FollowsComicPageState();
}

class _FollowsComicPageState extends State<FollowsComicPage> {
  int _pageKey = 2;
  late final ComicFollowMixin _service;

  @override
  void initState() {
    _service = getComicService(widget.sourceId) as ComicFollowMixin;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Follows ${(_service as Service).name}'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        scrolledUnderElevation: 0.0,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return PullRefreshPage<Paginate<FollowItem<Comic>>>(
      onLoadData: () => _service.getFollows(page: 1),
      onLoadFake:
          () => Paginate.createFakeData(
            List.generate(
              30,
              (_) => FollowItem.createFakeData(Comic.createFakeData()),
            ),
          ),
      builder:
          (data, param) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: InfiniteGrid(
              data: data.items,
              hasReachedMax: data.page >= data.totalPages,
              crossAxisCount: VerticalList.getCrossAxisCount(context),
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              fetchData: () async {
                final result = await _service.getFollows(page: _pageKey);
                _pageKey++;

                final isLastPage = result.page >= result.totalPages;
                return (isLastPage: isLastPage, data: result.items);
              },
              itemBuilder: (context, follow, index) {
                return VerticalComic(
                  comic: follow.item,
                  sourceId: follow.sourceId,
                );
              },
            ),
          ),
    );
  }
}
