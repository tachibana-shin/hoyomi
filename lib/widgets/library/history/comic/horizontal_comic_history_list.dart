import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_history.dart'
    as types;
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/router/extensions/to_router.dart';
import 'package:hoyomi/utils/format_watch_update_at.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HorizontalComicHistoryList extends StatefulWidget {
  final String sourceId;
  final ToRouter? more;
  final bool isGeneral;
  final Future<List<types.ComicHistory>> Function({required int page}) fn;

  const HorizontalComicHistoryList({
    super.key,
    required this.sourceId,
    this.more,
    required this.isGeneral,
    required this.fn,
  });

  @override
  createState() => _HorizontalComicHistoryState();
}

class _HorizontalComicHistoryState extends State<HorizontalComicHistoryList> {
  late final Future<List<types.ComicHistory>> _historyFuture;

  @override
  void initState() {
    _historyFuture = widget.fn(page: 1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _historyFuture,
      builder: (context, snapshot) {
        final title = 'History';
        final more =
            widget.more ??
            ToRouter(
              name: 'history_comic',
              pathParameters: {'sourceId': widget.sourceId},
            );

        if (snapshot.hasError) {
          return HorizontalList.buildContainer(
            context,
            title: title,
            subtitle: '',
            more: more,
            builder:
                (viewFraction) => Center(
                  child: Service.errorWidgetBuilder(
                    context,
                    error: snapshot.error,
                    trace: snapshot.stackTrace,
                    service: getService(widget.sourceId),
                    orElse: (error) => Text('Error: $error'),
                  ),
                ),
            titleLength: 1,
            itemSubtitle: false,
            itemTimeAgo: false,
          );
        }

        final loading = snapshot.connectionState == ConnectionState.waiting;
        if (!loading && (!snapshot.hasData || snapshot.data!.isEmpty)) {
          return HorizontalList.buildContainer(
            context,
            title: title,
            subtitle: '',
            more: more,
            builder: (viewFraction) => Center(child: Text('No data available')),
            titleLength: 1,
            itemSubtitle: false,
            itemTimeAgo: false,
          );
        }

        final data =
            loading
                ? List.generate(30, (_) => types.ComicHistory.createFakeData())
                : snapshot.data!;

        final subtitle =
            data.isEmpty
                ? ''
                : formatWatchUpdatedAt(data.first.watchUpdatedAt, null);
        final items = data;
        final needSubtitle =
            data.firstWhereOrNull(
              (comic) => comic.lastChapter.fullName?.isNotEmpty == true,
            ) !=
            null;

        return Skeletonizer(
          enabled: loading,
          enableSwitchAnimation: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HorizontalList.buildContainer(
                context,
                title: title,
                titleLength: items
                    .map((item) => item.item.name.length)
                    .reduce((max, length) => length > max ? length : max),
                subtitle: subtitle,
                more: more,
                itemSubtitle: needSubtitle,
                itemTimeAgo: widget.isGeneral,
                builder:
                    (viewportFraction) => PageView.builder(
                      itemCount: items.length,
                      allowImplicitScrolling: true,
                      padEnds: false,
                      controller: PageController(
                        viewportFraction: viewportFraction,
                        initialPage: 0,
                      ),
                      itemBuilder:
                          (context, index) => ComicHistory(
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
