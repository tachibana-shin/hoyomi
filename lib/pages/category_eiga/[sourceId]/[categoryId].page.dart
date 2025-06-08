import 'dart:async';
import 'dart:convert';

import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/main.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:kaeru/kaeru.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryEigaPage extends StatefulWidget {
  final String sourceId;
  final String categoryId;
  final Widget? title;

  final Future<EigaCategory> Function({
    required String categoryId,
    required int page,
    required Map<String, List<String>?> filters,
  })?
  getCategory;

  const CategoryEigaPage({
    super.key,
    required this.sourceId,
    required this.categoryId,
    this.title,
    this.getCategory,
  });

  @override
  createState() => _CategoryEigaPageState();
}

class _CategoryEigaPageState extends State<CategoryEigaPage> with KaeruMixin {
  late final ABEigaService _service;
  int _pageKey = 2;

  late final _title = ref<String?>(null);
  late final _url = ref<String?>(null);
  // String? _description;
  late final _filters = ref<List<Filter>?>(null);
  late final _currentPage = ref<int?>(null);
  late final _totalPages = ref<int?>(null);

  final Map<String, List<String>?> _selectFilters = {};

  @override
  void initState() {
    super.initState();
    _service = getEigaService(widget.sourceId);
  }

  Future<({bool isLastPage, List<Eiga> data})> _fetchEigas(int pageKey) async {
    final newEigas = await (widget.getCategory ?? _service.getCategory)(
      categoryId: widget.categoryId,
      page: pageKey,
      filters: _selectFilters,
    );
    final isLastPage = newEigas.page >= newEigas.totalPages;

    _title.value = newEigas.name;
    _url.value = newEigas.url;
    // _description = newEigas.description;
    _filters.value = newEigas.filters;
    if (_filters.value?.isEmpty == true) _filters.value = null;

    _filters.value?.map((filter) {
      _selectFilters[filter.key] = null;
    });
    _currentPage.value = pageKey;
    _totalPages.value = newEigas.totalPages;

    return (isLastPage: isLastPage, data: newEigas.items.toList());
  }

  @override
  Widget build(BuildContext context) {
    return PullRefreshPage(
      onLoadData: () => _fetchEigas(1),
      onLoadFake:
          () => (
            data: List.generate(30, (_) => Eiga.createFakeData()),
            isLastPage: true,
          ),
      builderError:
          (body) => Watch(
            () => Scaffold(appBar: _buildAppBar(() async {}), body: body),
          ),
      builder:
          (data, param) => Watch(
            () => Scaffold(
              appBar: _buildAppBar(param.refresh),
              body: _buildBody(data),
            ),
          ),
    );
  }

  AppBar _buildAppBar(Future<void> Function() refresh) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      scrolledUnderElevation: 0.0,
      automaticallyImplyLeading: false,
      leading: HBackButton().showIf(widget.title == null),
      flexibleSpace: SizedBox.shrink(),
      titleSpacing: 0,
      title:
          widget.title ??
          Watch(
            () => Skeletonizer(
              enabled: _title.value == null,
              enableSwitchAnimation: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _title.value ?? "Fake title",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "${_service.name} (${(_currentPage.value ?? '?')}/${_totalPages.value ?? '??'}) page",
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
      actions: [Watch(() => IconButtonOpenBrowser(url: _url.value))],
      // actions: [
      //   IconButton(
      //       onPressed: () {},
      //       icon: Icon(MaterialCommunityIcons.earth,
      //           color: Theme.of(context).colorScheme.onSurface)),
      // ],
      bottom:
          _filters.value == null
              ? null
              : PreferredSize(
                preferredSize: Size.fromHeight(
                  48.0 + (widget.title != null ? (14.0 * 1.5 + 3.0) : 0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.title != null) ...[
                        Watch(
                          () => Text(
                            'Results (${(_currentPage.value ?? '?')}/${_totalPages.value ?? '??'}) page',
                          ).fontSize(14),
                        ),
                        3.heightBox,
                      ],
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children:
                              _filters.value!.map((filter) {
                                final options = filter.options;

                                return Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: InkWell(
                                    onTap: () {
                                      DropDownState(
                                        dropDown: DropDown(
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
                                          listItemBuilder:
                                              (index, selected) =>
                                                  Text(selected.data.name),
                                          data:
                                              options
                                                  .map(
                                                    (
                                                      option,
                                                    ) => SelectedListItem(
                                                      data: option,
                                                      isSelected:
                                                          _selectFilters[filter
                                                                  .key]
                                                              ?.contains(
                                                                option.value,
                                                              ) ??
                                                          option.selected,
                                                    ),
                                                  )
                                                  .toList(),
                                          onSelected: (selectedList) {
                                            _selectFilters[filter.key] =
                                                selectedList
                                                    .map(
                                                      (option) =>
                                                          option.data.value,
                                                    )
                                                    .toList();
                                            _pageKey = 1;

                                            refresh();
                                          },
                                          enableMultipleSelection:
                                              filter.multiple,
                                        ),
                                      ).showModal(context);
                                    },
                                    child: ClipRRect(
                                      clipBehavior: Clip.antiAlias,
                                      child: Chip(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        backgroundColor: Colors.transparent,
                                        label: Row(
                                          children: [
                                            Text(
                                              _selectFilters.containsKey(
                                                    filter.key,
                                                  )
                                                  ? _selectFilters[filter.key]!
                                                      .map(
                                                        (value) =>
                                                            options
                                                                .firstWhere(
                                                                  (option) =>
                                                                      option
                                                                          .value ==
                                                                      value,
                                                                )
                                                                .name,
                                                      )
                                                      .join(', ')
                                                  : filter.name,
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface
                                                    .withValues(
                                                      alpha:
                                                          _selectFilters
                                                                  .containsKey(
                                                                    filter.key,
                                                                  )
                                                              ? 1.0
                                                              : 0.8,
                                                    ),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                left: 7.0,
                                                right: 0.0,
                                              ),
                                              child: Iconify(Ion.chevron_down),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }

  Widget _buildBody(({List<Eiga> data, bool isLastPage}) data) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: InfiniteGrid(
        key: Key(jsonEncode(_selectFilters)),
        data: data.data,
        hasReachedMax: data.isLastPage,
        crossAxisCount: VerticalList.getCrossAxisCount(context),
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        fetchData: () async {
          final result = await _fetchEigas(_pageKey);
          if (!result.isLastPage) {
            _pageKey++;
          }

          return result;
        },
        itemBuilder: (context, eiga, index) {
          return VerticalEiga(eiga: eiga, sourceId: widget.sourceId);
        },
      ),
    );
  }
}
