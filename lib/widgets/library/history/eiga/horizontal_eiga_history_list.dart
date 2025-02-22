import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/core_services/eiga/mixin/eiga_history_mixin.dart';
import 'package:hoyomi/core_services/interfaces/history_item.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:hoyomi/utils/format_watch_update_at.dart';
import 'package:hoyomi/widgets/eiga/vertical_eiga.dart';
import 'package:hoyomi/widgets/horizontal_list.dart';
import 'package:hoyomi/widgets/library/history/eiga/horizontal_eiga_history.dart';

class HorizontalEigaHistoryList extends StatefulWidget {
  final String sourceId;

  const HorizontalEigaHistoryList({
    super.key,
    required this.sourceId,
  });

  @override
  createState() => _HorizontalEigaHistoryState();
}

class _HorizontalEigaHistoryState extends State<HorizontalEigaHistoryList> {
  late final EigaHistoryMixin _service;
  late final Future<List<HistoryItem<Eiga>>> _historyFuture;

  @override
  void initState() {
    _service = getEigaService(widget.sourceId) as EigaHistoryMixin;
    _historyFuture = _service.getWatchHistory(page: 1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _historyFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return HorizontalList.buildContainer(
              context,
              builder: (viewFraction) => Center(
                  child: UtilsService.errorWidgetBuilder(context,
                      error: snapshot.error,
                      orElse: (error) => Text('Error: $error'))),
              needSubtitle: false,
            );
          }

          final data = snapshot.connectionState == ConnectionState.waiting
              ? List.generate(
                  30, (_) => HistoryItem.createFakeData(Eiga.createFakeData()))
              : snapshot.data!;

          return HorizontalList<HistoryItem<Eiga>>(
            title: 'History',
            subtitle: data.isEmpty
                ? ''
                : formatWatchUpdatedAt(data.first.watchUpdatedAt, null),
            more: '/library/history/eiga/${widget.sourceId}',
            items: data,
            needSubtitle: data.firstWhereOrNull(
                    (eiga) => VerticalEiga.checkNeedSubtitle(eiga.item)) !=
                null,
            builder: (context, history, index) {
              return HorizontalEigaHistory(
                sourceId: widget.sourceId,
                history: history,
              );
            },
          );
        });
  }
}
