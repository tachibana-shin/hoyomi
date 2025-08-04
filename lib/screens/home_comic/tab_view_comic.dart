import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/comic/main.dart';
import 'package:hoyomi/router/extensions/to_router.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';

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

    return PullRefreshPage<ComicHome>(
      onLoadData: widget.service.home,
      onLoadFake: () => ComicHome.createFakeData(),
      builder: (data, _) {
        return ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: data.categories.length + (data.carousel == null ? 0 : 1),
          itemBuilder: (context, categoryIndex) {
            if (categoryIndex == 0 && data.carousel != null) {
              return CarouselComic(
                aspectRatio: data.carousel!.aspectRatio,
                sourceId: widget.service.uid,
                items: data.carousel!.items,
                maxHeight: data.carousel!.maxHeightBuilder * 100.h(context),
              );
            }

            final category = data.categories.elementAt(
              categoryIndex - (data.carousel != null ? 1 : 0),
            );

            if (category.gridView != true) {
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
                    ? ToRoute(
                        name: 'category_comic',
                        pathParameters: {
                          'sourceId': widget.service.uid,
                          'categoryId': category.categoryId!,
                        },
                      )
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
              disableScroll: true,
            );
          },
        );
      },
    );
  }
}
