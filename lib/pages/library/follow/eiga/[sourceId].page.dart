import 'package:flutter/material.dart' hide TimeOfDay;
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/core_services/eiga/mixin/eiga_follow_mixin.dart';
import 'package:hoyomi/core_services/interfaces/follow_item.dart';
import 'package:hoyomi/core_services/interfaces/paginate.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/widgets/eiga/vertical_eiga.dart';
import 'package:hoyomi/widgets/infinite_grid.dart';
import 'package:hoyomi/widgets/pull_refresh_page.dart';
import 'package:hoyomi/widgets/vertical_list.dart';

class FollowsEigaPage extends StatefulWidget {
  final String sourceId;

  const FollowsEigaPage({super.key, required this.sourceId});

  @override
  State<FollowsEigaPage> createState() => _FollowsEigaPageState();
}

class _FollowsEigaPageState extends State<FollowsEigaPage> {
  int _pageKey = 2;
  late final EigaFollowMixin _service;

  @override
  void initState() {
    _service = getEigaService(widget.sourceId) as EigaFollowMixin;
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
    return PullRefreshPage<Paginate<FollowItem<Eiga>>>(
      onLoadData: () => _service.getFollows(page: 1),
      onLoadFake:
          () => Paginate.createFakeData(
            List.generate(
              30,
              (_) => FollowItem.createFakeData(Eiga.createFakeData()),
            ),
          ),
      builder:
          (data, param) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: InfiniteGrid(
              data: data.items,
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
                return VerticalEiga(
                  eiga: follow.item,
                  sourceId: widget.sourceId,
                );
              },
            ),
          ),
    );
  }
}
