import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/book/book_service.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:hoyomi/stores.dart';
import 'package:hoyomi/core_services/book/interfaces/home_book_section.dart';
import 'package:hoyomi/widgets/book/horizontal_book_list.dart';
import 'package:hoyomi/widgets/pull_to_refresh.dart';
import 'package:hoyomi/widgets/book/vertical_book_list.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class TabViewBook extends StatefulWidget {
  final BookService service;

  const TabViewBook({super.key, required this.service});

  @override
  createState() => _TabViewBookState();
}

class _TabViewBookState extends State<TabViewBook>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  late Future<List<HomeBookSection>> _data;

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

    return FutureBuilder<List<HomeBookSection>>(
      future: _data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
              child: UtilsService.errorWidgetBuilder(context,
                  error: snapshot.error,
                  orElse: (error) => Text('Error: $error')));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        return PullToRefresh<List<HomeBookSection>>(
            controller: _refreshController,
            onRefresh: widget.service.home,
            initialData: snapshot.data!,
            builder: (data) => ListView.builder(
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
                            return HorizontalBookList(
                              itemsFuture: Future.value(section.items
                                  .map((item) => BookExtend(
                                      book: item, sourceId: widget.service.uid))
                                  .toList()),
                              title: section.name,
                              more: section.sectionId != null
                                  ? '/section_comic/${widget.service.uid}/${section.sectionId}'
                                  : null,
                            );
                          }

                          return VerticalBookList(
                            itemsFuture: Future.value(section.items
                                .map((item) => BookExtend(
                                    book: item, sourceId: widget.service.uid))
                                .toList()),
                            title: section.name,
                            more: section.sectionId != null
                                ? '/section_comic/${widget.service.uid}/${section.sectionId}'
                                : null,
                          );
                        });
                  },
                ));
      },
    );
  }
}
