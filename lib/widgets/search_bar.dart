import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/core_services/main.dart';
import 'package:honyomi/widgets/horizontal_book_list.dart';

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

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.keyword);
  }

  @override
  Widget build(BuildContext context) {
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
              if (_focusing || widget.backMode)
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
                        // _removeOverlay();
                      }
                    });
                  },
                  child: TextField(
                      autofocus: _focusing || _isOverlayVisible,
                      controller: _controller,
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
                        context.pushReplacement("/search?q=$value");
                      }),
                ),
              ),
              PopupMenuButton<String>(
                icon: Icon(MaterialCommunityIcons.dots_vertical,
                    color: Theme.of(context)
                        .colorScheme
                        .secondaryFixedDim
                        .withOpacity(0.7)),
                onSelected: (String value) {
                  if (value == 'clear_history') {
                    // Handle clear history
                  } else if (value == 'settings') {
                    // Handle settings
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'clear_history',
                    child: Text("Clear History"),
                  ),
                  const PopupMenuItem<String>(
                    value: 'settings',
                    child: Text("Settings"),
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
      top: 0.0,
      child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: QuickSearchScreen(
              onDismissed: _removeOverlay, keyword: _keyword.trim())),
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
    widget.onOverlayChange(_createOverlayEntry());
    // Overlay.of(context).insert(_overlayEntry);
    setState(() {
      _isOverlayVisible = true;
    });
  }

  void _removeOverlay() {
    if (_isOverlayVisible) {
      widget.onOverlayChange(null);
      setState(() {
        _isOverlayVisible = false;
      });
    }
  }
}

class QuickSearchScreen extends StatelessWidget {
  final String keyword;
  final Function() onDismissed;

  const QuickSearchScreen(
      {super.key, required this.onDismissed, required this.keyword});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: keyword.isEmpty
          ? []
          : services.map((service) {
              final result = service.search(keyword);
              return HorizontalBookList(
                booksFuture: result.then((value) => value.items),
                totalItems: result.then((value) => value.totalItems),
                service: service,
                title: service.name,
                more: '/search/${service.uid}?q=$keyword',
              );
            }).toList(),
    );
  }
}
