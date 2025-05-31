import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoyomi/core_services/eiga/main.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/utils/export.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HorizontalEigaFollowList extends StatefulWidget {
  final String sourceId;
  final String? more;
  final Future<Paginate<EigaFollow>> Function({required int page}) fn;

  const HorizontalEigaFollowList({
    super.key,
    required this.sourceId,
    this.more,
    required this.fn,
  });

  @override
  createState() => _HorizontalEigaHistoryState();
}

class _HorizontalEigaHistoryState extends State<HorizontalEigaFollowList> {
  late final EigaFollowMixin _service;
  late final Future<List<EigaFollow>> _followsFuture;

  @override
  void initState() {
    _service = getEigaService(widget.sourceId) as EigaFollowMixin;
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
        final more = widget.more ?? '/library/follow/eiga/${widget.sourceId}';

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
                ? List.generate(30, (_) => EigaFollow.createFakeData())
                : snapshot.data!;

        return Skeletonizer(
          enabled: loading,
          enableSwitchAnimation: true,
          child: HorizontalList<EigaFollow>(
            title: title,
            subtitle: data.firstOrNull?.updatedAt == null
                ? ''
                : formatWatchUpdatedAt(data.first.updatedAt!, null),
            more: more,
            items: data,
            titleLength: data
                .map((eiga) => eiga.item.name.length)
                .reduce((max, length) => length > max ? length : max),
            itemSubtitle:
                data.firstWhereOrNull(
                  (eiga) => VerticalEiga.existsSubtitle(eiga.item),
                ) !=
                null,
            itemTimeAgo:
                data.firstWhereOrNull(
                  (eiga) => VerticalEiga.existsTimeAgo(eiga.item),
                ) !=
                null,
            builder: (context, follow, index) {
              return VerticalEiga(sourceId: follow.sourceId, eiga: follow.item);
            },
          ),
        );
      },
    );
  }
}
