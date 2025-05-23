import 'package:flutter/material.dart' hide TimeOfDay;
import 'package:hoyomi/core_services/eiga/main.dart' hide EigaHistory;
import 'package:hoyomi/core_services/eiga/interfaces/eiga_history.dart'
    as types;
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/utils/export.dart';
import 'package:hoyomi/widgets/export.dart';

class HistoryEigaPage extends StatefulWidget {
  final String sourceId;

  const HistoryEigaPage({super.key, required this.sourceId});

  @override
  State<HistoryEigaPage> createState() => _HistoryEigaPageState();
}

class _HistoryEigaPageState extends State<HistoryEigaPage> {
  int _pageKey = 2;
  late final EigaWatchTimeMixin? _service;

  @override
  void initState() {
    _service =
        widget.sourceId == 'general'
            ? null
            : getEigaService(widget.sourceId) as EigaWatchTimeMixin;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History ${_service != null ? (_service as Service).name : 'general'}',
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        scrolledUnderElevation: 0.0,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return PullRefreshPage(
      onLoadData:
          () =>
              _service == null
                  ? EigaWatchTimeGeneralMixin.getAllWatchHistory(page: 1)
                  : _service.getWatchHistory(page: 1),
      onLoadFake:
          () => List.generate(30, (_) => types.EigaHistory.createFakeData()),
      builder:
          (data, _) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: InfiniteList(
              data: data,
              fetchData: () async {
                final result =
                    await (_service == null
                        ? EigaWatchTimeGeneralMixin.getAllWatchHistory(
                          page: _pageKey,
                        )
                        : _service.getWatchHistory(page: _pageKey));
                _pageKey++;

                final isLastPage = result.isEmpty;

                return (done: isLastPage, data: result);
              },
              itemBuilder: (context, history, index, historyPrev) {
                final main = EigaHistory(
                  sourceId: history.sourceId,
                  history: history,
                  showService:
                      _service != null, // _service == null is page show general
                );

                if (history.watchUpdatedAt.day !=
                    historyPrev?.watchUpdatedAt.day) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 3.0),
                      Text(
                        formatWatchUpdatedAt(history.watchUpdatedAt, null),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      main,
                    ],
                  );
                }
                return main;
              },
            ),
          ),
    );
  }
}
