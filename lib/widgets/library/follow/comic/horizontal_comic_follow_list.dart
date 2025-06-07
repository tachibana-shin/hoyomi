import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoyomi/core_services/comic/main.dart' as types;
import 'package:hoyomi/core_services/comic/main.dart' hide ComicFollow;
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/router/extensions/to_router.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HorizontalComicFollowList extends StatefulWidget {
  final String sourceId;
  final ToRoute? more;
  final bool isGeneral;
  final Future<Paginate<types.ComicFollow>> Function({required int page}) fn;

  const HorizontalComicFollowList({
    super.key,
    required this.sourceId,
    this.more,
    required this.isGeneral,
    required this.fn,
  });

  @override
  createState() => _HorizontalComicHistoryState();
}

class _HorizontalComicHistoryState extends State<HorizontalComicFollowList> {
  late final ComicFollowMixin _service;
  late final Future<List<types.ComicFollow>> _followsFuture;

  @override
  void initState() {
    _service = getComicService(widget.sourceId);
    _followsFuture = widget.fn(page: 1).then((data) => data.items);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _followsFuture,
      builder: (context, snapshot) {
        final title = 'Follow';
        final subtitle = null;
        final more =
            widget.more ??
            ToRoute(
              name: 'follow_comic',
              pathParameters: {'sourceId': widget.sourceId},
            );

        if (snapshot.hasError) {
          return HorizontalList.buildContainer(
            context,
            title: title,
            subtitle: subtitle,
            more: more,
            builder:
                (viewFraction) => Center(
                  child: Service.errorWidgetBuilder(
                    context,
                    error: snapshot.error,
                    trace: snapshot.stackTrace,
                    service: _service as Service,
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
            subtitle: subtitle,
            more: more,
            builder: (viewFraction) => Center(child: Text('No data available')),
            titleLength: 1,
            itemSubtitle: false,
            itemTimeAgo: false,
          );
        }

        final data =
            loading
                ? List.generate(30, (_) => types.ComicFollow.createFakeData())
                : snapshot.data!;

        final items = data;
        final needSubtitle =
            data.firstWhereOrNull(
              (comic) => comic.lastChapter?.fullName?.isNotEmpty == true,
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
                          (context, index) => ComicFollow(
                            sourceId: items.elementAt(index).sourceId,
                            follow: items.elementAt(index),
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
