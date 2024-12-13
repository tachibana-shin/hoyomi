import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/core_services/base_service.dart';
import 'package:honyomi/core_services/interfaces/basic_book.dart';
import 'package:honyomi/core_services/main.dart';
import 'package:honyomi/widgets/vertical_book.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchPageSingleSource extends StatelessWidget {
  final String serviceId;
  final String keyword;

  const SearchPageSingleSource(
      {super.key, required this.serviceId, required this.keyword});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchSingleSource(serviceId: serviceId, keyword: keyword),
    );
  }
}

class SearchSingleSource extends StatefulWidget {
  final String serviceId;
  final String keyword;

  const SearchSingleSource(
      {super.key, required this.serviceId, required this.keyword});

  @override
  createState() => _SearchSingleSourceState();
}

class _SearchSingleSourceState extends State<SearchSingleSource> {
  late final BaseService _service;

  final PagingController<int, BasicBook> _pagingController =
      PagingController(firstPageKey: 1);
  int? _currentPage;
  int? _totalPages;

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
      final newBooks = await _service.search(widget.keyword, page: pageKey);
      final isLastPage = newBooks.page >= newBooks.totalPages;
      setState(() {
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
            "Search result for '${widget.keyword}'",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2),
          Text(
            "${_service.name} (${(_currentPage ?? '?')}/${_totalPages ?? '??'}) page",
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
        ],
      ),
    );
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

    return PagedGridView(
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
    );
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
