import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoyomi/core_services/comic/main.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/utils/export.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HorizontalComicFollowList extends StatefulWidget {
  final String sourceId;
  final String? more;
  final Future<Paginate<ComicFollow>> Function({required int page}) fn;

  const HorizontalComicFollowList({
    super.key,
    required this.sourceId,
    this.more,
    required this.fn,
  });

  @override
  createState() => _HorizontalComicHistoryState();
}

class _HorizontalComicHistoryState extends State<HorizontalComicFollowList> {
  late final ComicFollowMixin _service;
  late final Future<List<ComicFollow>> _followsFuture;

  @override
  void initState() {
    _service = getComicService(widget.sourceId) as ComicFollowMixin;
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
        final more = widget.more ?? '/library/follow/comic/${widget.sourceId}';

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
                ? List.generate(30, (_) => ComicFollow.createFakeData())
                : snapshot.data!;

        return Skeletonizer(
          enabled: loading,
          enableSwitchAnimation: true,
          child: HorizontalList<ComicFollow>(
            title: title,
            subtitle:
                data.firstOrNull?.updatedAt == null
                    ? ''
                    : formatWatchUpdatedAt(data.first.updatedAt!, null),
            more: more,
            items: data,
            titleLength: data
                .map((comic) => comic.item.name.length)
                .reduce((max, length) => length > max ? length : max),
            itemSubtitle:
                data.firstWhereOrNull(
                  (comic) => VerticalComic.existsSubtitle(comic.item),
                ) !=
                null,
            itemTimeAgo:
                data.firstWhereOrNull(
                  (comic) => VerticalComic.existsTimeAgo(comic.item),
                ) !=
                null,
            builder: (context, follow, index) {
              return VerticalComic(sourceId: follow.sourceId, comic: follow.item);
            },
          ),
        );
      },
    );
  }
}
