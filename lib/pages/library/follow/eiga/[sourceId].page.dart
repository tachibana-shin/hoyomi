import 'package:flutter/material.dart' hide TimeOfDay;
import 'package:hoyomi/core_services/eiga/main.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/widgets/export.dart';

class FollowsEigaPage extends StatefulWidget {
  final String sourceId;

  const FollowsEigaPage({super.key, required this.sourceId});

  @override
  State<FollowsEigaPage> createState() => _FollowsEigaPageState();
}

class _FollowsEigaPageState extends State<FollowsEigaPage> {
  int _pageKey = 2;
  late final EigaFollowMixin? _service;

  @override
  void initState() {
    _service =
        widget.sourceId == 'general'
            ? null
            : getEigaService(widget.sourceId) as EigaFollowMixin;
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

  Future<Paginate<EigaFollow>> _getData(int page) {
    return _service == null
        ? EigaFollowGeneralMixin.getAllListFollow(page: 1)
        : _service.getFollows(page: 1);
  }

  Widget _buildBody() {
    return PullRefreshPage<Paginate<EigaFollow>>(
      onLoadData: () => _getData(1),
      onLoadFake: () => Paginate.createFakeData(EigaFollow.createFakeData()),
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
            return VerticalEiga(eiga: follow.item, sourceId: follow.sourceId);
          },
        ),
      ),
    );
  }
}
