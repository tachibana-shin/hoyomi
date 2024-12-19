import 'package:flutter/material.dart';
import 'package:honyomi/core_services/book/book_base_service.dart';
import 'package:honyomi/stores.dart';
import 'package:honyomi/core_services/book/interfaces/basic_book_section.dart';
import 'package:honyomi/widgets/book/horizontal_book_list.dart';
import 'package:honyomi/widgets/pull_to_refresh.dart';
import 'package:honyomi/widgets/book/vertical_book_list.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class TabViewBook extends StatefulWidget {
  final BookBaseService service;

  const TabViewBook({super.key, required this.service});

  @override
  createState() => _TabViewBookState();
}

class _TabViewBookState extends State<TabViewBook> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  late Future<List<BasicBookSection>> _data;

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

    return FutureBuilder<List<BasicBookSection>>(
      future: _data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          if (widget.service.isCaptchaError(snapshot.error)) {
            return Center(
                child: widget.service.templateCaptchaResolver(context));
          }

          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        return PullToRefresh<List<BasicBookSection>>(
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
                              itemsFuture: Future.value(section.items),
                              service: widget.service,
                              title: section.name,
                              more: section.sectionId != null
                                  ? '/section/${widget.service.uid}/${section.sectionId}'
                                  : null,
                            );
                          }

                          return VerticalBookList(
                            itemsFuture: null,
                            items: section.items,
                            service: widget.service,
                            title: section.name,
                            more: section.sectionId != null
                                ? '/section/${widget.service.uid}/${section.sectionId}'
                                : null,
                          );
                        });
                  },
                ));
      },
    );
  }
}
