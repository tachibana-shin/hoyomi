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
    _followsFuture = _service.getFollows(page: 1);

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

          final data = snapshot.connectionState == ConnectionState.waiting
              ? List.generate(
                  30, (_) => FollowItem.createFakeData(Eiga.createFakeData()))
              : snapshot.data!;

          return HorizontalList<FollowItem<Eiga>>(
            title: 'History',
            subtitle: data.firstOrNull?.updatedAt == null
                ? ''
                : formatWatchUpdatedAt(data.first.updatedAt, null),
            more: '/library/history/eiga/${widget.sourceId}',
            items: data,
            needSubtitle: data.firstWhereOrNull(
                    (eiga) => VerticalEiga.checkNeedSubtitle(eiga.item)) !=
                null,
            builder: (context, follow, index) {
              return VerticalEiga(sourceId: widget.sourceId, eiga: follow.item);
            },
          );
        });
  }
}
