import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/comic/comic_service.dart';
import 'package:hoyomi/stores.dart';
import 'package:hoyomi/core_services/comic/interfaces/home_comic_section.dart';
import 'package:hoyomi/widgets/comic/horizontal_comic_list.dart';
import 'package:hoyomi/widgets/comic/vertical_comic_list.dart';
import 'package:hoyomi/widgets/pull_refresh_page.dart';

class TabViewComic extends StatefulWidget {
  final ComicService service;

  const TabViewComic({super.key, required this.service});

  @override
  createState() => _TabViewComicState();
}

class _TabViewComicState extends State<TabViewComic>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return PullRefreshPage<List<HomeComicSection>>(
      onLoadData: widget.service.home,
      onLoadFake:
          () => List.generate(4, (_) => HomeComicSection.createFakeData()),
      builder:
          (data, _) => ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: data.length,
            itemBuilder: (context, sectionIndex) {
              final section = data.elementAt(sectionIndex);

              return ValueListenableBuilder<bool>(
                valueListenable: isGridViewEnabled,
                builder: (context, value, _) {
                  if (section.gridView != null) {
                    value = section.gridView!;
                  }

                  if (value == false) {
                    return HorizontalComicList(
                      itemsFuture: Future.value(
                        section.items
                            .map(
                              (item) => ComicExtend(
                                comic: item,
                                sourceId: widget.service.uid,
                              ),
                            )
                            .toList(),
                      ),
                      title: section.name,
                      more:
                          section.sectionId != null
                              ? '/section_comic/${widget.service.uid}/${section.sectionId}'
                              : null,
                    );
                  }

                  return VerticalComicList(
                    itemsFuture: Future.value(
                      section.items
                          .map(
                            (item) => ComicExtend(
                              comic: item,
                              sourceId: widget.service.uid,
                            ),
                          )
                          .toList(),
                    ),
                    title: section.name,
                    more:
                        section.sectionId != null
                            ? '/section_comic/${widget.service.uid}/${section.sectionId}'
                            : null,
                  );
                },
              );
            },
          ),
    );
  }
}
