import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/notifier+/notifier_plus_mixin.dart';
import 'package:hoyomi/notifier+/watch_notifier.dart';
import 'package:hoyomi/stores.dart';

final ValueNotifier<String> _keyword = ValueNotifier('');

class _AppBarExtended extends AppBar {
  final Widget child;

  _AppBarExtended({required this.child});

  @override
  createState() => _AppBarExtendedState();
}

class _AppBarExtendedState extends State<_AppBarExtended> {
  @override
  Widget build(context) {
    return Semantics(
        container: true,
        child: Material(
          child: Semantics(
            explicitChildNodes: true,
            child: widget.child,
          ),
        ));
  }
}

class GlobalSearchBar extends StatefulWidget {
  final String keyword;
  final bool pageIsSearch;

  const GlobalSearchBar(
      {super.key, required this.keyword, required this.pageIsSearch});

  @override
  // ignore: library_private_types_in_public_api
  _GlobalSearchBarState createState() => _GlobalSearchBarState();
}

class _GlobalSearchBarState extends State<GlobalSearchBar>
    with NotifierPlusMixin {
  final _focusNode = FocusNode();

  late final TextEditingController _controller;

  DialogRoute? _route;

  @override
  void initState() {
    super.initState();

    if (widget.keyword.isNotEmpty) {
      _keyword.value = widget.keyword;
    }
    _controller = TextEditingController(text: _keyword.value);

    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      _focusNode.requestFocus();
    });
    _focusNode.requestFocus();
  }

  DialogRoute _showSearchLayer() {
    _route ??= DialogRoute(
      context: context,
      builder: (context) {
        return GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true).pop(_route);
            },
            child: Material(
                color: Colors.transparent,
                child: Scaffold(
                    appBar: _buildGlobalSearchBar(true),
                    body: WatchNotifier(
                        depends: [_keyword],
                        builder: (context) {
                          return ListView(children: [Text(_keyword.value)]);
                        }))));
      },
    );

    Navigator.of(context, rootNavigator: true).push(_route!);

    return _route!;
  }

  void _closeSearchLayer({bool changeMode = false}) {
    _focusNode.unfocus();

    if (_route != null) {
      Navigator.of(context, rootNavigator: true).pop(_route!);
      _route = null;
    }
    if (changeMode && widget.pageIsSearch) {
      context.pop();
    }
  }

  _AppBarExtended _buildGlobalSearchBar(bool focusing) {
    final theme = Theme.of(context);

    return _AppBarExtended(
      // key: _keySearch,
      // preferredSize: const Size.fromHeight(50.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeInOutCubic,
        padding: EdgeInsets.symmetric(horizontal: focusing ? 0.0 : 8.0),
        margin: EdgeInsets.symmetric(horizontal: 18.0),
        decoration: BoxDecoration(
          color: focusing
              ? Colors.transparent
              : theme.colorScheme.surfaceContainerHigh,
          borderRadius:
              focusing ? BorderRadius.zero : BorderRadius.circular(30.0),
        ),
        child: Row(
          children: [
            if (focusing || widget.pageIsSearch && widget.keyword.isNotEmpty)
              IconButton(
                icon: Icon(
                  MaterialCommunityIcons.arrow_left,
                  color: theme.colorScheme.secondaryFixedDim
                      .withValues(alpha: 0.7),
                ),
                onPressed: () => _closeSearchLayer(changeMode: true),
              )
            else
              IconButton(
                icon: Icon(
                  MaterialCommunityIcons.magnify,
                  color: theme.colorScheme.secondaryFixedDim
                      .withValues(alpha: 0.7),
                ),
                onPressed: () => _showSearchLayer(),
              ),
            const SizedBox(width: 8),
            Expanded(
              child: GestureDetector(
                  onTap: () => _showSearchLayer(),
                  child: TextField(
                    autofocus: focusing,
                    enabled: focusing,
                    controller: _controller,
                    // readOnly: _readonly,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      _keyword.value = value;
                    },
                    onSubmitted: (value) {
                      _closeSearchLayer();
                      context.push("/search?q=$value");
                    },
                  )),
            ),
            if (focusing == false) _buildButtonMore()
          ],
        ),
      ),
    );
  }

  Widget _buildButtonMore() {
    return PopupMenuButton<String>(
      icon: Icon(
        MaterialCommunityIcons.dots_vertical,
        color: Theme.of(
          context,
        ).colorScheme.secondaryFixedDim.withValues(alpha: 0.7),
      ),
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
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildGlobalSearchBar(false);
  }
}
