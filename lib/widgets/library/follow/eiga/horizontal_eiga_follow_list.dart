import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/core_services/eiga/mixin/eiga_follow_mixin.dart';
import 'package:hoyomi/core_services/interfaces/follow_item.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/utils/format_watch_update_at.dart';
import 'package:hoyomi/widgets/eiga/vertical_eiga.dart';
import 'package:hoyomi/widgets/horizontal_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HorizontalEigaFollowList extends StatefulWidget {
  final String sourceId;

  const HorizontalEigaFollowList({super.key, required this.sourceId});

  @override
  createState() => _HorizontalEigaHistoryState();
}

class _HorizontalEigaHistoryState extends State<HorizontalEigaFollowList> {
  late final EigaFollowMixin _service;
  late final Future<List<FollowItem<Eiga>>> _followsFuture;

  @override
  void initState() {
    _service = getEigaService(widget.sourceId) as EigaFollowMixin;
    _followsFuture = _service.getFollows(page: 1).then((data) => data.items);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _followsFuture,
      builder: (context, snapshot) {
        final title = 'Follow';
        final subtitle = null;
        final more = '/library/follow/eiga/${widget.sourceId}';

        if (snapshot.hasError) {
          return HorizontalList.buildContainer(
            context,
            title: title,
            subtitle: subtitle,
            more: more,
            builder: (viewFraction) => Center(
              child: Service.errorWidgetBuilder(
                context,
                error: snapshot.error,
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

        final data = loading
            ? List.generate(
                30,
                (_) => FollowItem.createFakeData(Eiga.createFakeData()),
              )
            : snapshot.data!;

        return Skeletonizer(
          enabled: loading,
          enableSwitchAnimation: true,
          child: HorizontalList<FollowItem<Eiga>>(
            title: title,
            subtitle: data.firstOrNull?.updatedAt == null
                ? ''
                : formatWatchUpdatedAt(data.first.updatedAt!, null),
            more: more,
            items: data,
            titleLength: data
                .map((eiga) => eiga.item.name.length)
                .reduce((max, length) => length > max ? length : max),
            itemSubtitle: data.firstWhereOrNull(
                  (eiga) => VerticalEiga.existsSubtitle(eiga.item),
                ) !=
                null,
            itemTimeAgo: data.firstWhereOrNull(
                  (eiga) => VerticalEiga.existsTimeAgo(eiga.item),
                ) !=
                null,
            builder: (context, follow, index) {
              return VerticalEiga(sourceId: widget.sourceId, eiga: follow.item);
            },
          ),
        );
      },
    );
  }
}
