import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/core_services/eiga/mixin/eiga_follow_mixin.dart';
import 'package:hoyomi/core_services/interfaces/follow_item.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:hoyomi/utils/format_watch_update_at.dart';
import 'package:hoyomi/widgets/eiga/vertical_eiga.dart';
import 'package:hoyomi/widgets/horizontal_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HorizontalEigaFollowList extends StatefulWidget {
  final String sourceId;

  const HorizontalEigaFollowList({
    super.key,
    required this.sourceId,
  });

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

          final loading = snapshot.connectionState == ConnectionState.waiting;
          final data = loading
              ? List.generate(
                  30, (_) => FollowItem.createFakeData(Eiga.createFakeData()))
              : snapshot.data!;

          return Skeletonizer(
              enabled: loading,
              enableSwitchAnimation: true,
              child: HorizontalList<FollowItem<Eiga>>(
                title: 'Follow',
                subtitle: data.firstOrNull?.updatedAt == null
                    ? ''
                    : formatWatchUpdatedAt(data.first.updatedAt!, null),
                more: '/library/follow/eiga/${widget.sourceId}',
                items: data,
                needSubtitle: data.firstWhereOrNull(
                        (eiga) => VerticalEiga.checkNeedSubtitle(eiga.item)) !=
                    null,
                builder: (context, follow, index) {
                  return VerticalEiga(
                      sourceId: widget.sourceId, eiga: follow.item);
                },
              ));
        });
  }
}
