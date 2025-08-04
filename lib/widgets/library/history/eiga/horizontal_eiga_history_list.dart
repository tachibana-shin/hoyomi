import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/eiga/mixin/eiga_watch_time_mixin.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_history.dart'
    as types;
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/utils/format_watch_update_at.dart';
import 'package:hoyomi/widgets/library/history/eiga/eiga_history.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HorizontalEigaHistoryList extends StatefulWidget {
  final String sourceId;
  final String? more;
  final Future<List<types.EigaHistory>> Function({required int page}) fn;
  final bool isGeneral;

  const HorizontalEigaHistoryList({
    super.key,
    required this.sourceId,
    this.more,
    required this.fn,
    required this.isGeneral,
  });

  @override
  createState() => _HorizontalEigaHistoryState();
}

class _HorizontalEigaHistoryState extends State<HorizontalEigaHistoryList> {
  late final EigaWatchTimeMixin _service;
  late final Future<List<types.EigaHistory>> _historyFuture;

  @override
  void initState() {
    _service = getEigaService(widget.sourceId) as EigaWatchTimeMixin;
    _historyFuture = widget.fn(page: 1);

    super.initState();
  }

  Widget _buildContainer(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String more,
    required bool needSubtitle,
    required bool needTimeAgo,
    required Widget Function(double viewFraction) builder,
  }) {
    final header = ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(
          // fontSize: 18.0,
          // fontWeight: FontWeight.w600,
          // color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: subtitle.isNotEmpty
          ? Text(
              subtitle,
              style: TextStyle(fontSize: 14, color: Colors.white70),
            )
          : null,
      trailing: ElevatedButton(
        onPressed: () {
          context.push(more);
        },
        child: Text('More'),
      ),
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
            (needSubtitle ? 11.0 * 2 : 0) +
            (needTimeAgo ? 11.0 * 2 : 0);

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
        final more = widget.more ?? '/library/history/eiga/${widget.sourceId}';

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
                trace: snapshot.stackTrace,
                service: _service as Service,
                orElse: (error) => Text('Error: $error'),
              ),
            ),
            needSubtitle: false,
            needTimeAgo: false,
          );
        }

        final loading = snapshot.connectionState == ConnectionState.waiting;
        if (!loading && (!snapshot.hasData || snapshot.data!.isEmpty)) {
          return _buildContainer(
            context,
            title: title,
            subtitle: '',
            more: more,
            builder: (viewFraction) => Center(child: Text('No data available')),
            needSubtitle: false,
            needTimeAgo: false,
          );
        }

        final data = loading
            ? List.generate(30, (_) => types.EigaHistory.createFakeData())
            : snapshot.data!;

        final subtitle = data.isEmpty
            ? ''
            : formatWatchUpdatedAt(data.first.watchUpdatedAt, null);
        final items = data;
        final needSubtitle =
            data.firstWhereOrNull(
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
                needTimeAgo: widget.isGeneral,
                builder: (viewportFraction) => PageView.builder(
                  itemCount: items.length,
                  allowImplicitScrolling: true,
                  padEnds: false,
                  controller: PageController(
                    viewportFraction: viewportFraction,
                    initialPage: 0,
                  ),
                  itemBuilder: (context, index) => EigaHistory(
                    sourceId: items.elementAt(index).sourceId,
                    history: items.elementAt(index),
                    width: 100.w(context) / 1 / viewportFraction,
                    direction: Axis.vertical,
                    showService: widget.isGeneral,
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
