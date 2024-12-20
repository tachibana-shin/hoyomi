import 'dart:async';

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/core_services/book/book_base_service.dart';
import 'package:honyomi/core_services/book/interfaces/basic_book.dart';
import 'package:honyomi/core_services/book/interfaces/basic_filter.dart';
import 'package:honyomi/core_services/main.dart';
import 'package:honyomi/core_services/utils_service.dart';
import 'package:honyomi/widgets/book/icon_button_open_browser.dart';
import 'package:honyomi/widgets/pull_to_refresh.dart';
import 'package:honyomi/widgets/book/vertical_book.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class SectionPage extends StatelessWidget {
  final String serviceId;
  final String sectionId;

  const SectionPage(
      {super.key, required this.serviceId, required this.sectionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Section(serviceId: serviceId, sectionId: sectionId),
    );
  }
}

class Section extends StatefulWidget {
  final String serviceId;
  final String sectionId;

  const Section({super.key, required this.serviceId, required this.sectionId});

  @override
  createState() => _SectionState();
}

class _SectionState extends State<Section> {
  late final BookBaseService _service;

  final PagingController<int, BasicBook> _pagingController =
      PagingController(firstPageKey: 1);
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  String? _title;
  String? _url;
  // String? _description;
  List<BasicFilter>? _filters;
  int? _currentPage;
  int? _totalPages;

  Completer<void>? _refreshCompleter;

  final Map<String, List<String>?> _data = {};

  @override
  void initState() {
    super.initState();
    _service = getBookService(widget.serviceId);
    _pagingController.addPageRequestListener((pageKey) {
      _fetchBooks(pageKey);
    });
  }

  Future<void> _fetchBooks(int pageKey) async {
    try {
      final newBooks = await _service.getSection(widget.sectionId,
          page: pageKey, filters: _data);
      final isLastPage = newBooks.page >= newBooks.totalPages;
      setState(() {
        _title = newBooks.name;
        _url = newBooks.url;
        // _description = newBooks.description;
        _filters = newBooks.filters;
        _filters?.map((filter) {
          _data[filter.key] = null;
        });
        _currentPage = pageKey;
        _totalPages = newBooks.totalPages;
      });

      if (isLastPage) {
        _pagingController.appendLastPage(newBooks.items.toList());
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newBooks.items.toList(), nextPageKey);
      }

      _refreshCompleter?.complete();
    } catch (error) {
      _pagingController.error = error;

      _refreshCompleter?.completeError(error);
    }
  }

  void _filtersChanged() {
    _pagingController.refresh();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        scrolledUnderElevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _title ?? "",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2),
            Text(
              "${_service.name} (${(_currentPage ?? '?')}/${_totalPages ?? '??'}) page",
              style: TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
        actions: [if (_url != null) IconButtonOpenBrowser(url: _url!)],
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: Icon(MaterialCommunityIcons.earth,
        //           color: Theme.of(context).colorScheme.onSurface)),
        // ],
        bottom: _filters == null
            ? null
            : PreferredSize(
                preferredSize: Size.fromHeight(48.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _filters!.map((filter) {
                        final options = filter.options;

                        return Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: InkWell(
                                onTap: () {
                                  DropDownState(
                                    DropDown(
                                      bottomSheetTitle: Text(
                                        filter.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      searchHintText: filter.name,
                                      submitButtonChild: const Text(
                                        'Done',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      data: options
                                          .map((option) => SelectedListItem(
                                              name: option.name,
                                              value: option.value,
                                              isSelected: _data[filter.key]
                                                      ?.contains(
                                                          option.value) ??
                                                  option.selected))
                                          .toList(),
                                      onSelected: (selectedList) {
                                        ///
                                        setState(() {
                                          _data[filter.key] = selectedList
                                              .map((option) => option.value!)
                                              .toList();
                                          _filtersChanged();
                                        });
                                      },
                                      enableMultipleSelection: filter.multiple,
                                    ),
                                  ).showModal(context);
                                },
                                child: ClipRRect(
                                    clipBehavior: Clip.hardEdge,
                                    child: Chip(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 4.0),
                                        backgroundColor: Colors.transparent,
                                        label: Row(children: [
                                          Text(
                                            _data.containsKey(filter.key)
                                                ? _data[filter.key]!
                                                    .map((value) => options
                                                        .firstWhere((option) =>
                                                            option.value ==
                                                            value)
                                                        .name)
                                                    .join(', ')
                                                : filter.name,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface
                                                    .withOpacity(
                                                        _data.containsKey(
                                                                filter.key)
                                                            ? 1.0
                                                            : 0.8)),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 7.0, right: 0.0),
                                              child: Icon(MaterialCommunityIcons
                                                  .chevron_down))
                                        ])))));
                      }).toList(),
                    ),
                  ),
                ),
              ));
  }

  Widget _buildBody() {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;

    if (screenWidth <= 600) {
      crossAxisCount = 3;
    } else if (screenWidth <= 900) {
      crossAxisCount = 4;
    } else {
      crossAxisCount = 6;
    }

    return PullToRefresh(
        controller: _refreshController,
        onRefresh: () async {
          _refreshCompleter = Completer();
          _pagingController.refresh();

          await _refreshCompleter?.future;
        },
        initialData: null,
        builder: (data) => PagedGridView(
              pagingController: _pagingController,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 118.0 / 236.0),
              builderDelegate: PagedChildBuilderDelegate<BasicBook>(
                animateTransitions: true,
                itemBuilder: (context, book, index) {
                  return VerticalBook(book: book, sourceId: _service.uid);
                },
                firstPageProgressIndicatorBuilder: (_) => Center(
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.0),
                      child: CircularProgressIndicator()),
                ),
                newPageProgressIndicatorBuilder: (_) => Center(
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.0),
                      child: CircularProgressIndicator()),
                ),
                noItemsFoundIndicatorBuilder: (_) => Center(
                  child: Text('No items found.'),
                ),
                newPageErrorIndicatorBuilder: _buildError,
                firstPageErrorIndicatorBuilder: _buildError,
              ),
            ));
  }

  Widget _buildError(BuildContext context) {
    return Center(
        child: UtilsService.errorWidgetBuilder(context,
            error: _pagingController.error,
            orElse: (error) => Text('Error: $error')));
  }
}
