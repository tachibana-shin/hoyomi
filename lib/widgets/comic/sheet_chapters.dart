import 'dart:async';

import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/constraints/fluent.dart';
import 'package:hoyomi/utils/format_time_ago.dart';
import 'package:hoyomi/widgets/iconify.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:kaeru/kaeru.dart';

import '../../core_services/comic/main.dart';
import '../../downloader/comic_downloader.dart';

class SheetChapters extends StatefulWidget {
  final MetaComic comic;
  final ABComicService service;
  final String comicId;
  final Map<String, WatchPageUpdated> watchPageChapters;
  final ({ComicChapter chapter, WatchPageUpdated watchPage})? lastReadChapter;
  final String? currentChapterId;
  final bool replace;
  final bool reverse;

  final double initialChildSize;

  const SheetChapters({
    super.key,
    required this.comic,
    required this.service,
    required this.comicId,
    required this.watchPageChapters,
    required this.lastReadChapter,
    this.currentChapterId,
    this.replace = false,
    this.reverse = false,
    required this.initialChildSize,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SheetChaptersState createState() => _SheetChaptersState();
}

class _SheetChaptersState extends State<SheetChapters> with KaeruMixin {
  late final _itemSelected = ref<Set<String>>({});

  void _toggleSelect(ComicChapter chapter) {
    if (_itemSelected.value.contains(chapter.chapterId)) {
      _itemSelected.value.remove(chapter.chapterId);
      _itemSelected.value = {..._itemSelected.value};
    } else {
      _itemSelected.value = {..._itemSelected.value, chapter.chapterId};
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentChapterId =
        widget.currentChapterId ?? widget.comic.chapters.first.chapterId;

    return DraggableScrollableSheet(
      expand: false,
      snap: true,
      snapSizes: [0.15, 0.5, 0.9],
      initialChildSize: widget.initialChildSize,
      minChildSize: .15,
      maxChildSize: 0.9,
      builder: (context2, scrollController) {
        final lastReadChapter = widget.lastReadChapter;

        final activeKey = GlobalKey();
        bool notSelected = true;

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Timer(Duration(milliseconds: 70), () {
            if (activeKey.currentContext != null) {
              Scrollable.ensureVisible(
                activeKey.currentContext!,
                duration: Duration(milliseconds: 200),
              );
            }
          });
        });

        return Column(
          children: [
            // Header
            Watch(() {
              if (_itemSelected.value.isEmpty) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      lastReadChapter == null
                          ? 'Get start'
                          : 'Continue ${lastReadChapter.chapter.name}',
                    ).fontSize(20.0),
                    GFButton(
                      onPressed: () {
                        final url =
                            "/details_comic/${widget.service.uid}/${widget.comicId}/view?chap=${lastReadChapter?.chapter.chapterId ?? widget.comic.chapters.first.chapterId}";
                        final extra = {'comic': widget.comic};

                        if (widget.replace) {
                          context.pushReplacement(url, extra: extra);
                        } else {
                          context.push(url, extra: extra);
                        }
                      },
                      text:
                          widget.lastReadChapter == null ? 'Start' : 'Continue',
                      shape: GFButtonShape.pills,
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ).paddingHorizontal(16.0);
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Selected ${_itemSelected.value.length}').fontSize(20.0),
                  IconButton(
                    icon: Iconify(Ion.download),
                    onPressed: () async {
                      final selected = _itemSelected.value;
                      _itemSelected.value = {};

                      for (final chapterId in selected) {
                        try {
                          await ComicDownloader.instance.downloadChapter(
                            service: widget.service,
                            comicId: widget.comicId,
                            metaComic: widget.comic,
                            chapterId: chapterId,
                            chapter: widget.comic.chapters.firstWhere(
                              (element) => element.chapterId == chapterId,
                            ),
                            pages: await widget.service.getPages(
                              widget.comicId,
                              chapterId,
                            ),
                          );
                        } catch (error) {
                          showSnackBar(Text('Download error: $error'));
                        }
                      }
                    },
                  ),
                ],
              ).paddingHorizontal(16.0);
            }),
            // Chapters List
            FractionallySizedBox(
              heightFactor: 1.0,
              child: ListView.builder(
                controller: scrollController,
                // reverse
                itemCount: widget.comic.chapters.length,
                itemBuilder: (context2, index) {
                  final chapter = widget.comic.chapters.elementAt(
                    widget.reverse
                        ? index
                        : (widget.comic.chapters.length - 1 - index),
                  ); //[index];
                  final bool selected = chapter.chapterId == currentChapterId;
                  if (selected && notSelected) {
                    notSelected = false;
                  }

                  final watchPage = widget.watchPageChapters[chapter.chapterId];

                  final downloadedChapter = ComicDownloader.instance
                      .getDownloadedChapter(
                        service: widget.service,
                        comicId: widget.comicId,
                        chapterId: chapter.chapterId,
                      );

                  return Watch(() {
                    return Container(
                      key: selected && notSelected ? activeKey : null,
                      color:
                          _itemSelected.value.contains(chapter.chapterId)
                              ? context.theme.colorScheme.onSurface.withValues(
                                alpha: 0.2,
                              )
                              : null,
                      child: InkWell(
                        enableFeedback: true,
                        autofocus: selected,

                        focusColor: Colors.transparent,
                        child: Row(
                          children: [
                            if (selected)
                              Iconify(
                                Ion.play,
                                size: 20,
                                color: Colors.green.shade500,
                              ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  [
                                    chapter.name,
                                    if (chapter.fullName != null)
                                      ' - ${chapter.fullName}',
                                  ].join(''),
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight:
                                        selected ? FontWeight.w500 : null,
                                    color:
                                        selected
                                            ? Theme.of(
                                              context,
                                            ).colorScheme.onSurface
                                            : Theme.of(context)
                                                .colorScheme
                                                .onSurface
                                                .withValues(alpha: 0.85),
                                  ),
                                ),
                                if (chapter.time != null)
                                  Text(
                                    formatTimeAgo(chapter.time!),
                                    style: TextStyle(
                                      color:
                                          selected
                                              ? Theme.of(
                                                context,
                                              ).colorScheme.secondary
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .secondary
                                                  .withValues(alpha: 0.85),
                                      fontSize: 12.0,
                                    ),
                                  ),
                              ],
                            ).expanded(),

                            Row(
                              children: [
                                if (watchPage != null)
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: DashedCircularProgressBar.aspectRatio(
                                      aspectRatio: 1,
                                      progress:
                                          (watchPage.currentPage + 1) /
                                          watchPage.totalPage *
                                          100,
                                      startAngle: 225,
                                      sweepAngle: 270,
                                      foregroundColor: Colors.green,
                                      backgroundColor: const Color(0xffeeeeee),
                                      foregroundStrokeWidth: 3,
                                      backgroundStrokeWidth: 3,
                                      animation: true,
                                      seekSize: 3,
                                      seekColor: const Color(0xffeeeeee),
                                      child: Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              '${((watchPage.currentPage + 1) / watchPage.totalPage * 100).toInt()}',
                                            ).fontSize(12.0),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                FutureBuilder(
                                  future: downloadedChapter,
                                  builder:
                                      (context, snapshot) => snapshot.when(
                                        error:
                                            (error, _) =>
                                                Text(
                                                  '$error',
                                                  maxLines: 1,
                                                ).expanded(),
                                        loading: () => SizedBox(width: 4, height: 4),
                                        data:
                                            (downloadedChapter, _) => Watch(() {
                                              if (downloadedChapter.value !=
                                                  null) {
                                                return Iconify(Fluent.save24);
                                              }

                                              final downloadState =
                                                  ComicDownloader.instance
                                                      .getDownloaderState(
                                                        service: widget.service,
                                                        comicId: widget.comicId,
                                                        chapterId:
                                                            chapter.chapterId,
                                                      );
                                              if (downloadState != null) {
                                                return Watch(() {
                                                  if (downloadState
                                                          .value
                                                          .done ==
                                                      true) {
                                                    return Iconify(
                                                      Fluent.save24,
                                                    );
                                                  }
                                                  return Text(
                                                    'DL.${(downloadState.value.progress * 100).round()}%',
                                                  );
                                                });
                                              }

                                              return IconButton(
                                                icon: Iconify(Ion.download),
                                                onPressed: () async {
                                                  ComicDownloader.instance
                                                      .downloadChapter(
                                                        service: widget.service,
                                                        comicId: widget.comicId,
                                                        metaComic: widget.comic,
                                                        chapterId:
                                                            chapter.chapterId,
                                                        chapter: chapter,
                                                        pages: await widget
                                                            .service
                                                            .getPages(
                                                              widget.comicId,
                                                              chapter.chapterId,
                                                            ),
                                                      );
                                                },
                                              );
                                            }),
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ).paddingSymmetric(vertical: 16.0, horizontal: 16.0),
                        onTap: () {
                          if (_itemSelected.value.isNotEmpty) {
                            return _toggleSelect(chapter);
                          }

                          final url =
                              "/details_comic/${widget.service.uid}/${widget.comicId}/view?chap=${chapter.chapterId}";
                          final extra = {'comic': widget.comic};

                          if (widget.replace) {
                            context.pushReplacement(url, extra: extra);
                          } else {
                            context.push(url, extra: extra);
                          }
                        },
                        onLongPress: () => _toggleSelect(chapter),
                      ),
                    );
                  });
                },
              ),
            ).expanded(),
          ],
        );
      },
    );
  }
}
