import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/core_services/comic/comic_service.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic.dart';
import 'package:hoyomi/core_services/eiga/ab_eiga_service.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/stores.dart';
import 'package:hoyomi/utils/debouncer.dart';
import 'package:hoyomi/widgets/blurred_part_background.dart';
import 'package:hoyomi/widgets/speech_to_text.dart';
import 'package:http/http.dart';
import 'package:hoyomi/widgets/iconify.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:kaeru/kaeru.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:speech_to_text_google_dialog/speech_to_text_google_dialog.dart';

final Ref<String> _keyword = Ref('');
final Ref<String?> _serviceSelect = Ref(null);

final _setKeyword = Debouncer(Duration(seconds: 1), (String keyword) {
  _keyword.value = keyword;
}).run;

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

class _QuickSearchItem extends StatefulWidget {
  final String to;
  final String title;
  final OImage image;
  final String? subtitle;
  final String? description;
  final String sourceId;

  const _QuickSearchItem({
    required this.to,
    required this.title,
    required this.image,
    required this.subtitle,
    required this.description,
    required this.sourceId,
  });

  @override
  State<_QuickSearchItem> createState() => _QuickSearchItemState();
}

class _QuickSearchItemState extends State<_QuickSearchItem> {
  @override
  Widget build(context) {
    final poster = Container(
      width: 70,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade200,
        borderRadius: BorderRadius.circular(10.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          OImage.oNetwork(
            widget.image,
            sourceId: widget.sourceId,
            fit: BoxFit.cover,
          ),
          BlurredPartBackground(),
        ],
      ),
    );
    final titleAndSubtitle = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 3.0),
        Text(
          widget.title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        if (widget.subtitle != null)
          Text(
            widget.subtitle!,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(
                    context,
                  ).textTheme.titleMedium?.color?.withValues(alpha: 0.8),
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

        SizedBox(height: 2.0),

        ///
        SizedBox(height: 5.0),
        if (widget.description?.isNotEmpty == true)
          Text(
            widget.description!,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontSize: 12.0),
            maxLines: 2,
          ),
      ],
    );

    return InkWell(
      borderRadius: BorderRadius.circular(7),
      onTap: () {
        context.pop();
        context.push(widget.to);
      },
      child: Container(
          decoration: BoxDecoration(
            color: null,
            borderRadius: BorderRadius.circular(7.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 7.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              poster,
              SizedBox(width: 7.0),
              Expanded(child: titleAndSubtitle),
            ],
          )),
    );
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

class _GlobalSearchBarState extends State<GlobalSearchBar> with KaeruMixin {
  late final TextEditingController _controller;

  FocusNode? _focusNode;
  bool _showingSearchLayer = false;

  @override
  void initState() {
    super.initState();

    if (widget.keyword.isNotEmpty) {
      _setKeyword(widget.keyword);
    }
    _controller = TextEditingController(text: _keyword.value);
  }

  void _showSearchLayer() {
    if (_showingSearchLayer) return;
    _showingSearchLayer = true;
    showGeneralDialog(
        context: context,
        useRootNavigator: true,
        pageBuilder: (context, anim, anim2) {
          final theme = Theme.of(context);
          return GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Material(
                  color: Colors.transparent,
                  child: SafeArea(
                      child: Scaffold(
                          appBar: _buildGlobalSearchBar(true),
                          body: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Watch(() {
                                if (_keyword.value.isEmpty) {
                                  return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.search,
                                                color: theme
                                                    .colorScheme.secondary),
                                            SizedBox(width: 4.0),
                                            Text('Enter keyword to search',
                                                style: TextStyle(
                                                    color: theme
                                                        .colorScheme.secondary))
                                          ]));
                                }
                                return Flex(
                                    direction: Axis.vertical,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Text(_keyword.value),
                                      _buildKeywordSuggest(_keyword.value),
                                      Expanded(
                                          child: _buildSearchResults(
                                              _keyword.value))
                                    ]);
                              }))))));
        });
  }

  void _closeSearchLayer({bool changeMode = false}) {
    _focusNode?.unfocus();
    _focusNode = null;

    if (_showingSearchLayer) {
      Navigator.of(context, rootNavigator: true).pop();
      _showingSearchLayer = false;
    }
    if (changeMode && widget.pageIsSearch) {
      context.pop();
    }
  }

  Widget _buildKeywordSuggest(String keyword) {
    final response = get(Uri.parse(
        'https://suggestqueries.google.com/complete/search?client=chrome&q=$keyword'));
    return FutureBuilder(
        future: response.then((response) => response.statusCode == 200
            ? jsonDecode(response.body)[1]
            : throw Exception('Failed to get response')),
        builder: (context, snapshot) {
          if (snapshot.hasError) return SizedBox.shrink();

          final loading = snapshot.connectionState == ConnectionState.waiting;
          const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
          final random = Random();

          final data = loading
              ? List.generate(10, (_) {
                  int length = random.nextInt(7) + 4;
                  return String.fromCharCodes(
                    List.generate(length,
                        (_) => chars.codeUnitAt(random.nextInt(chars.length))),
                  );
                })
              : snapshot.data! as List;
          if (!snapshot.hasData || data.isEmpty) return SizedBox.shrink();

          final maxLines = 2;
          return Column(children: [
            Skeletonizer(
                enabled: loading,
                enableSwitchAnimation: true,
                child: SizedBox(
                  height: (50.0 * maxLines) + (4.0 * maxLines),
                  child: ClipRect(
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: data
                          .map((text) => GestureDetector(
                              onTap: () {
                                _controller.text = _keyword.value = text;
                              },
                              child: Chip(
                                label: Text(text),
                                padding: EdgeInsets.zero,
                              )))
                          .toList(),
                    ),
                  ),
                )),
            Divider(
              color: Colors.grey.withValues(alpha: 0.5),
              thickness: 1,
              height: 1,
            ),
          ]);
        });
  }

  Widget _buildSearchResults(String keyword) {
    if (keyword.isEmpty) {
      return SizedBox.shrink();
    }

    return Watch(() {
      final service = _getCurrentService(context);

      if (service is ABComicService) {
        return FutureBuilder(
            future: service.search(
                keyword: keyword, page: 1, filters: {}, quick: true),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Service.errorWidgetBuilder(
                    context,
                    error: snapshot.error,
                    service: null,
                    orElse: (err) => Text('Error: $err'),
                  ),
                );
              }

              final loading =
                  snapshot.connectionState == ConnectionState.waiting;
              final data = loading
                  ? List.generate(10, (_) => Comic.createFakeData())
                  : snapshot.data!.items;

              if (data.isEmpty) return SizedBox.shrink();

              return Skeletonizer(
                  enabled: loading,
                  enableSwitchAnimation: true,
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final comic = data.elementAt(index);

                        return _QuickSearchItem(
                            to: '/details_comic/${service.uid}/${comic.comicId}',
                            title: comic.name,
                            image: comic.image,
                            subtitle: comic.lastChap?.name,
                            description: comic.description ?? comic.notice,
                            sourceId: service.uid);
                      }));
            });
      }
      if (service is ABEigaService) {
        return FutureBuilder(
            future: service.search(
                keyword: keyword, page: 1, filters: {}, quick: true),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Service.errorWidgetBuilder(
                    context,
                    error: snapshot.error,
                    service: null,
                    orElse: (err) => Text('Error: $err'),
                  ),
                );
              }

              final loading =
                  snapshot.connectionState == ConnectionState.waiting;
              final data = loading
                  ? List.generate(10, (_) => Eiga.createFakeData())
                  : snapshot.data!.items;

              if (data.isEmpty) return SizedBox.shrink();

              return Skeletonizer(
                  enabled: loading,
                  enableSwitchAnimation: true,
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final eiga = data.elementAt(index);

                        return _QuickSearchItem(
                            to: '/details_eiga/${service.uid}/${eiga.eigaId}',
                            title: eiga.name,
                            image: eiga.image,
                            subtitle: eiga.lastEpisode?.name,
                            description: eiga.description ?? eiga.notice,
                            sourceId: service.uid);
                      }));
            });
      }

      throw Exception('Unknown service: ${service.runtimeType}');
    });
  }

  Service _getCurrentService(BuildContext context) {
    final routeName = GoRouter.of(context).state.name;

    late final Service service;
    if (_serviceSelect.value == null) {
      switch (routeName) {
        case 'home_comic':
          service = comicServices.first;
          break;
        case 'home_eiga':
          service = eigaServices.first;
          break;
        default:
          service = allServices.first;
      }
    } else {
      service = getService(_serviceSelect.value!);
    }

    return service;
  }

  Widget _buildServiceSelector() {
    return PopupMenuButton<String>(
      padding: EdgeInsets.all(3.0),
      menuPadding: EdgeInsets.all(5.0),
      offset: Offset(0, 18.0 * 2),
      icon: Watch(() {
        final service = _getCurrentService(context);

        return SizedBox(
          width: 2 * 12.0,
          height: 2 * 12.0,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: OImage.oNetwork(service.faviconUrl,
                  sourceId: service.uid, fit: BoxFit.cover)),
        );
      }),
      onSelected: (value) {
        _serviceSelect.value = value;
      },
      itemBuilder: (BuildContext context) => allServices.map((service) {
        return PopupMenuItem<String>(
          value: service.uid,
          height: 40.0,
          child: Row(children: [
            SizedBox(
              width: 2 * 12.0,
              height: 2 * 12.0,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: OImage.oNetwork(service.faviconUrl,
                      sourceId: service.uid, fit: BoxFit.cover)),
            ),
            SizedBox(width: 12.0),
            Text(service.name,
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400)),
          ]),
        );
      }).toList(),
    );
  }

  _AppBarExtended _buildGlobalSearchBar(bool focusing) {
    final theme = Theme.of(context);
    _focusNode = FocusNode();

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
              _buildServiceSelector()
            // IconButton(
            //   icon: Icon(
            //     MaterialCommunityIcons.arrow_left,
            //     color: theme.colorScheme.seconda ryFixedDim
            //         .withValues(alpha: 0.7),
            //   ),
            //   onPressed: () => _closeSearchLayer(changeMode: true),
            // )
            else
              IconButton(
                icon: Iconify(
                  Mdi.magnify,
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
                    // autofocus: focusing,
                    enabled: focusing,
                    controller: _controller,
                    // readOnly: _readonly,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      _setKeyword(value);
                    },
                    onSubmitted: (value) {
                      _closeSearchLayer();
                      switch (GoRouter.of(context).state.name) {
                        case 'search':
                        case 'search_comic':
                        case 'search_eiga':
                          context.replace("/search?q=$value");
                          break;
                        case 'home_comic':
                          context.push("/search?q=$value&from=comic");
                          break;
                        case 'home_eiga':
                          context.push("/search?q=$value&from=eiga");
                          break;
                        default:
                          context.push("/search?q=$value");
                          break;
                      }
                    },
                  )),
            ),
            Watch(() => AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
                child: (_keyword.value.isEmpty || !focusing)
                    ? (!Platform.isLinux && !Platform.isWindows)
                        ? IconButton(
                            icon: Iconify(Mdi.microphone),
                            onPressed: () async {
                              final completer = Completer();

                              if (Platform.isAndroid) {
                                final isServiceAvailable =
                                    await SpeechToTextGoogleDialog.getInstance()
                                        .showGoogleDialog(
                                            onTextReceived: (data) {
                                  completer.complete(data);
                                });
                                if (!isServiceAvailable) {
                                  completer.completeError(
                                      Exception('Platform not support API'));
                                }
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (context) => SpeechToText(
                                      onChanged: (text) =>
                                          completer.complete(text),
                                      onError: (error) =>
                                          completer.completeError(error)),
                                );
                              }

                              try {
                                final text = await completer.future;
                                _keyword.value = _controller.text = text;

                                _showSearchLayer();
                              } catch (error) {
                                showSnackBar(Text('Error: $error'));
                              }
                            })
                        : null
                    : IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          _keyword.value = '';
                        }))),
            if (!focusing) _buildButtonMore(),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonMore() {
    return PopupMenuButton<String>(
      icon: Iconify(
        Mdi.dots_vertical,
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
