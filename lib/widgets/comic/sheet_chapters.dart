import 'dart:async';
import 'dart:math';

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
import 'package:mediaquery_sizer/mediaquery_sizer.dart';

import '../../core_services/comic/main.dart';
import '../../downloader/comic_downloader.dart';

class SheetChapters extends StatefulWidget {
  final MetaComic comic;
  final ABComicService service;
  final String comicId;
  final Computed<Future<Map<String, WatchPageUpdated>?>> watchPageChapters;
  final Computed<Future<({ComicChapter chapter, WatchPageUpdated watchPage})?>>?
  lastReadChapter;
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
  late final _lastReadChapter = asyncComputed(
    () async => widget.lastReadChapter?.value,
  );
  late final _watchPageChapters = asyncComputed(
    () => widget.watchPageChapters.value,
  );

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
    final minChildSize = (40.0 / 100.h(context)) + .15;
    return DraggableScrollableSheet(
      expand: false,
      snap: true,
      snapSizes: [minChildSize, 0.5, 0.9],
      initialChildSize: max(widget.initialChildSize, minChildSize),
      minChildSize: minChildSize,
      maxChildSize: 0.9,
      builder: (context2, scrollController) {
        return Watch(() {
          bool notSelected = true;

          final lastReadChapter = _lastReadChapter.value;

          final currentChapterId =
              widget.currentChapterId ??
              lastReadChapter?.chapter.chapterId ??
              widget.comic.chapters.sortAsc.firstOrNull?.chapterId;

          final chapters = widget.comic.chapters.sortAsc.reversed;

          return Column(
            children: [
              // Header
              Watch(dependencies: [lastReadChapter], () {
                if (_itemSelected.value.isEmpty) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        lastReadChapter == null
                            ? 'Get start'
                            : lastReadChapter.chapter.name,
                      ).fontSize(20.0),
                      GFButton(
                        onPressed:
                            widget.comic.chapters.isNotEmpty
                                ? () {
                                  final url =
                                      "/details_comic/${widget.service.uid}/${widget.comicId}/view?chap=${lastReadChapter?.chapter.chapterId ?? widget.comic.chapters.sortAsc.first.chapterId}";
                                  final extra = {'comic': widget.comic};

                                  if (widget.replace) {
                                    context.pushReplacement(url, extra: extra);
                                  } else {
                                    context.push(url, extra: extra);
                                  }
                                }
                                : null,
                        text: lastReadChapter == null ? 'Start' : 'Continue',
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
                    Text(
                      'Selected ${_itemSelected.value.length}',
                    ).fontSize(20.0),
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
                              chapter: widget.comic.chapters.sortAsc.firstWhere(
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
                child:
                    chapters.isEmpty
                        ? Center(child: Text('No chapters').paddingAll(16.0))
                        : ListView.builder(
                          controller: scrollController,
                          addRepaintBoundaries: false,
                          // reverse
                          itemCount: chapters.length,
                          itemBuilder: (context2, index) {
                            final chapter = chapters.elementAt(
                              widget.reverse
                                  ? index
                                  : (chapters.length - 1 - index),
                            ); //[index];
                            final bool selected =
                                chapter.chapterId == currentChapterId;
                            if (selected && notSelected) {
                              notSelected = false;
                            }

                            final downloadedChapter = ComicDownloader.instance
                                .getDownloadedChapter(
                                  service: widget.service,
                                  comicId: widget.comicId,
                                  chapterId: chapter.chapterId,
                                );

                            return Watch(dependencies: [chapter, selected, downloadedChapter], () {
                              final watchPage =
                                  usePick(
                                    () =>
                                        _watchPageChapters.value?[chapter
                                            .chapterId],
                                  ).value;

                              final activeKey = GlobalKey();
                              WidgetsBinding.instance.addPostFrameCallback((
                                timeStamp,
                              ) {
                                Timer(Duration(milliseconds: 70), () {
                                  if (activeKey.currentContext != null) {
                                    Scrollable.ensureVisible(
                                      activeKey.currentContext!,
                                      duration: Duration(milliseconds: 200),
                                    );
                                  }
                                });
                              });

                              return Container(
                                key: selected && notSelected ? activeKey : null,
                                color:
                                    _itemSelected.value.contains(
                                          chapter.chapterId,
                                        )
                                        ? context.theme.colorScheme.onSurface
                                            .withValues(alpha: 0.2)
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            chapter.name,
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight:
                                                  selected
                                                      ? FontWeight.w500
                                                      : null,
                                              color:
                                                  selected
                                                      ? Theme.of(
                                                        context,
                                                      ).colorScheme.tertiary
                                                      : Theme.of(
                                                        context,
                                                      ).colorScheme.onSurface,
                                            ),
                                          ),
                                          if (chapter.fullName != null)
                                            Text(
                                              chapter.fullName!,
                                              style: TextStyle(
                                                fontSize: 13.0,
                                                fontWeight:
                                                    selected
                                                        ? FontWeight.w500
                                                        : null,
                                                color:
                                                    selected
                                                        ? Theme.of(
                                                          context,
                                                        ).colorScheme.secondary
                                                        : Theme.of(context)
                                                            .colorScheme
                                                            .secondary
                                                            .withValues(
                                                              alpha: 0.7,
                                                            ),
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
                                                            .withValues(
                                                              alpha: 0.85,
                                                            ),
                                                fontSize: 12.0,
                                              ),
                                            ),
                                        ],
                                      ).expanded(),

                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth: 200,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            if (watchPage != null)
                                              SizedBox(
                                                width: 30,
                                                height: 30,
                                                child: DashedCircularProgressBar.aspectRatio(
                                                  aspectRatio: 1,
                                                  progress:
                                                      (watchPage.currentPage +
                                                          1) /
                                                      watchPage.totalPage *
                                                      100,
                                                  startAngle: 225,
                                                  sweepAngle: 270,
                                                  foregroundColor: Colors.green,
                                                  backgroundColor: const Color(
                                                    0xffeeeeee,
                                                  ),
                                                  foregroundStrokeWidth: 3,
                                                  backgroundStrokeWidth: 3,
                                                  animation: true,
                                                  seekSize: 3,
                                                  seekColor: const Color(
                                                    0xffeeeeee,
                                                  ),
                                                  child: Center(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
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
                                                  (
                                                    context,
                                                    snapshot,
                                                  ) => snapshot.when(
                                                    error:
                                                        (error, _) =>
                                                            Text(
                                                              '$error',
                                                              maxLines: 1,
                                                            ).expanded(),
                                                    loading:
                                                        () => SizedBox(
                                                          width: 4,
                                                          height: 4,
                                                        ),
                                                    data: (
                                                      downloadedChapter,
                                                      _,
                                                    ) {
                                                      if (downloadedChapter !=
                                                              null &&
                                                          downloadedChapter
                                                                  .doneAt >
                                                              0) {
                                                        return Iconify(
                                                          Fluent.save24,
                                                        );
                                                      }

                                                      return Watch(() {
                                                        final downloadState = ComicDownloader
                                                            .instance
                                                            .getDownloaderState(
                                                              service:
                                                                  widget
                                                                      .service,
                                                              comicId:
                                                                  widget
                                                                      .comicId,
                                                              chapterId:
                                                                  chapter
                                                                      .chapterId,
                                                            );
                                                        if (downloadState !=
                                                            null) {
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
                                                          icon: Row(
                                                            children: [
                                                              if (downloadedChapter !=
                                                                  null)
                                                                Text(
                                                                  '${(downloadedChapter.count / downloadedChapter.pageCount) * 100}%',
                                                                  maxLines: 1,
                                                                ),
                                                              Iconify(
                                                                Ion.download,
                                                              ),
                                                            ],
                                                          ),
                                                          onPressed: () async {
                                                            try {
                                                              await ComicDownloader.instance.downloadChapter(
                                                                service:
                                                                    widget
                                                                        .service,
                                                                comicId:
                                                                    widget
                                                                        .comicId,
                                                                metaComic:
                                                                    widget
                                                                        .comic,
                                                                chapterId:
                                                                    chapter
                                                                        .chapterId,
                                                                chapter:
                                                                    chapter,
                                                                pages: await widget
                                                                    .service
                                                                    .getPages(
                                                                      widget
                                                                          .comicId,
                                                                      chapter
                                                                          .chapterId,
                                                                    ),
                                                              );
                                                            } catch (error) {
                                                              showSnackBar(
                                                                Text(
                                                                  'Download error: $error',
                                                                ),
                                                              );
                                                            }
                                                          },
                                                        );
                                                      });
                                                    },
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ).paddingSymmetric(
                                    vertical: 16.0,
                                    horizontal: 16.0,
                                  ),
                                  onTap: () {
                                    if (_itemSelected.value.isNotEmpty) {
                                      return _toggleSelect(chapter);
                                    }

                                    final url =
                                        "/details_comic/${widget.service.uid}/${widget.comicId}/view?chap=${chapter.chapterId}";
                                    final extra = {'comic': widget.comic};

                                    if (widget.replace) {
                                      context.pushReplacement(
                                        url,
                                        extra: extra,
                                      );
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
        });
      },
    );
  }
}
