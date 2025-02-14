import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/book/book_base_service.dart';
import 'package:hoyomi/core_services/interfaces/basic_image.dart';
import 'package:hoyomi/core_services/book/interfaces/meta_book.dart';

import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:hoyomi/screens/home_book/manga_reader.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hoyomi/widgets/book/icon_button_follow.dart';
import 'package:hoyomi/widgets/book/icon_button_open_browser.dart';
import 'package:hoyomi/widgets/book/icon_button_share.dart';

class DetailsComicReader extends StatefulWidget {
  final String sourceId;
  final String bookId;
  final String chapterId;
  final MetaBook? book;

  const DetailsComicReader(
      {super.key,
      required this.sourceId,
      required this.bookId,
      required this.chapterId,
      required this.book});

  @override
  createState() => _DetailsComicReaderState();
}

class _DetailsComicReaderState extends State<DetailsComicReader> {
  late Future<List<BasicImage>> _pagesFuture;
  late Future<MetaBook> _metaBookFuture;
  MetaBook? _metaBook;
  late final BookBaseService _service;
  final ValueNotifier<Chapter?> _chapter = ValueNotifier(null);
  final ValueNotifier<bool> _showToolbar = ValueNotifier(true);

  @override
  void initState() {
    _service = getBookService(widget.sourceId);
    _pagesFuture = _service.getPages(widget.bookId, widget.chapterId);
    _metaBook = null;
    _metaBookFuture = widget.book != null
        ? Future.value(widget.book)
        : _service.getDetails(widget.bookId);
    _metaBookFuture.then((book) {
      _chapter.value = book.chapters
          .firstWhere((element) => element.chapterId == widget.chapterId);
      setState(() {
        _metaBook = book;
      });
    });

    super.initState();
  }

  void _updateChapter(String chapterId) {
    _chapter.value = _metaBook!.chapters
        .firstWhere((element) => element.chapterId == chapterId);
  }

  void _updateEnabled(bool enabled) {
    _showToolbar.value = enabled;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        FutureBuilder<List<dynamic>>(
          key: Key(widget.bookId),
          future: Future.wait([_pagesFuture, _metaBookFuture]),
          builder: (context2, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                  child: UtilsService.errorWidgetBuilder(context,
                      error: snapshot.error,
                      orElse: (error) => Text('Error: $error')));
            }

            if (!snapshot.hasData || snapshot.data![0].isEmpty) {
              return const Center(child: Text('No data available.'));
            }

            final [pages as List<BasicImage>, metaBook as MetaBook] =
                snapshot.data!; //book] = snapshot.data!;

            return MangaReader(
                pages: pages.toList(),
                service: _service,
                bookId: widget.bookId,
                book: metaBook,
                chapterId: widget.chapterId,
                getPages: (String chap) =>
                    _service.getPages(widget.bookId, chap),
                onChangeChap: _updateChapter,
                onChangeEnabled: _updateEnabled);
          },
        ),
        _AppBar(
          book: _metaBook,
          chapter: _chapter,
          enabled: _showToolbar,
          service: _service,
          bookId: widget.bookId,
        )
      ]),
    );
  }
}

class _AppBar extends StatefulWidget {
  final MetaBook? book;
  final ValueNotifier<Chapter?> chapter;
  final ValueNotifier<bool> enabled;
  final BookBaseService service;
  final String bookId;

  const _AppBar({
    required this.book,
    required this.chapter,
    required this.enabled,
    required this.service,
    required this.bookId,
  });

  @override
  createState() => _AppBarState();
}

class _AppBarState extends State<_AppBar> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.enabled,
        builder: (context, value, child) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) {
              const begin = Offset(0.0, 50.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
            child: value
                ? ClipRRect(
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: AppBar(
                          backgroundColor: Theme.of(context)
                              .scaffoldBackgroundColor
                              .withValues(alpha: 0.8),
                          elevation: 0,
                          leading: IconButton(
                            icon: const Icon(MaterialCommunityIcons.arrow_left),
                            onPressed: () {
                              context.pop();
                            },
                          ),
                          title: ValueListenableBuilder(
                              valueListenable: widget.chapter,
                              builder: (context, value, child) {
                                return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: (widget.book != null)
                                        ? [
                                            Text(
                                              widget.book!.name,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 2),
                                            if (value != null)
                                              Text(
                                                value.name,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white70),
                                              ),
                                          ]
                                        : []);
                              }),
                          actions: [
                            IconButtonFollow(
                                sourceId: widget.service.uid,
                                bookId: widget.bookId,
                                book: widget.book),
                            IconButtonOpenBrowser(
                                url: widget.service.getURL(widget.bookId,
                                    chapterId:
                                        widget.chapter.value?.chapterId)),
                            IconButtonShare()
                          ],
                        )))
                : null,
          );
        });
  }
}
