import 'dart:ui';

import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/comic/main.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/screens/export.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:kaeru/kaeru.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../downloader/comic_downloader.dart';

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
  late Future<ComicModes> _modeFuture;

  late final _metaComic = ref<MetaComic?>(null);
  late final ABComicService _service;
  late final _chapter = ref<ComicChapter?>(null);
  late final _showToolbar = ref<bool>(true);

  @override
  void initState() {
    _service = getComicService(widget.sourceId);
    final downloadedChapter = ComicDownloader.instance
        .getDownloadedChapter(
          service: _service,
          comicId: widget.comicId,
          chapterId: widget.chapterId,
        )
        .catchError((_) => null); // tolerate local DB errors

    _pagesFuture = downloadedChapter.then((downloaded) {
      if (downloaded != null && downloaded.doneAt > 0) {
        return ComicDownloader.getPagesWithOffline(downloaded);
      }

      return _service.getPages(widget.comicId, widget.chapterId);
    });
    _metaComicFuture =
        widget.comic != null
            ? Future.value(widget.comic)
            : _service.getDetails(widget.comicId).catchError((error) async {
              final meta = await ComicDownloader.instance.getMetaOffline(
                _service,
                widget.comicId,
              );
              if (meta != null) return meta.copyWith(offlineMode: true);

              throw error;
            });
    _metaComicFuture.then((comic) {
      _chapter.value = comic.chapters.sortAsc.firstWhere(
        (element) => element.chapterId == widget.chapterId,
      );

      _metaComic.value = comic;
    });

    final asyncPrefs = SharedPreferencesAsync();
    _modeFuture = asyncPrefs
        .getString('comic_mode_${widget.comicId}')
        .then((value) {
          if (value == null) throw Exception('not found');

          return ComicModes.values.firstWhere(
            (element) => element.name == value,
          );
        })
        .catchError(
          (error) => _metaComicFuture.then((comic) async {
            try {
              final out = await _service.getComicModes(comic);

              return out;
            } catch (error) {
              return ComicModes.webToon;
            }
          }),
        );

    super.initState();
  }

  void _updateChapter(String chapterId) {
    _chapter.value = _metaComic.value!.chapters.sortAsc.firstWhere(
      (element) => element.chapterId == chapterId,
    );
  }

  void _updateEnabled(bool enabled) {
    _showToolbar.value = enabled;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Watch(
          () => AnimatedSlide(
            duration: Duration(milliseconds: 300),
            offset: _showToolbar.value ? Offset(0, 0) : Offset(0, -1),
            curve: Curves.easeInOut,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: _showToolbar.value ? 1.0 : 0.0,
              child: _AppBarExtended(
                child: _AppBar(
                  comic: _metaComic,
                  chapter: _chapter,
                  enabled: _showToolbar,
                  service: _service,
                  comicId: widget.comicId,
                  showButtonMeta: widget.comic == null,
                ),
              ),
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          FutureBuilder<List<dynamic>>(
            key: Key(widget.comicId),
            future: Future.wait([_pagesFuture, _metaComicFuture, _modeFuture]),
            builder: (context2, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(
                  child: Service.errorWidgetBuilder(
                    context,
                    error: snapshot.error,
                    trace: snapshot.stackTrace,
                    service: _service,
                    orElse: (error) => Text('Error: $error'),
                  ),
                );
              }

              if (!snapshot.hasData || snapshot.data![0].isEmpty) {
                return const Center(child: Text('No data available.'));
              }

              final [
                pages as List<OImage>,
                metaComic as MetaComic,
                mode as ComicModes,
              ] = snapshot.data!; //comic] = snapshot.data!;

              return MangaReader(
                pages: pages.toList(),
                service: _service,
                comicId: widget.comicId,
                comic: metaComic,
                mode: mode,
                chapterId: widget.chapterId,
                getPages:
                    (String chap) => _service.getPages(widget.comicId, chap),
                onChangeChap: _updateChapter,
                onChangeEnabled: _updateEnabled,
              );
            },
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
  final bool showButtonMeta;

  const _AppBar({
    required this.comic,
    required this.chapter,
    required this.enabled,
    required this.service,
    required this.comicId,
    required this.showButtonMeta,
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
                            scrolledUnderElevation: 0.0,
                            leading: HBackButton(),
                            title: Watch(() {
                              return Text(
                                <String>[
                                  if (widget.chapter.value case final chapter?)
                                    chapter.name,
                                  if (widget.chapter.value?.fullName
                                      case final fullName?)
                                    if (fullName.isNotEmpty) fullName,
                                  if (widget.comic.value case final comic?)
                                    comic.name,
                                ].join(' - '),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
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
                              if (widget.showButtonMeta)
                                IconButton(
                                  icon: const Iconify(Ion.menu),
                                  onPressed:
                                      () => context.pushReplacementNamed(
                                        'details_comic',
                                        pathParameters: {
                                          'sourceId': widget.service.uid,
                                          'comicId': widget.comicId,
                                        },
                                        extra: {'comic': widget.comic.value},
                                      ),
                                ),
                              IconButtonFollow(
                                service: widget.service,
                                comicId: widget.comicId,
                                comic: widget.comic,
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
        child: Semantics(explicitChildNodes: true, child: widget.child),
      ),
    );
  }
}
