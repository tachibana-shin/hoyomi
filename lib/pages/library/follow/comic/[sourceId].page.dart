import 'package:flutter/material.dart' hide TimeOfDay;
import 'package:hoyomi/core_services/comic/main.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/widgets/export.dart' hide ComicFollow;

class FollowsComicPage extends StatefulWidget {
  final String sourceId;

  const FollowsComicPage({super.key, required this.sourceId});

  @override
  State<FollowsComicPage> createState() => _FollowsComicPageState();
}

class _FollowsComicPageState extends State<FollowsComicPage> {
  int _pageKey = 2;
  late final ComicFollowMixin? _service;

  @override
  void initState() {
    _service =
        widget.sourceId == 'general'
            ? null
            : getComicService(widget.sourceId) as ComicFollowMixin;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Follows ${(_service as Service?)?.name ?? ''}'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        scrolledUnderElevation: 0.0,
      ),
      body: _buildBody(),
    );
  }

  Future<Paginate<ComicFollow>> _getData(int page) {
    return _service == null
        ? ComicFollowGeneralMixin.getAllListFollow(page: 1)
        : _service.getFollows(page: 1);
  }

  Widget _buildBody() {
    return PullRefreshPage<Paginate<ComicFollow>>(
      onLoadData: () => _getData(1),
      onLoadFake: () => Paginate.createFakeData(ComicFollow.createFakeData()),
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
                final result = await _getData(_pageKey);
                _pageKey++;

            final isLastPage = result.page >= result.totalPages;
            return (isLastPage: isLastPage, data: result.items);
          },
          itemBuilder: (context, follow, index) {
            return VerticalComic(comic: follow.item, sourceId: follow.sourceId);
          },
        ),
      ),
    );
  }
}
