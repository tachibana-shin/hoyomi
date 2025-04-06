import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/comic/ab_comic_service.dart';
import 'package:hoyomi/stores.dart';
import 'package:hoyomi/core_services/comic/interfaces/home_comic_category.dart';
import 'package:hoyomi/widgets/comic/horizontal_comic_list.dart';
import 'package:hoyomi/widgets/comic/vertical_comic_list.dart';
import 'package:hoyomi/widgets/pull_refresh_page.dart';

class TabViewComic extends StatefulWidget {
  final ABComicService service;

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

    return PullRefreshPage<List<HomeComicCategory>>(
      onLoadData: widget.service.home,
      onLoadFake: () =>
          List.generate(4, (_) => HomeComicCategory.createFakeData()),
      builder: (data, _) => ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: data.length,
        itemBuilder: (context, categoryIndex) {
          final category = data.elementAt(categoryIndex);

          return ValueListenableBuilder<bool>(
            valueListenable: isGridViewEnabled,
            builder: (context, value, _) {
              if (category.gridView != null) {
                value = category.gridView!;
              }

              if (value == false) {
                return HorizontalComicList(
                  itemsFuture: Future.value(
                    category.items
                        .map(
                          (item) => ComicExtend(
                            comic: item,
                            sourceId: widget.service.uid,
                          ),
                        )
                        .toList(),
                  ),
                  title: category.name,
                  more: category.categoryId != null
                      ? '/category_comic/${widget.service.uid}/${category.categoryId}'
                      : null,
                );
              }

              return VerticalComicList(
                itemsFuture: Future.value(
                  category.items
                      .map(
                        (item) => ComicExtend(
                          comic: item,
                          sourceId: widget.service.uid,
                        ),
                      )
                      .toList(),
                ),
                title: category.name,
                more: category.categoryId != null
                    ? '/category_comic/${widget.service.uid}/${category.categoryId}'
                    : null,
              );
            },
          );
        },
      ),
    );
  }
}
