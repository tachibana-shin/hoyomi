import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/core_services/eiga/mixin/eiga_history_mixin.dart';
import 'package:hoyomi/core_services/interfaces/history_item.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:hoyomi/utils/format_watch_update_at.dart';
import 'package:hoyomi/widgets/library/history/eiga/eiga_history.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';

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

  Widget _buildContainer(BuildContext context,
      {required bool needSubtitle,
      required Widget Function(double viewFraction) builder}) {
    return LayoutBuilder(builder: (context, constraints) {
      double screenWidth = constraints.biggest.width;
      double crossAxisCount;

      if (screenWidth <= 600) {
        crossAxisCount = 2.5;
      } else if (screenWidth <= 900) {
        crossAxisCount = 3.5;
      } else {
        crossAxisCount = 5.5;
      }

      final childAspectRatio = 16 / 9;
      final viewportFraction = 1 / crossAxisCount;
      final height =
          1 / childAspectRatio * (screenWidth * viewportFraction - 8.0) +
              3.0 +
              14.0 * 2 +
              12.0 * 2 +
              2.0 +
              5.0 +
              (needSubtitle ? 11.0 * 2 : 0);

      return SizedBox(height: height, child: builder(viewportFraction));
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _historyFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return _buildContainer(
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

          final title = 'History';
          final subtitle = data.isEmpty
              ? ''
              : formatWatchUpdatedAt(data.first.watchUpdatedAt, null);
          final more = '/library/history/eiga/${widget.sourceId}';
          final items = data;
          final needSubtitle = data.firstWhereOrNull(
                  (eiga) => eiga.lastEpisode.description?.isNotEmpty == true) !=
              null;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ]),
                ElevatedButton(
                    onPressed: () {
                      context.push(more);
                    },
                    child: Text('More'))
              ]),
              _buildContainer(
                context,
                needSubtitle: needSubtitle,
                builder: (viewportFraction) => PageView.builder(
                    itemCount: items.length,
                    allowImplicitScrolling: true,
                    padEnds: false,
                    controller: PageController(
                      viewportFraction: viewportFraction,
                      initialPage: 0,
                    ),
                    itemBuilder: (context, index) => EigaHistory(
                          sourceId: widget.sourceId,
                          history: items.elementAt(index),
                          width: 100.w(context) / 1 / viewportFraction,
                          direction: Axis.vertical,
                        )),
              )
            ],
          );
        });
  }
}
