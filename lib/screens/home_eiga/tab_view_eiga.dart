import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/eiga_service.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_home.dart';
import 'package:hoyomi/stores.dart';
import 'package:hoyomi/widgets/eiga/carousel_eiga.dart';
import 'package:hoyomi/widgets/eiga/horizontal_eiga_list.dart';
import 'package:hoyomi/widgets/eiga/vertical_eiga_list.dart';
import 'package:hoyomi/widgets/pull_refresh_page.dart';

class TabViewEiga extends StatefulWidget {
  final EigaService service;

  const TabViewEiga({super.key, required this.service});

  @override
  State<TabViewEiga> createState() => _TabViewEigaState();
}

class _TabViewEigaState extends State<TabViewEiga>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return PullRefreshPage<EigaHome>(
      onLoadData: () => widget.service.home(),
      onLoadFake: () => EigaHome.createFakeData(),
      builder: (data, _) {
        return ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: data.sections.length + (data.carousel == null ? 0 : 1),
          itemBuilder: (context, sectionIndex) {
            if (sectionIndex == 0 && data.carousel != null) {
              return CarouselEiga(
                aspectRatio: data.carousel!.aspectRatio,
                sourceId: widget.service.uid,
                items: data.carousel!.items,
                maxHeight: data.carousel!.maxHeightBuilder(context),
              );
            }

            final section = data.sections.elementAt(
              sectionIndex - (data.carousel != null ? 1 : 0),
            );
            return ValueListenableBuilder<bool>(
              valueListenable: isGridViewEnabled,
              builder: (context, value, _) {
                if (section.gridView != null) {
                  value = section.gridView!;
                }

                if (value == false) {
                  return HorizontalEigaList(
                    itemsFuture: Future.value(
                      section.items
                          .map(
                            (item) => EigaExtend(
                              eiga: item,
                              sourceId: widget.service.uid,
                            ),
                          )
                          .toList(),
                    ),
                    title: section.name,
                    more: section.sectionId != null
                        ? '/section_eiga/${widget.service.uid}/${section.sectionId}'
                        : null,
                  );
                }

                return VerticalEigaList(
                  itemsFuture: Future.value(
                    section.items
                        .map(
                          (item) => EigaExtend(
                            eiga: item,
                            sourceId: widget.service.uid,
                          ),
                        )
                        .toList(),
                  ),
                  title: section.name,
                  more: section.sectionId != null
                      ? '/section_eiga/${widget.service.uid}/${section.sectionId}'
                      : null,
                );
              },
            );
          },
        );
      },
    );
  }
}
