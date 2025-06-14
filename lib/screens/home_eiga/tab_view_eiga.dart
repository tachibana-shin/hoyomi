import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/main.dart';
import 'package:hoyomi/router/extensions/to_router.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';

class TabViewEiga extends StatefulWidget {
  final ABEigaService service;

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
          itemCount: data.categories.length + (data.carousel == null ? 0 : 1),
          itemBuilder: (context, categoryIndex) {
            if (categoryIndex == 0 && data.carousel != null) {
              return CarouselEiga(
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
              return HorizontalEigaList(
                itemsFuture: Future.value(
                  category.items
                      .map(
                        (item) => EigaExtend(
                          eiga: item,
                          sourceId: widget.service.uid,
                        ),
                      )
                      .toList(),
                ),
                title: category.name,
                more:
                    category.categoryId != null
                        ? ToRoute(
                          name: 'category_eiga',
                          pathParameters: {
                            'sourceId': widget.service.uid,
                            'categoryId': category.categoryId!,
                          },
                        )
                        : null,
              );
            }

            return VerticalEigaList(
              itemsFuture: Future.value(
                category.items
                    .map(
                      (item) =>
                          EigaExtend(eiga: item, sourceId: widget.service.uid),
                    )
                    .toList(),
              ),
              title: category.name,
              more:
                  category.categoryId != null
                      ? '/category_eiga/${widget.service.uid}/${category.categoryId}'
                      : null,
              disableScroll: true,
            );
          },
        );
      },
    );
  }
}
