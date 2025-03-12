import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/core_services/eiga/mixin/eiga_history_mixin.dart';
import 'package:hoyomi/core_services/interfaces/history_item.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/utils/format_watch_update_at.dart';
import 'package:hoyomi/widgets/library/history/eiga/eiga_history.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HorizontalEigaHistoryList extends StatefulWidget {
  final String sourceId;

  const HorizontalEigaHistoryList({super.key, required this.sourceId});

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

  Widget _buildContainer(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String more,
    required bool needSubtitle,
    required Widget Function(double viewFraction) builder,
  }) {
    final header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
          ],
        ),
        ElevatedButton(
          onPressed: () {
            context.push(more);
          },
          child: Text('More'),
        ),
      ],
    );
    final main = LayoutBuilder(
      builder: (context, constraints) {
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
      },
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [header, main],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _historyFuture,
      builder: (context, snapshot) {
        final title = 'History';
        final more = '/library/history/eiga/${widget.sourceId}';

        if (snapshot.hasError) {
          return _buildContainer(
            context,
            title: title,
            subtitle: '',
            more: more,
            builder: (viewFraction) => Center(
              child: Service.errorWidgetBuilder(
                context,
                error: snapshot.error,
                service: _service as Service,
                orElse: (error) => Text('Error: $error'),
              ),
            ),
            needSubtitle: false,
          );
        }

        final loading = snapshot.connectionState == ConnectionState.waiting;
        final data = loading
            ? List.generate(
                30,
                (_) => HistoryItem.createFakeData(Eiga.createFakeData()),
              )
            : snapshot.data!;

        final subtitle = data.isEmpty
            ? ''
            : formatWatchUpdatedAt(data.first.watchUpdatedAt, null);
        final items = data;
        final needSubtitle = data.firstWhereOrNull(
              (eiga) => eiga.lastEpisode.description?.isNotEmpty == true,
            ) !=
            null;

        return Skeletonizer(
          enabled: loading,
          enableSwitchAnimation: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildContainer(
                context,
                title: title,
                subtitle: subtitle,
                more: more,
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
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
