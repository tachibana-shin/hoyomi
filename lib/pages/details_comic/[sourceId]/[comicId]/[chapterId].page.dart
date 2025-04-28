import 'dart:ui';

import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/comic/ab_comic_service.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_chapter.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/comic/interfaces/meta_comic.dart';

import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/screens/home_comic/manga_reader.dart';

import 'package:hoyomi/widgets/comic/icon_button_follow.dart';
import 'package:hoyomi/widgets/comic/icon_button_open_browser.dart';
import 'package:hoyomi/widgets/comic/icon_button_share.dart';
import 'package:hoyomi/widgets/iconify.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:kaeru/kaeru.dart';

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

class _DetailsComicReaderState extends State<DetailsComicReader>
    with KaeruMixin {
  late Future<List<OImage>> _pagesFuture;
  late Future<MetaComic> _metaComicFuture;
  late final _metaComic = ref<MetaComic?>(null);
  late final ABComicService _service;
  late final _chapter = ref<ComicChapter?>(null);
  late final _showToolbar = ref<bool>(true);

  @override
  void initState() {
    _service = getComicService(widget.sourceId);
    _pagesFuture = _service.getPages(widget.comicId, widget.chapterId);

    _metaComicFuture =
        widget.comic != null
            ? Future.value(widget.comic)
            : _service.getDetails(widget.comicId);
    _metaComicFuture.then((comic) {
      _chapter.value = comic.chapters.firstWhere(
        (element) => element.chapterId == widget.chapterId,
      );

      _metaComic.value = comic;
    });

    super.initState();
  }

  void _updateChapter(String chapterId) {
    _chapter.value = _metaComic.value!.chapters.firstWhere(
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
                  child: Service.errorWidgetBuilder(
                    context,
                    error: snapshot.error,
                    service: _service,
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
  final Ref<MetaComic?> comic;
  final Ref<ComicChapter?> chapter;
  final Ref<bool> enabled;
  final ABComicService service;
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

class _AppBarState extends State<_AppBar> with KaeruMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Watch(() {
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
              widget.enabled.value
                  ? ClipRRect(
                    child: SizedBox(
                      height: 54.0,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          color: Theme.of(
                            context,
                          ).scaffoldBackgroundColor.withValues(alpha: 0.8),
                          padding: EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 8.0,
                          ),
                          child: AppBar(
                            backgroundColor: Colors.transparent,
                            leading: IconButton(
                              icon: const Iconify(Ion.chevron_left),
                              onPressed: () {
                                context.pop();
                              },
                            ),
                            title: Watch(() {
                              return Text(
                                <String>[
                                  if (widget.chapter.value != null)
                                    widget.chapter.value!.name,
                                  if (widget.comic.value?.name != null)
                                    widget.comic.value!.name,
                                ].join(' - '),
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                              ).fontSize(16.0);
                              // return Column(
                              // mainAxisSize: MainAxisSize.min,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              // children: [
                              //   Text(
                              //     widget.comic.value?.name ?? '',
                              //     style: TextStyle(
                              //       fontSize: 16,
                              //       fontWeight: FontWeight.bold,
                              //     ),
                              //   ),
                              //   SizedBox(height: 2),
                              //   if (widget.chapter.value != null)
                              //     Text(
                              //       widget.chapter.value!.name,
                              //       style: TextStyle(
                              //         fontSize: 14,
                              //         color: Colors.white70,
                              //       ),
                              //     ),
                              // ],
                              // );
                            }),
                            actions: [
                              Watch(
                                () => IconButtonFollow(
                                  sourceId: widget.service.uid,
                                  comicId: widget.comicId,
                                  comic: widget.comic.value,
                                ),
                              ),
                              Watch(
                                () => IconButtonOpenBrowser(
                                  url: widget.service.getURL(
                                    widget.comicId,
                                    chapterId: widget.chapter.value?.chapterId,
                                  ),
                                ),
                              ),
                              IconButtonShare(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  : null,
        );
      }),
    );
  }
}
