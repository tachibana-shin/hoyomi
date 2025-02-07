import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/eiga_base_service.dart';
import 'package:hoyomi/core_services/eiga/interfaces/base_eiga_home.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:hoyomi/stores.dart';
import 'package:hoyomi/widgets/eiga/carousel_eiga.dart';
import 'package:hoyomi/widgets/eiga/horizontal_eiga_list.dart';
import 'package:hoyomi/widgets/eiga/vertical_eiga_list.dart';
import 'package:hoyomi/widgets/pull_to_refresh.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TabViewEiga extends StatefulWidget {
  final EigaBaseService service;

  const TabViewEiga({super.key, required this.service});

  @override
  State<TabViewEiga> createState() => _TabViewEigaState();
}

class _TabViewEigaState extends State<TabViewEiga>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  late Future<BaseEigaHome> _data;

  @override
  void initState() {
    super.initState();
    _data = widget.service.home();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return FutureBuilder<BaseEigaHome>(
      future: _data,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: UtilsService.errorWidgetBuilder(context,
                  error: snapshot.error,
                  orElse: (error) => Text('Error: $error')));
        }
        // if (!snapshot.hasData) {
        //   return const Center(child: Text('No data available'));
        // }

        Widget builder(BaseEigaHome data) {
          return Skeletonizer(
              enabled: snapshot.connectionState == ConnectionState.waiting,
              enableSwitchAnimation: true,
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount:
                    data.sections.length + (data.carousel == null ? 0 : 1),
                itemBuilder: (context, sectionIndex) {
                  if (sectionIndex == 0 && data.carousel != null) {
                    return CarouselEiga(
                        aspectRatio: data.carousel!.aspectRatio,
                        sourceId: widget.service.uid,
                        items: data.carousel!.items,
                        maxHeight: data.carousel!.maxHeightBuilder(context));
                  }

                  final section = data.sections.elementAt(
                      sectionIndex - (data.carousel != null ? 1 : 0));
                  return ValueListenableBuilder<bool>(
                      valueListenable: isGridViewEnabled,
                      builder: (context, value, _) {
                        if (section.gridView != null) {
                          value = section.gridView!;
                        }

                        if (value == false) {
                          return HorizontalEigaList(
                            itemsFuture: Future.value(section.items
                                .map((item) => BasicEigaExtend(
                                    eiga: item, sourceId: widget.service.uid))
                                .toList()),
                            title: section.name,
                            more: section.sectionId != null
                                ? '/section_eiga/${widget.service.uid}/${section.sectionId}'
                                : null,
                          );
                        }

                        return VerticalEigaList(
                          itemsFuture: Future.value(section.items
                              .map((item) => BasicEigaExtend(
                                  eiga: item, sourceId: widget.service.uid))
                              .toList()),
                          title: section.name,
                          more: section.sectionId != null
                              ? '/section_eiga/${widget.service.uid}/${section.sectionId}'
                              : null,
                        );
                      });
                },
              ));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return PullToRefresh(
              controller: RefreshController(),
              onRefresh: () async {
                setState(() {});
                return null;
              },
              initialData: null,
              builder: (_) => builder(BaseEigaHome.createFakeData()));
        }

        return PullToRefresh<BaseEigaHome>(
            controller: _refreshController,
            onRefresh: widget.service.home,
            initialData: snapshot.data!,
            builder: builder);
      },
    );
  }
}
