import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/core_services/book/interfaces/basic_book.dart';
import 'package:honyomi/core_services/book/interfaces/paginate.dart';
import 'package:honyomi/core_services/main.dart';
import 'package:honyomi/stores.dart';
import 'package:honyomi/widgets/book/horizontal_book_list.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class CustomSearchBar extends StatefulWidget {
  final String keyword;
  final bool backMode;

  final Function(Widget? overlay) onOverlayChange;

  const CustomSearchBar(
      {super.key,
      required this.onOverlayChange,
      required this.keyword,
      this.backMode = false});

  @override
  // ignore: library_private_types_in_public_api
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late final TextEditingController _controller;

  bool _focusing = false;
  bool _isOverlayVisible = false;
  String _keyword = "";

  OverlayEntry? _overlayEntry;

  final bool _readonly = false;
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.keyword);
  }

  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50.0),
      child: Stack(children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeInOutCubic,
          padding: EdgeInsets.symmetric(horizontal: _focusing ? 0.0 : 8.0),
          margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
          decoration: BoxDecoration(
            color: _focusing ? Colors.transparent : Colors.grey[900],
            borderRadius:
                _focusing ? BorderRadius.zero : BorderRadius.circular(30.0),
          ),
          child: Row(
            children: [
              if (_focusing ||
                  (widget.backMode && _controller.text.trim().isNotEmpty))
                IconButton(
                    icon: Icon(
                      MaterialCommunityIcons.arrow_left,
                      color: Theme.of(context)
                          .colorScheme
                          .secondaryFixedDim
                          .withOpacity(0.7),
                    ),
                    onPressed: () {
                      if (widget.backMode) {
                        context.pop();
                        _controller.clearComposing();
                        _controller.clear();
                      }

                      setState(() {
                        _focusing = false;
                        _removeOverlay();
                      });
                    })
              else
                IconButton(
                    icon: Icon(MaterialCommunityIcons.magnify,
                        color: Theme.of(context)
                            .colorScheme
                            .secondaryFixedDim
                            .withOpacity(0.7)),
                    onPressed: () {
                      setState(() {
                        _focusing = false;
                        _removeOverlay();
                      });
                      // setState(() {
                      //   _focusing = true;
                      //   _showOverlay();
                      // });
                    }),
              const SizedBox(width: 8),
              Expanded(
                child: Focus(
                  onFocusChange: (focused) {
                    setState(() {
                      if (focused && !_focusing) {
                        _focusing = focused;
                        _showOverlay();
                      } else {
                        // _focusing = false;
                        // _removeOverlay();
                      }
                    });
                  },
                  child: TextField(
                      autofocus: _focusing || _isOverlayVisible,
                      controller: _controller,
                      // readOnly: _readonly,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        hintText: "Search...",
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _keyword = value;

                          if (_isOverlayVisible) {
                            _debouncedShowOverlay();
                          }
                        });
                      },
                      onSubmitted: (value) {
                        context.push("/search?q=$value");
                      }),
                ),
              ),
              if (_focusing == false)
                PopupMenuButton<String>(
                  icon: Icon(MaterialCommunityIcons.dots_vertical,
                      color: Theme.of(context)
                          .colorScheme
                          .secondaryFixedDim
                          .withOpacity(0.7)),
                  onSelected: (String value) {
                    if (value == 'clear_history') {
                      // Handle clear history
                    }
                    if (value == 'settings') {
                      // Handle settings
                    }
                    if (value == 'grid_view') {
                      isGridViewEnabled.value = !isGridViewEnabled.value;
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'clear_history',
                      child: Text("Clear History"),
                    ),
                    const PopupMenuItem<String>(
                      value: 'settings',
                      child: Text("Settings"),
                    ),
                    PopupMenuItem<String>(
                      value: 'grid_view',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Grid View"),
                          ValueListenableBuilder<bool>(
                            valueListenable: isGridViewEnabled,
                            builder: (context, value, _) {
                              return Switch(
                                value: value,
                                onChanged: (newValue) {
                                  isGridViewEnabled.value = newValue;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _createOverlayEntry() {
    return Positioned.fill(
      top: 52.0,
      child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: QuickSearchScreen(
              onDismissed: () {
                setState(() {
                  _focusing = false;
                  _removeOverlay();
                });
              },
              keyword: _keyword.trim())),
    );
  }

  Timer? _debounceTimer;
  void _debouncedShowOverlay() {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 1000), () {
      _showOverlay();
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _showOverlay() {
    return ;
    _overlayEntry = OverlayEntry(builder: (context) => _createOverlayEntry());
    Overlay.of(context).insert(_overlayEntry!);

    // Overlay.of(context).insert(_overlayEntry);
    setState(() {
      _isOverlayVisible = true;
    });
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry?.dispose();
    _overlayEntry = null;
    // Overlay.of(context).
    setState(() {
      _isOverlayVisible = false;
    });
  }
}

class QuickSearchScreen extends StatefulWidget {
  final String keyword;
  final Function()? onDismissed;

  const QuickSearchScreen({super.key, this.onDismissed, required this.keyword});

  @override
  State<QuickSearchScreen> createState() => _QuickSearchScreenState();
}

class _QuickSearchScreenState extends State<QuickSearchScreen> {
  final RefreshController _refreshController = RefreshController();
  final Map<String, Future<Paginate<BasicBook>>> _searchFutures = {};

  @override
  void initState() {
    super.initState();
    _fetchSearchResults();
  }

  void _fetchSearchResults() {
    // Trigger search for each service
    for (var service in bookServices) {
      _searchFutures[service.uid] = service.search(widget.keyword);
    }
  }

  Future<void> _onRefresh() async {
    try {
      _fetchSearchResults();
      await Future.wait(_searchFutures.values);
      _refreshController.refreshCompleted();
      setState(() {});
    } catch (e) {
      debugPrint('Refresh error: $e');
      _refreshController.refreshFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.keyword.isEmpty) {
      return const Center(
        child: Text(
          'Please enter a keyword to search.',
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      enablePullDown: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: bookServices.map((service) {
          final searchResult = _searchFutures[service.uid];
          return HorizontalBookList(
              itemsFuture: searchResult!.then((data) => data.items),
              totalItems: searchResult.then((data) => data.totalItems),
              service: service,
              title: service.name,
              more: '/search/${service.uid}?q=${widget.keyword}',
              onTapChild: widget.onDismissed);
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
