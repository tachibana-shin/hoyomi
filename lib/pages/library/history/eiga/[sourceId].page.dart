import 'package:flutter/material.dart' hide TimeOfDay;
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/core_services/eiga/mixin/eiga_history_mixin.dart';
import 'package:hoyomi/core_services/interfaces/history_item.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/widgets/eiga/vertical_eiga.dart';
import 'package:hoyomi/widgets/infinite_list.dart';
import 'package:hoyomi/widgets/pull_refresh_page.dart';

class HistoryEigaPage extends StatefulWidget {
  final String sourceId;

  const HistoryEigaPage({
    super.key,
    required this.sourceId,
  });

  @override
  State<HistoryEigaPage> createState() => _HistoryEigaPageState();
}

class _HistoryEigaPageState extends State<HistoryEigaPage> {
  int _pageKey = 1;
  late final EigaHistoryMixin _service;

  @override
  void initState() {
    _service = getEigaService(widget.sourceId) as EigaHistoryMixin;
    super.initState();
  }

  @override
  Widget build(context) {
    return PullRefreshPage(
        onLoadData: () => _service.getWatchHistory(page: 1),
        onLoadFake: () => List.generate(
            30, (_) => HistoryItem.createFakeData(Eiga.createFakeData())),
        builder: (data, _) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: InfiniteList(
                data: data,
                fetchData: () async {
                  final result = await _service.getWatchHistory(page: _pageKey);
                  _pageKey++;

                  final isLastPage = result.isEmpty;

                  return (isLastPage, result);
                },
                itemBuilder: (context, history, index) {
                  return VerticalEiga(
                    eiga: history.item,
                    sourceId: widget.sourceId,
                  );
                })));
  }
}
