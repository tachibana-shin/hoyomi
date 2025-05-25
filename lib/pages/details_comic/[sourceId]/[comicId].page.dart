import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/comic/main.dart';
import 'package:hoyomi/core_services/mixin/export.dart';
import 'package:hoyomi/core_services/exception/captcha_required_exception.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/utils/export.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:kaeru/kaeru.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';
import 'package:path/path.dart' show join;

import '../../../downloader/comic_downloader.dart';
import '../../../plugins/export.dart';

class DetailsComic extends StatefulWidget {
  final String sourceId;
  final String comicId;
  final MetaComic? comic;

  const DetailsComic({
    super.key,
    required this.sourceId,
    required this.comicId,
    required this.comic,
  });

  @override
  createState() => _DetailsComicState();
}

class _DetailsComicState extends State<DetailsComic>
    with SingleTickerProviderStateMixin, KaeruMixin {
  late final ABComicService _service = getComicService(widget.sourceId);

  late final AnimationController _bottomSheetAnimationController;

  final ScrollController _scrollController = ScrollController();

  late final _isTitleVisible = ref(false);
  late final _comic = ref<MetaComic>(MetaComic.createFakeData());
  late final _comicIsFake = _comic.select((value) => value.fake);
  late final _title = computed(
    () => _comic.value.fake ? '' : _comic.value.name,
  );
  late final _suggest = computed<Future<List<Comic>?>>(() async {
    if (_comicIsFake.value) {
      return Completer<List<Comic>>().future;
    }

    try {
      return await _service.getSuggest(_comic.value);
    } on UnimplementedError {
      return null;
    }
  });
  late final _watchPageChapters =
      computed<Future<Map<String, WatchPageUpdated>?>>(() async {
        if (_comicIsFake.value) return null;

        if (_service is ComicWatchPageMixin) {
          final chapters = _comic.value.chapters.sortAsc;

          try {
            return await (_service as ComicWatchPageMixin).getWatchPageEpisodes(
              comicId: widget.comicId,
              chapters: chapters,
            );
          } on UnimplementedError {
            return null;
          }
        }

        return null;
      });
  late final _lastReadChapter = computed<
    Future<({ComicChapter chapter, WatchPageUpdated watchPage})?>
  >(() {
    return _watchPageChapters.value.then((watchPageChapters) {
      final watchPage = watchPageChapters?.entries
          .fold<MapEntry<String, WatchPageUpdated>?>(null, (prev, element) {
            if (prev == null) return element;
            return element.value.updatedAt.isAfter(prev.value.updatedAt)
                ? element
                : prev;
          });

      if (watchPage == null) return null;

      final chapter = _comic.value.chapters.sortAsc.firstWhereOrNull(
        (chapter) => chapter.chapterId == watchPage.key,
      );
      if (chapter == null) return null;

      return (chapter: chapter, watchPage: watchPage.value);
    });
  });

  @override
  void initState() {
    super.initState();

    _bottomSheetAnimationController = AnimationController(vsync: this);
    _scrollController.addListener(() {
      final isTitleVisible = _scrollController.offset > 50;

      if (_isTitleVisible.value != isTitleVisible && mounted) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          _isTitleVisible.value = isTitleVisible;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context2) {
    return PullRefreshPage(
      initialData: widget.comic,
      onLoadData: () async {
        try {
          return await _service
              .getDetails(widget.comicId)
              .then((comic) => _comic.value = comic);
        } catch (error) {
          final meta = await ComicDownloader.instance.getMetaOffline(
            _service,
            widget.comicId,
          );
          if (meta != null) return meta.copyWith(offlineMode: true);

          rethrow;
        }
      },
      onLoadFake: () => _comic.value = MetaComic.createFakeData(),
      builderError:
          (body) => Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              scrolledUnderElevation: 0.0,
              leading: IconButton(
                icon: const Iconify(Ion.chevron_left),
                onPressed: () {
                  context.pop();
                },
              ),
            ),
            body: body,
          ),
      builder:
          (comic, _) => Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              scrolledUnderElevation: 0.0,
              leading: IconButton(
                icon: Iconify(Ion.chevron_left),
                onPressed: () {
                  context.pop();
                },
              ),
              title: Watch(
                () => AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: _isTitleVisible.value ? 1.0 : 0.0,
                  child: Text(_title.value),
                ),
              ),
              actions: [
                if (_service is ComicAuthMixin && AuthMixin.support(_service))
                  _AvatarUser(service: _service),
                IconButtonShare(),
                Watch(
                  () => IconButtonFollow(
                    sourceId: widget.sourceId,
                    comicId: widget.comicId,
                    comic: _comic.value,
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    _handleMenuSelection(context, value);
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      _buildMenuItem('download', 'Download'),
                      _buildMenuItem('find_similar', 'Find similar'),
                      _buildMenuItem('open_browser', 'Open with browser'),
                      _buildMenuItem('create_shortcut', 'Create shortcut'),
                    ];
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(
                16.0,
              ).add(EdgeInsets.only(bottom: 15.h(context))),
              controller: _scrollController,
              child: _buildContainer(comic),
            ),
            bottomSheet: BottomSheet(
              animationController: _bottomSheetAnimationController,
              showDragHandle: true,
              builder: (context) => _buildSheetChapters(),
              onClosing: () {},
            ),
          ),
    );
  }

  Widget _buildContainer(MetaComic comic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Column: Comic Image
            SizedBox(
              width: min((1 / 3 * 100).w(context), 120),
              child: AspectRatio(
                aspectRatio: 2 / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.file(
                    File(
                      join(
                        applicationDocumentDirectory.path,
                        ComicDownloader.expectedPosterPath(
                          _service,
                          widget.comicId,
                        ),
                      ),
                    ),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return OImage.oNetwork(
                        comic.image,
                        sourceId: widget.sourceId,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            // Right Column: Comic Information
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comic.name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                if (comic.originalName != null) ...[
                  SizedBox(height: 4.0),
                  Text(
                    comic.originalName!,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Theme.of(context).colorScheme.secondary,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                const SizedBox(height: 8.0),
                if (comic.author != null)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Iconify(Ic.round_account_circle, size: 18.0),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          comic.author!,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                if (comic.translator != null)
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Iconify(Mdi.translate_variant, size: 18.0),
                        SizedBox(width: 8.0),
                        Text(
                          comic.translator!,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(
                    top: comic.translator != null ? 2.0 : 8.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Iconify(Ion.play_outline, size: 18.0),
                      SizedBox(width: 8.0),
                      Text(
                        {
                              StatusEnum.ongoing: "On going",
                              StatusEnum.completed: "Completed",
                              StatusEnum.canceled: "Canceled",
                              StatusEnum.unknown: "Unknown",
                              StatusEnum.onHiatus: "On hiatus",
                              StatusEnum.publishingFinished:
                                  "Publishing finished",
                            }[comic.status] ??
                            comic.status.toString(),
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.lightGreen,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ).expanded(),
          ],
        ),
        const SizedBox(height: 16.0),
        _buildInfoScreen(),
        const SizedBox(height: 16.0),
        // Row(
        //   children: [
        //     Watch(() => Expanded(child: _buildButtonRead(comic))),
        //     const SizedBox(width: 8.0),
        //     _buildButtonDownload(),
        //   ],
        // ),
        // const SizedBox(height: 20.0),

        // Comment
        if (_service is ComicCommentMixin && !comic.offlineMode)
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Comments(
              fake: comic.fake,
              getComments: ({page, parent}) {
                return (_service as ComicCommentMixin).getComments(
                  ComicCommentContext(
                    comicId: widget.comicId,
                    metaComic: comic,
                    parent: parent,
                  ),
                  page: page,
                );
              },
              deleteComment: ({required comment, parent}) {
                return (_service as ComicCommentMixin).deleteComment(
                  ComicCommentContext(
                    comicId: widget.comicId,
                    metaComic: comic,
                    parent: parent,
                  ),
                  comment: comment,
                );
              },
              setLikeComment: ({required comment, parent, required value}) {
                return (_service as ComicCommentMixin).setLikeComment(
                  ComicCommentContext(
                    comicId: widget.comicId,
                    metaComic: comic,
                    parent: parent,
                  ),
                  comment: comment,
                  value: value,
                );
              },
              controller: null,
              preview: true,
            ),
          ),

        // Description Category
        Text(
          'Description',
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 7.0),
        HtmlWidget(comic.description, textStyle: TextStyle(fontSize: 14.0)),

        const SizedBox(height: 24.0),

        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children:
              comic.genres.map((genre) {
                return InkWell(
                  onTap: () {
                    ///
                    context.push(
                      "/category_comic/${_service.uid}/${genre.genreId}",
                    );
                  },
                  child: Chip(label: Text(genre.name)),
                );
              }).toList(),
        ),
        SizedBox(height: 24.0),
        if (!comic.offlineMode) _buildSuggest(comic),
      ],
    );
  }

  Widget _buildInfoScreen() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Watch(() {
              final comic = _comic.value;

              return Table(
                columnWidths: const {
                  0: FixedColumnWidth(100),
                  1: FlexColumnWidth(),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  if (comic.offlineMode)
                    _buildTableRow(
                      'Status',
                      null,
                      Text('Offline', style: TextStyle(color: Colors.red[500])),
                    ),
                  _buildTableRow(
                    'Source',
                    null,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AvatarService(_service, radius: 10.0),
                        4.0.widthBox,
                        Text(
                          _service.name,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  // if (comic.author != null)
                  //   _buildTableRow('Author', comic.author!),
                  if (comic.translator != null)
                    _buildTableRow('Translate', comic.translator!),
                  if (comic.rate != null)
                    _buildTableRow(
                      'Rate',
                      null,
                      Row(
                        children: [
                          ...List.generate(
                            comic.rate!.value.floor(),
                            (index) => Icon(
                              Icons.star,
                              size: 16.0,
                              color: Colors.blue.shade200,
                            ),
                          ),
                          if (comic.rate!.value % 1 != 0)
                            Icon(
                              Icons.star_half,
                              size: 16.0,
                              color: Colors.blue.shade200,
                            ),
                          ...List.generate(
                            (comic.rate!.best - comic.rate!.value).floor(),
                            (index) => Icon(
                              Icons.star,
                              size: 16.0,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant
                                  .withValues(alpha: 0.5),
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            "(${comic.rate!.count})",
                            style: TextStyle(
                              fontSize: 14.0,
                              color:
                                  Theme.of(context).colorScheme.inverseSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  // _buildTableRow(
                  //     'Status',
                  //     switch (comic.status) {
                  //       StatusEnum.ongoing => "On going",
                  //       StatusEnum.completed => "Completed",
                  //       StatusEnum.canceled => "Canceled",
                  //       StatusEnum.unknown => "Unknown",
                  //       StatusEnum.onHiatus => "On hiatus",
                  //       StatusEnum.publishingFinished => "Publishing finished",
                  //     }),
                  if (comic.views != null)
                    _buildTableRow('Views', formatNumber(comic.views!)),
                  _buildTableRow(
                    'Last Updated',
                    formatTimeAgo(comic.lastModified),
                  ),
                  _buildTableRow(
                    'Last Read',
                    null,
                    FutureBuilder(
                      future: _lastReadChapter.value,
                      builder:
                          (context, snapshot) => snapshot.when(
                            data:
                                (lastReadChapter, isComplete) => Text(
                                  lastReadChapter == null
                                      ? '(No data)'
                                      : '${lastReadChapter.chapter.name} of ${comic.chapters.sortAsc.length}',
                                ),
                            error:
                                (error, stack) => Text(
                                  'Error: $error',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                            loading: () => Text('Loading...'),
                          ),
                    ),
                  ),

                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          'Read Progress',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                      FutureBuilder(
                        future: _watchPageChapters.value,
                        builder:
                            (context, snapshot) => snapshot.when(
                              data:
                                  (watchPageChapters, isComplete) => Text(
                                    watchPageChapters == null
                                        ? '(No data)'
                                        : '${((watchPageChapters.values.fold(0.0, (prev, item) => prev + item.currentPage / item.totalPage) / comic.chapters.sortAsc.length) * 100).round()}%',
                                    style: TextStyle(
                                      color:
                                          Theme.of(
                                            context,
                                          ).colorScheme.secondary,
                                      fontSize: 14,
                                    ),
                                  ),
                              error:
                                  (error, stack) => Text(
                                    'Error: $error',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                              loading: () => Text('Loading...'),
                            ),
                      ),
                    ],
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label, [String? value, Widget? child]) {
    assert(child != null || value != null);

    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        child ??
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                value!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 14,
                ),
                textAlign: TextAlign.start,
              ),
            ),
      ],
    );
  }

  // Widget _buildButtonRead(MetaComic comic) {
  //   //    _historyChapters

  //   // final current = _historyChapters.value?.entries.isNotEmpty == true
  //   //     ? _historyChapters.value?.entries.reduce(
  //   //         (a, b) => a.value.updatedAt.isAfter(b.value.updatedAt) ? a : b,
  //   //       )
  //   //     : null;
  //   final current = null;
  //   final currentEpisodeIndex = current == null
  //       ? null
  //       : comic.chapters.sortAsc.toList().lastIndexWhere((chapter) {
  //           return current.key == chapter.chapterId;
  //         });
  //   final totalEpisodes = comic.chapters.sortAsc.length;

  //   return ClipRRect(
  //     clipBehavior: Clip.antiAlias,
  //     borderRadius: BorderRadius.circular(35),
  //     child: InkWell(
  //       onTap: () {
  //         if (currentEpisodeIndex != null) {
  //           context.push(
  //             "/details_comic/${widget.sourceId}/${widget.comicId}/view?chap=${comic.chapters.sortAsc.elementAt(currentEpisodeIndex).chapterId}",
  //             extra: {'comic': comic},
  //           );
  //         } else {
  //           context.push(
  //             "/details_comic/${widget.sourceId}/${widget.comicId}/view?chap=${comic.chapters.sortAsc.first.chapterId}",
  //             extra: {'comic': comic},
  //           );
  //         }
  //       },
  //       borderRadius: BorderRadius.circular(35),
  //       child: Stack(
  //         children: [
  //           Container(
  //             height: 48,
  //             decoration: BoxDecoration(
  //               color: Theme.of(
  //                 context,
  //               ).colorScheme.tertiaryFixed.withValues(alpha: 0.3),
  //               //.tertiaryContainer,
  //               borderRadius: BorderRadius.circular(35),
  //             ),
  //           ),
  //           Container(
  //             height: 48,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(35),
  //                 bottomLeft: Radius.circular(35),
  //               ),
  //             ),
  //             clipBehavior: Clip.antiAlias,
  //             child: AnimatedFractionallySizedBox(
  //               duration: const Duration(milliseconds: 300),
  //               curve: Curves.easeInOut,
  //               alignment: Alignment.centerLeft,
  //               widthFactor: currentEpisodeIndex == null
  //                   ? 0
  //                   : (totalEpisodes - currentEpisodeIndex) / totalEpisodes,
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   color: Theme.of(
  //                     context,
  //                   ).colorScheme.tertiaryFixedDim.withValues(alpha: 0.6),
  //                   borderRadius: BorderRadius.only(
  //                     topLeft: Radius.circular(35),
  //                     bottomLeft: Radius.circular(35),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           // Text content
  //           Container(
  //             height: 48,
  //             alignment: Alignment.center,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text(
  //                   currentEpisodeIndex == null ? 'Read now' : 'Continue',
  //                   style: TextStyle(
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.w500,
  //                     color: Theme.of(
  //                       context,
  //                     ).colorScheme.onSurface, //.withValues(alpha: 0.6),
  //                   ),
  //                 ),
  //                 Text(
  //                   currentEpisodeIndex == null
  //                       ? '$totalEpisodes chapters'
  //                       : '${comic.chapters.sortAsc.elementAt(currentEpisodeIndex).name} of $totalEpisodes',
  //                   style: TextStyle(
  //                     fontSize: 12,
  //                     color: Theme.of(
  //                       context,
  //                     ).colorScheme.onSurface.withValues(alpha: 0.9),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildButtonDownload() {
  //   return Container(
  //     width: 48,
  //     height: 48,
  //     decoration: BoxDecoration(
  //       color: Theme.of(
  //         context,
  //       ).colorScheme.tertiaryFixedDim.withValues(alpha: 0.44),
  //       shape: BoxShape.circle,
  //     ),
  //     child: Center(
  //       child: IconButton(
  //         onPressed: () {},
  //         icon: Iconify(MaterialSymbols.download),
  //         iconSize: 48 / 2,
  //       ),
  //     ),
  //   );
  // }

  Widget _buildSuggest(MetaComic comic) {
    return Watch(
      () => HorizontalComicList(
        itemsFuture: _suggest.value.then(
          (value) =>
              value
                  ?.map(
                    (comic) =>
                        ComicExtend(comic: comic, sourceId: _service.uid),
                  )
                  .toList() ??
              const <ComicExtend>[],
        ),
        // totalItems: _suggestFuture!.then((value) => value.totalItems),
        title: 'Suggest',
      ),
    );
  }

  PopupMenuItem<String> _buildMenuItem(String id, String text) {
    return PopupMenuItem<String>(value: id, child: Text(text));
  }

  void _handleMenuSelection(BuildContext context, String id) {
    switch (id) {
      case 'download':
        _downloadContent();
        break;
      case 'find_similar':
        context.push(
          '/details_comic/${widget.sourceId}/${widget.comicId}/similar',
          extra: {'comic': _comic},
        );
        break;
      case 'open_browser':
        IconButtonOpenBrowser.open(_service.getURL(widget.comicId));
        // _openInBrowser(context);
        break;
      case 'create_shortcut':
        // _createShortcut(context);
        break;
    }
  }

  void _downloadContent() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Download'),
          content: const Text('Download content'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text('Download'),
              onPressed: () async {
                // final downloader = ComicDownloader();

                // await downloader.initDatabase();

                // final pages = await _service.getPages(
                //   widget.comicId,
                //   _comic.value.chapters.sortAsc.first.chapterId,
                // );

                // final result = await downloader.downloadChapter(
                //   service: _service,
                //   comicId: widget.comicId,
                //   metaComic: _comic.value,
                //   chapterId:
                //       _comic.value.chapters.sortAsc.first.chapterId, // chapterId,
                //   chapter: _comic.value.chapters.sortAsc.first,
                //   pages: pages,
                // );

                // watch$([result.progress, result.error, result.done], () {
                //   print(
                //     'progress: ${result.progress.value}, error: ${result.error.value}, done: ${result.done.value}',
                //   );
                // }, immediate: true);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildSheetChapters() {
    return SheetChapters(
      comic: _comic.value,
      service: _service,
      comicId: widget.comicId,
      watchPageChapters: _watchPageChapters,
      lastReadChapter: _lastReadChapter,
      reverse: true,
      // histories: _historyChapters.value,
      initialChildSize: 0.15,
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
//             theme.scaffoldBackgroundColor.withValues(alpha: 0.05),
//             theme.scaffoldBackgroundColor,
//           ],
//           stops: const [0, .3],
//         ),
//       ),
//     );
//   }
// }

class _ButtonLike extends StatefulWidget {
  final String comicId;
  final MetaComic comic;
  final ABComicService service;

  const _ButtonLike({
    required this.comicId,
    required this.comic,
    required this.service,
  });

  @override
  createState() => _ButtonLikeState();
}

class _ButtonLikeState extends State<_ButtonLike> {
  bool? _liked;
  int? _likes = 0;

  @override
  void initState() {
    super.initState();
    _likes = widget.comic.likes;

    if (widget.service is ComicFollowMixin) {
      (widget.service as ComicFollowMixin)
          .isFollow(comicId: widget.comicId)
          .then((liked) {
            if (mounted) {
              setState(() {
                _liked = liked;
              });
            }
          })
          .catchError((error) {
            if (error is! CaptchaRequiredException) {
              showSnackError('like', error); // 显示錯誤訊息
            }
          });
    }
  }

  void _onTap(MetaComic comic) {
    final value = !(_liked ?? false);

    (widget.service as ComicFollowMixin)
        .setFollow(comicId: widget.comicId, metaComic: comic, value: value)
        .then((_) {
          if (mounted) {
            setState(() {
              _liked = value;
              _likes =
                  value
                      ? (widget.comic.likes ?? 0) + 1
                      : widget.comic.likes! - 1;
            });
          }
        })
        .catchError((error) {
          if (error is! CaptchaRequiredException) {
            showSnackError('like', error); // 显示錯誤訊息
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          (widget.service is ComicAuthMixin &&
                  !(widget.service as AuthMixin).$noAuth)
              ?  () => _onTap(widget.comic)
              : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Iconify(
                _liked ?? false
                    ? Ic.baseline_thumb_up_alt
                    : Ic.outline_thumb_up_alt,
                size: 20.0,
                color: Colors.blueGrey.shade100,
              ),
              const SizedBox(height: 4.0),
              Text(
                _likes != null ? formatNumber(_likes!) : '?',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.blueGrey.shade100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AvatarUser extends StatefulWidget {
  final ABComicService service;

  const _AvatarUser({required this.service});

  @override
  createState() => _AvatarUserState();
}

class _AvatarUserState extends State<_AvatarUser> with KaeruMixin {
  late final UserData _userData;

  @override
  void initState() {
    super.initState();

    _userData = widget.service.getUserData();

    watch([_userData.error], () {
      if (_userData.error.value != null) {
        showSnackBar(Text('Sign in failed: ${_userData.error.value}'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Watch(() {
      final user = _userData.user.value;

      if (user != null) {
        return Tooltip(
          message: user.fullName,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Theme.of(context).colorScheme.onSurface,
            child: OImage.network(
              user.photoUrl,
              sourceId: widget.service.uid,
              fit: BoxFit.cover,
            ),
          ),
        );
      }

      return GestureDetector(
        onTap: () async {
          await context.push("/webview/${widget.service.uid}");
        },
        child: CircleAvatar(
          radius: 15,
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          child: Icon(
            Icons.account_circle,
            color: Theme.of(context).colorScheme.primary,
            size: 30,
          ),
        ),
      );
    });
  }
}
