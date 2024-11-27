import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CustomSearchBar extends StatefulWidget {
  final Function(Widget? overlay) onOverlayChange;

  const CustomSearchBar({super.key, required this.onOverlayChange});

  @override
  // ignore: library_private_types_in_public_api
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  bool _focusing = false;
  bool _isOverlayVisible = false;

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
              if (_focusing)
                IconButton(
                    icon: Icon(
                      MaterialCommunityIcons.arrow_left,
                      color: Theme.of(context)
                          .colorScheme
                          .secondaryFixedDim
                          .withOpacity(0.7),
                    ),
                    onPressed: () {
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
                      if (focused) {
                        _focusing = focused;
                        _showOverlay();
                      } else {
                        // _removeOverlay();
                      }
                    });
                  },
                  child: TextField(
                    autofocus: _focusing || _isOverlayVisible,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      border: InputBorder.none,
                    ),
                  ),
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
          child: QuickSearchScreen(onDismissed: _removeOverlay)),
    );
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
  final Function() onDismissed;

  const QuickSearchScreen({super.key, required this.onDismissed});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(10, (index) {
        return ListTile(
          leading: const Icon(Icons.history),
          title: Text("Search suggestion $index"),
          onTap: () {
            // Show a dialog for the search result instead of navigating
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Search Result $index"),
                  content: Text("Results for suggestion $index"),
                  actions: [
                    TextButton(
                      child: Text("Close"),
                      onPressed: () {
                        onDismissed();
                      },
                    ),
                  ],
                );
              },
            );
          },
        );
      }),
    );
  }
}
