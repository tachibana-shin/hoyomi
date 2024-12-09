import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/core_services/base_service.dart';
import 'package:honyomi/core_services/interfaces/basic_book.dart';
import 'package:honyomi/core_services/interfaces/basic_filter.dart';
import 'package:honyomi/core_services/main.dart';
import 'package:honyomi/widgets/vertical_book.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SectionPage extends StatelessWidget {
  final String serviceId;
  final String slug;

  const SectionPage({super.key, required this.serviceId, required this.slug});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Section(serviceId: serviceId, slug: slug),
    );
  }
}

class Section extends StatefulWidget {
  final String serviceId;
  final String slug;

  const Section({super.key, required this.serviceId, required this.slug});

  @override
  createState() => _SectionState();
}

class _SectionState extends State<Section> {
  late final BaseService _service;

  final PagingController<int, BasicBook> _pagingController =
      PagingController(firstPageKey: 1);

  String? _title;
  String? _description;
  List<BasicFilter>? _filters;
  int? _currentPage;
  int? _totalPages;

  final Map<String, List<String>?> _data = {};

  @override
  void initState() {
    super.initState();
    _service = getService(widget.serviceId);
    _pagingController.addPageRequestListener((pageKey) {
      _fetchBooks(pageKey);
    });
  }

  Future<void> _fetchBooks(int pageKey) async {
    try {
      final newBooks =
          await _service.getSection(widget.slug, page: pageKey, filters: _data);
      final isLastPage = newBooks.page >= newBooks.totalPages;
      setState(() {
        _title = newBooks.name;
        _description = newBooks.description;
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
    } catch (error) {
      _pagingController.error = error;
    }
  }

  void _filtersChanged() {
    _pagingController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
        elevation: 0,
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
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
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

    return Column(children: [
      if (_description != null)
        Text(_description!,
            maxLines: 3, style: Theme.of(context).textTheme.bodySmall),
      PagedGridView(
        pagingController: _pagingController,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 118.0 / 236.0),
        builderDelegate: PagedChildBuilderDelegate<BasicBook>(
          itemBuilder: (context, book, index) {
            return VerticalBook(book: book, sourceId: _service.uid);
          },
          firstPageProgressIndicatorBuilder: (_) => Center(
            child: CircularProgressIndicator(),
          ),
          newPageProgressIndicatorBuilder: (_) => Center(
            child: CircularProgressIndicator(),
          ),
          noItemsFoundIndicatorBuilder: (_) => Center(
            child: Text('No items found.'),
          ),
          newPageErrorIndicatorBuilder: _buildError,
          firstPageErrorIndicatorBuilder: _buildError,
        ),
      )
    ]);
  }

  Widget _buildError(BuildContext context) {
    if (_service.isCaptchaError(_pagingController.error)) {
      return Center(child: _service.templateCaptchaResolver(context));
    }

    return Center(child: Text('Error: ${_pagingController.error}'));
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
