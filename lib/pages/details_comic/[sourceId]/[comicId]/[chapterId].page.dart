import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/comic/comic_service.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_chapter.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/comic/interfaces/meta_comic.dart';

import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:hoyomi/screens/home_comic/manga_reader.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hoyomi/widgets/comic/icon_button_follow.dart';
import 'package:hoyomi/widgets/comic/icon_button_open_browser.dart';
import 'package:hoyomi/widgets/comic/icon_button_share.dart';

class DetailsComicReader extends StatefulWidget {
  final String sourceId;
  final String comicId;
  final String chapterId;
  final MetaComic? comic;

  const DetailsComicReader({
    super.key,
    required this.sourceId,
    required this.comicId,
    required this.chapterId,
    required this.comic,
  });

  @override
  createState() => _DetailsComicReaderState();
}

class _DetailsComicReaderState extends State<DetailsComicReader> {
  late Future<List<OImage>> _pagesFuture;
  late Future<MetaComic> _metaComicFuture;
  MetaComic? _metaComic;
  late final ComicService _service;
  final ValueNotifier<ComicChapter?> _chapter = ValueNotifier(null);
  final ValueNotifier<bool> _showToolbar = ValueNotifier(true);

  @override
  void initState() {
    _service = getComicService(widget.sourceId);
    _pagesFuture = _service.getPages(widget.comicId, widget.chapterId);
    _metaComic = null;
    _metaComicFuture =
        widget.comic != null
            ? Future.value(widget.comic)
            : _service.getDetails(widget.comicId);
    _metaComicFuture.then((comic) {
      _chapter.value = comic.chapters.firstWhere(
        (element) => element.chapterId == widget.chapterId,
      );
      setState(() {
        _metaComic = comic;
      });
    });

    super.initState();
  }

  void _updateChapter(String chapterId) {
    _chapter.value = _metaComic!.chapters.firstWhere(
      (element) => element.chapterId == chapterId,
    );
  }

  void _updateEnabled(bool enabled) {
    _showToolbar.value = enabled;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<List<dynamic>>(
            key: Key(widget.comicId),
            future: Future.wait([_pagesFuture, _metaComicFuture]),
            builder: (context2, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(
                  child: UtilsService.errorWidgetBuilder(
                    context,
                    error: snapshot.error,
                    orElse: (error) => Text('Error: $error'),
                  ),
                );
              }

              if (!snapshot.hasData || snapshot.data![0].isEmpty) {
                return const Center(child: Text('No data available.'));
              }

              final [pages as List<OImage>, metaComic as MetaComic] =
                  snapshot.data!; //comic] = snapshot.data!;

              return MangaReader(
                pages: pages.toList(),
                service: _service,
                comicId: widget.comicId,
                comic: metaComic,
                chapterId: widget.chapterId,
                getPages:
                    (String chap) => _service.getPages(widget.comicId, chap),
                onChangeChap: _updateChapter,
                onChangeEnabled: _updateEnabled,
              );
            },
          ),
          _AppBar(
            comic: _metaComic,
            chapter: _chapter,
            enabled: _showToolbar,
            service: _service,
            comicId: widget.comicId,
          ),
        ],
      ),
    );
  }
}

class _AppBar extends StatefulWidget {
  final MetaComic? comic;
  final ValueNotifier<ComicChapter?> chapter;
  final ValueNotifier<bool> enabled;
  final ComicService service;
  final String comicId;

  const _AppBar({
    required this.comic,
    required this.chapter,
    required this.enabled,
    required this.service,
    required this.comicId,
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
            const begin = Offset(0.0, -50.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
          child:
              value
                  ? ClipRRect(
                    child: SizedBox(
                      height: 53.0,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: AppBar(
                          backgroundColor: Theme.of(
                            context,
                          ).scaffoldBackgroundColor.withValues(alpha: 0.8),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    (widget.comic != null)
                                        ? [
                                          Text(
                                            widget.comic!.name,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 2),
                                          if (value != null)
                                            Text(
                                              value.name,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white70,
                                              ),
                                            ),
                                        ]
                                        : [],
                              );
                            },
                          ),
                          actions: [
                            IconButtonFollow(
                              sourceId: widget.service.uid,
                              comicId: widget.comicId,
                              comic: widget.comic,
                            ),
                            IconButtonOpenBrowser(
                              url: widget.service.getURL(
                                widget.comicId,
                                chapterId: widget.chapter.value?.chapterId,
                              ),
                            ),
                            IconButtonShare(),
                          ],
                        ),
                      ),
                    ),
                  )
                  : null,
        );
      },
    );
  }
}
