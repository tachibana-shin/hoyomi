import 'dart:async';
import 'dart:convert';

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/eiga/eiga_service.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_section.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/core_services/interfaces/filter.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/widgets/comic/icon_button_open_browser.dart';
import 'package:hoyomi/widgets/eiga/vertical_eiga.dart';
import 'package:hoyomi/widgets/infinite_grid.dart';
import 'package:hoyomi/widgets/pull_refresh_page.dart';
import 'package:hoyomi/widgets/vertical_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SectionEigaPage extends StatefulWidget {
  final String sourceId;
  final String sectionId;
  final Future<EigaSection> Function({
    required String sectionId,
    required int page,
    required Map<String, List<String>?> filters,
  })? getSection;

  const SectionEigaPage(
      {super.key,
      required this.sourceId,
      required this.sectionId,
      this.getSection});

  @override
  createState() => _SectionEigaPageState();
}

class _SectionEigaPageState extends State<SectionEigaPage> {
  late final EigaService _service;
  int _pageKey = 1;

  String? _title;
  String? _url;
  // String? _description;
  List<Filter>? _filters;
  int? _currentPage;
  int? _totalPages;

  final Map<String, List<String>?> _selectFilters = {};

  @override
  void initState() {
    super.initState();
    _service = getEigaService(widget.sourceId);
  }

  Future<(bool, List<Eiga>)> _fetchComics(int pageKey) async {
    final newComics = await (widget.getSection ?? _service.getSection)(
        sectionId: widget.sectionId, page: pageKey, filters: _selectFilters);
    final isLastPage = newComics.page >= newComics.totalPages;

    setState(() {
      _title = newComics.name;
      _url = newComics.url;
      // _description = newComics.description;
      _filters = newComics.filters;
      _filters?.map((filter) {
        _selectFilters[filter.key] = null;
      });
      _currentPage = pageKey;
      _totalPages = newComics.totalPages;
    });

    return (isLastPage, newComics.items.toList());
  }

  @override
  Widget build(BuildContext context) {
    return PullRefreshPage<List<Eiga>>(
        onLoadData: () => _fetchComics(1).then((param) => param.$2),
        onLoadFake: () => List.generate(30, (_) => Eiga.createFakeData()),
        builder: (data, param) =>
            Scaffold(appBar: _buildAppBar(param.$2), body: _buildBody(data)));
  }

  AppBar _buildAppBar(Future<void> Function() refresh) {
    return AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        scrolledUnderElevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        title: Skeletonizer(
            enabled: _title == null || _title!.isEmpty,
            enableSwitchAnimation: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _title ?? "Fake title",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text(
                  "${_service.name} (${(_currentPage ?? '?')}/${_totalPages ?? '??'}) page",
                  style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ],
            )),
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
                                              isSelected:
                                                  _selectFilters[filter.key]
                                                          ?.contains(
                                                              option.value) ??
                                                      option.selected))
                                          .toList(),
                                      onSelected: (selectedList) {
                                        _selectFilters[filter.key] =
                                            selectedList
                                                .map((option) => option.value!)
                                                .toList();
                                          _pageKey = 1;
                                          
                                        refresh();
                                      },
                                      enableMultipleSelection: filter.multiple,
                                    ),
                                  ).showModal(context);
                                },
                                child: ClipRRect(
                                    clipBehavior: Clip.antiAlias,
                                    child: Chip(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 4.0),
                                        backgroundColor: Colors.transparent,
                                        label: Row(children: [
                                          Text(
                                            _selectFilters
                                                    .containsKey(filter.key)
                                                ? _selectFilters[filter.key]!
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
                                                    .withValues(
                                                        alpha: _selectFilters
                                                                .containsKey(
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

  Widget _buildBody(List<Eiga> data) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: InfiniteGrid(
          key: Key(jsonEncode(_selectFilters)),
            data: data,
            crossAxisCount: VerticalList.getCrossAxisCount(context),
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            fetchData: () async {
              final result = await _fetchComics(_pageKey);
              _pageKey++;

              return result;
            },
            itemBuilder: (context, eiga, index) {
              return VerticalEiga(
                eiga: eiga,
                sourceId: widget.sourceId,
              );
            }));
  }
}
