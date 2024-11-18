import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/services/base_service.dart';

import 'package:honyomi/services/interfaces/meta_book.dart';
import 'package:honyomi/services/main.dart';
import 'package:honyomi/utils/format_number.dart';
import 'package:honyomi/utils/format_time_ago.dart';

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

  double _dragStartY = 0.0;

  @override
  void initState() {
    super.initState();

    _service = getService(widget.sourceId);
    _metaBookFuture = _service.getDetails(widget.slug);

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
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
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
              icon: const Icon(Icons.share), // 共有ボタン
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
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData) {
              return const Center(child: Text('No data available.'));
            }

            MetaBook book = snapshot.data!;
            _title = book.name;

            return Stack(children: [
              SingleChildScrollView(
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
                                Text(book.name,
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 3),
                                const SizedBox(height: 8.0),
                                if (book.author != null)
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.person, size: 18.0),
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
                                          Icon(Icons.translate, size: 18.0),
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
                                          Icon(Icons.play_arrow, size: 18.0),
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
                                        Icons.star,
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
                                    Icon(Icons.tv,
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
                                    Icon(Icons.thumb_up_off_alt,
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
                                    Icon(Icons.update,
                                        size: 20.0,
                                        color: Colors.blueGrey.shade100),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      formatTimeAgo(book.lastModified),
                                      maxLines: 1,
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
                                    Icon(Icons.star_border,
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
                  )),
              _bottomDetailsSheet(book, context),
            ]);
          },
        ),
      ),
    ]);
  }

  Widget _bottomDetailsSheet(MetaBook book, BuildContext contextParent) {
    return DraggableScrollableSheet(
      initialChildSize: .5,
      minChildSize: .5,
      maxChildSize: .8,
      builder: (context, scrollController) {
        return Listener(
          onPointerDown: (event) {
            _dragStartY = event.position.dy;
          },
          onPointerMove: (event) {
            final delta = event.position.dy - _dragStartY;
            if (delta.abs() > 5) {
              scrollController.jumpTo(scrollController.offset - delta);
              _dragStartY = event.position.dy;
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16.0),
              ),
            ),
            child: Column(
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "List chapters",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey.shade700,
                  height: 1.0,
                ),
                // Chapters List
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: book.chapters.length,
                    itemBuilder: (context2, index) {
                      final chapter = book.chapters.elementAt(index); //[index];
                      return ListTile(
                        title: Text(
                          chapter.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        subtitle: Text(
                          "${chapter.time}",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 12.0,
                          ),
                        ),
                        onTap: () {
                          contextParent.push(
                              "/details_comic/${widget.sourceId}/${widget.slug}/${chapter.slug}");
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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
}
