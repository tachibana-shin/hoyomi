import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/core_services/base_service.dart';

import 'package:honyomi/core_services/interfaces/meta_book.dart';
import 'package:honyomi/core_services/main.dart';
import 'package:honyomi/utils/format_number.dart';
import 'package:honyomi/utils/format_time_ago.dart';
import 'package:honyomi/widgets/sheet_chapters.dart';

class DetailsComic extends StatefulWidget {
  final String sourceId;
  final String slug;

  const DetailsComic({super.key, required this.sourceId, required this.slug});

  @override
  createState() => _DetailsComicState();
}

class _DetailsComicState extends State<DetailsComic> {
  late Future<MetaBook> _metaBookFuture;
  late final BaseService _service;

  final ScrollController _scrollController = ScrollController();
  bool _isTitleVisible = false;
  String _title = "";
  MetaBook? _book;

  @override
  void initState() {
    super.initState();
    final context$ = context;

    _service = getService(widget.sourceId);
    _metaBookFuture = _service.getDetails(widget.slug);
    // ignore: body_might_complete_normally_catch_error
    _metaBookFuture.catchError((err) {
      if (_service.isCaptchaError(err)) {
        // ignore: use_build_context_synchronously
        getService(widget.sourceId).showCaptchaResolve(context$);
      }
    });

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final isTitleVisible = _scrollController.offset > 50;

    if (_isTitleVisible != isTitleVisible) {
      setState(() {
        _isTitleVisible = isTitleVisible;
      });
    }
  }

  @override
  Widget build(BuildContext context2) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(MaterialCommunityIcons.arrow_left),
            onPressed: () {
              context.pop();
            },
          ),
          title: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: _isTitleVisible ? 1.0 : 0.0,
            child: Text(_title),
          ),
          actions: [
            IconButton(
              icon: const Icon(MaterialCommunityIcons.share), // 共有ボタン
              onPressed: () {
                _shareContent(context);
              },
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                _handleMenuSelection(context, value);
              },
              itemBuilder: (BuildContext context) {
                return [
                  _buildMenuItem('download', 'Download'),
                  _buildMenuItem('open_browser', 'Open with browser'),
                  _buildMenuItem('create_shortcut', 'Create shortcut'),
                ];
              },
            ),
          ],
        ),
        body: FutureBuilder<MetaBook>(
          future: _metaBookFuture,
          builder: (context2, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              if (_service.isCaptchaError(snapshot.error)) {
                return Center(child: _service.templateCaptchaResolver(context));
              }

              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData) {
              return const Center(child: Text('No data available.'));
            }

            MetaBook book = snapshot.data!;
            _title = book.name;
            _book = book;

            return SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Column: Book Image
                        Expanded(
                          flex: 1,
                          child: AspectRatio(
                            aspectRatio: 2 / 3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                book.image.src,
                                headers: book.image.headers,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        // Right Column: Book Information
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                book.name,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8.0),
                              if (book.author != null)
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(MaterialCommunityIcons.account,
                                        size: 18.0),
                                    SizedBox(width: 8.0),
                                    Expanded(
                                        child: Text(
                                      book.author!,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                                  ],
                                ),
                              if (book.translator != null)
                                Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(MaterialCommunityIcons.translate,
                                            size: 18.0),
                                        SizedBox(width: 8.0),
                                        Text(
                                          book.translator!,
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    )),
                              if (book.status != null)
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: book.translator != null
                                            ? 2.0
                                            : 8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                            MaterialCommunityIcons.play_outline,
                                            size: 18.0),
                                        SizedBox(width: 8.0),
                                        Text(
                                          book.status!,
                                          style: const TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.lightGreen),
                                        ),
                                      ],
                                    )),
                              const SizedBox(height: 8.0),
                              if (book.rate != null)
                                Row(
                                  children: [
                                    Icon(
                                      MaterialCommunityIcons.star,
                                      color: Colors.yellow[700],
                                      size: 18.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                        '${book.rate!.value} / ${book.rate!.best} (${book.rate!.count} votes)'),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      color: Colors.black.withOpacity(0.1),
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(MaterialCommunityIcons.television,
                                      size: 20.0,
                                      color: Colors.blueGrey.shade100),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    book.views != null
                                        ? formatNumber(book.views!)
                                        : '?',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.blueGrey.shade100),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(MaterialCommunityIcons.thumb_up_outline,
                                      size: 20.0,
                                      color: Colors.blueGrey.shade100),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    book.likes != null
                                        ? formatNumber(book.likes!)
                                        : '?',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.blueGrey.shade100),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(MaterialCommunityIcons.update,
                                      size: 20.0,
                                      color: Colors.blueGrey.shade100),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    formatTimeAgo(book.lastModified),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.blueGrey.shade100),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(MaterialCommunityIcons.star_outline,
                                      size: 20.0,
                                      color: Colors.blueGrey.shade100),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    (book.rate != null)
                                        ? "${book.rate!.value} / ${book.rate!.best}"
                                        : "?", // 星星評分
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.blueGrey.shade100),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Description Section
                    Text(
                      'Description',
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10.0),
                    Text(book.description, style: TextStyle(fontSize: 14.0)),
                    const SizedBox(height: 24.0),

                    Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: book.genres.map((genre) {
                        return Chip(
                          padding: EdgeInsets.all(0),
                          label: Text(genre.name,
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        );
                      }).toList(),
                    ),
                  ],
                ));
          },
        ),
        bottomSheet: _buildSheetChapters());
  }

  PopupMenuItem<String> _buildMenuItem(String id, String text) {
    return PopupMenuItem<String>(
      value: id,
      child: Text(text),
    );
  }

  void _shareContent(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sharing the content...')),
    );
  }

  void _handleMenuSelection(BuildContext context, String id) {
    switch (id) {
      case 'download':
        // _downloadContent(context);
        break;
      case 'open_browser':
        // _openInBrowser(context);
        break;
      case 'create_shortcut':
        // _createShortcut(context);
        break;
    }
  }

  Widget? _buildSheetChapters() {
    if (_book == null) return null;
    return SheetChapters(
      book: _book!,
      sourceId: widget.sourceId,
      slug: widget.slug,
    );
  }
}

// class _BackgroundCover extends ConsumerWidget {
//   const _BackgroundCover({
//     required this.thumbnailUrl,
//     required this.scrollController,
//   });

//   final String thumbnailUrl;
//   final ScrollController scrollController;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final theme = Theme.of(context);

//     return ListenableBuilder(
//       listenable: scrollController,
//       builder: (_, child) {
//         final offset =
//             scrollController.hasClients ? scrollController.offset : 0;
//         final opacity = 1 - (offset / 200).clamp(0, 1).toDouble();

//         return Opacity(
//           opacity: opacity,
//           child: child,
//         );
//       },
//       child: GradientImage(
//         height: 480,
//         image: CachedNetworkImageProvider(
//           thumbnailUrl,
//           cacheManager: ref.watch(cacheManagerProvider),
//         ),
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             theme.scaffoldBackgroundColor.withOpacity(0.05),
//             theme.scaffoldBackgroundColor,
//           ],
//           stops: const [0, .3],
//         ),
//       ),
//     );
//   }
// }