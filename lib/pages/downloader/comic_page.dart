import 'dart:io';
import 'dart:math';

import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:filesize/filesize.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/comic/export.dart';
import 'package:hoyomi/downloader/comic_downloader.dart';
import 'package:hoyomi/plugins/export.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:kaeru/kaeru.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';
import 'package:path/path.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DownloaderComicPage extends StatefulWidget {
  const DownloaderComicPage({super.key});

  @override
  createState() => _DownloaderComicPageState();
}

class _DownloaderComicPageState extends State<DownloaderComicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Downloader'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        scrolledUnderElevation: 0.0,
      ),
      body: PullRefreshPage(
        onLoadData: () async => ValueKey(''),
        onLoadFake: () => ValueKey(''),
        builder:
            (data, _) => SingleChildScrollView(
              child: Column(
                children: [
                  // Text('Downloading'),
                  // Watch(() {
                  //   final allDownloader =
                  //       ComicDownloader.instance.getAllDownloaderState();
                  //   return ListView.builder(
                  //     itemCount: allDownloader.length,
                  //     itemBuilder: (context, index) {
                  //       final downloader = allDownloader.elementAt(index);

                  //       final comic = downloader.value.comic;

                  //       return Row(
                  //         children: [
                  //           AspectRatio(
                  //             aspectRatio: 2 / 3,
                  //             child: ClipRRect(
                  //               borderRadius: BorderRadius.circular(8.0),
                  //               child: Skeleton.replace(
                  //                 replacement: Image.asset(
                  //                   'assets/images/blank.png',
                  //                   fit: BoxFit.cover,
                  //                 ),
                  //                 child: OImage.oNetwork(
                  //                   downloader.value.comic.image,
                  //                   sourceId: downloader.value.service.uid,
                  //                   fit: BoxFit.cover,
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           7.0.widthBox,
                  //           Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 comic.name,
                  //                 style: const TextStyle(
                  //                   fontSize: 20.0,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //                 maxLines: 3,
                  //                 overflow: TextOverflow.ellipsis,
                  //               ),
                  //               if (comic.originalName != null) ...[
                  //                 SizedBox(height: 4.0),
                  //                 Text(
                  //                   comic.originalName!,
                  //                   style: TextStyle(
                  //                     fontSize: 14.0,
                  //                     color:
                  //                         Theme.of(
                  //                           context,
                  //                         ).colorScheme.secondary,
                  //                     height: 1.2,
                  //                   ),
                  //                   maxLines: 2,
                  //                   overflow: TextOverflow.ellipsis,
                  //                 ),
                  //               ],
                  //               const SizedBox(height: 8.0),
                  //               if (comic.author != null)
                  //                 Row(
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.center,
                  //                   children: [
                  //                     const Iconify(
                  //                       Ic.round_account_circle,
                  //                       size: 18.0,
                  //                     ),
                  //                     SizedBox(width: 8.0),
                  //                     Expanded(
                  //                       child: Text(
                  //                         comic.author!,
                  //                         overflow: TextOverflow.ellipsis,
                  //                         style: const TextStyle(
                  //                           fontSize: 14.0,
                  //                           fontWeight: FontWeight.w500,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               if (comic.translator != null)
                  //                 Padding(
                  //                   padding: EdgeInsets.only(top: 8.0),
                  //                   child: Row(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.center,
                  //                     children: [
                  //                       const Iconify(
                  //                         Mdi.translate_variant,
                  //                         size: 18.0,
                  //                       ),
                  //                       SizedBox(width: 8.0),
                  //                       Text(
                  //                         comic.translator!,
                  //                         style: const TextStyle(
                  //                           fontSize: 14.0,
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               // Text(
                  //               //   '${downloader.value.progress.toStringAsFixed(2)}%',
                  //               //   style: Theme.of(context).textTheme.bodyText1,
                  //               // ),
                  //             ],
                  //           ).expanded(),
                  //         ],
                  //       );
                  //     },
                  //   );
                  // }),
                  // Text('Done'),
                  Watch(() {
                    return FutureBuilder(
                      future: ComicDownloader.instance.getAllDownloadedComics(),
                      builder:
                          (context, snapshot) => snapshot.when(
                            data: (allDownloader, _) {
                              return Column(
                                children:
                                    allDownloader.map((downloader) {
                                      final comic = downloader.meta;

                                      final header = Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: min(180.0, 30.w(context)),
                                            child: AspectRatio(
                                              aspectRatio: 2 / 3,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Skeleton.replace(
                                                  replacement: Image.asset(
                                                    'assets/images/blank.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                  child: Image.file(
                                                    File(
                                                      join(
                                                        applicationDocumentDirectory
                                                            .path,
                                                        ComicDownloader.expectedPosterPath(
                                                          getComicService(
                                                            downloader.sourceId,
                                                          ),
                                                          downloader.comicId,
                                                        ),
                                                      ).replaceAll(
                                                        RegExp(r'\\'),
                                                        '/',
                                                      ),
                                                    ),
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (
                                                      context,
                                                      error,
                                                      stack,
                                                    ) {
                                                      if (kDebugMode) {
                                                        print('Error: $error');
                                                        print(stack);
                                                      }
                                                      return Image.asset(
                                                        'assets/images/blank.png',
                                                        fit: BoxFit.cover,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          7.0.widthBox,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                              if (comic.originalName !=
                                                  null) ...[
                                                SizedBox(height: 4.0),
                                                Text(
                                                  comic.originalName!,
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color:
                                                        Theme.of(
                                                          context,
                                                        ).colorScheme.secondary,
                                                    height: 1.2,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                              const SizedBox(height: 8.0),
                                              if (comic.author != null)
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    const Iconify(
                                                      Ic.round_account_circle,
                                                      size: 18.0,
                                                    ),
                                                    SizedBox(width: 8.0),
                                                    Expanded(
                                                      child: Text(
                                                        comic.author!,
                                                        overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                        style: const TextStyle(
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              if (comic.translator != null)
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 8.0,
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Iconify(
                                                        Mdi.translate_variant,
                                                        size: 18.0,
                                                      ),
                                                      SizedBox(width: 8.0),
                                                      Text(
                                                        comic.translator!,
                                                        style: const TextStyle(
                                                          fontSize: 14.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              // Text(
                                              //   '${downloader.value.progress.toStringAsFixed(2)}%',
                                              //   style: Theme.of(context).textTheme.bodyText1,
                                              // ),
                                            ],
                                          ).expanded(),
                                        ],
                                      );

                                      final main = Container(
                                        decoration: BoxDecoration(
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.onSecondary,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Watch(() {
                                            return Column(
                                              children:
                                                  comic.chapters.sortAsc
                                                      .where(
                                                        (chapter) => downloader
                                                            .chapters
                                                            .containsKey(
                                                              chapter.chapterId,
                                                            ),
                                                      )
                                                      .map((chapter) {
                                                        final download =
                                                            downloader
                                                                .chapters[chapter
                                                                .chapterId]!;

                                                        final progress =
                                                            download.progress !=
                                                                    null
                                                                ? download
                                                                    .progress!
                                                                    .value
                                                                    .progress
                                                                : download.pages.fold(
                                                                      0,
                                                                      (
                                                                        prev,
                                                                        page,
                                                                      ) =>
                                                                          prev +
                                                                          (page.downloaded
                                                                              ? 1
                                                                              : 0),
                                                                    ) /
                                                                    download
                                                                        .pages
                                                                        .length;
                                                        final totalByteSize =
                                                            download.pages.fold(
                                                              0,
                                                              (prev, item) =>
                                                                  prev +
                                                                  item.size,
                                                            );

                                                        return Row(
                                                          children: [
                                                            Text(
                                                              chapter.name,
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    Theme.of(
                                                                          context,
                                                                        )
                                                                        .colorScheme
                                                                        .onSurface,
                                                              ),
                                                            ).paddingOnly(
                                                              right: 4.0,
                                                              top: 4.0,
                                                              bottom: 4.0,
                                                            ),
                                                            LinearProgressIndicator(
                                                              value: progress,
                                                            ).expanded(),
                                                            4.0.widthBox,
                                                            if (download.progress !=
                                                                    null
                                                                ? !download
                                                                    .progress!
                                                                    .value
                                                                    .done
                                                                : download
                                                                        .doneAt <=
                                                                    0) ...[
                                                              Text(
                                                                '${(progress * 100).round()}',
                                                              ).paddingOnly(
                                                                left: 2.0,
                                                              ),
                                                              if (download
                                                                      .progress ==
                                                                  null)
                                                                IconButton(
                                                                  icon: Iconify(
                                                                    Ion.download,
                                                                  ),
                                                                  onPressed: () {
                                                                    ComicDownloader.instance.downloadChapter(
                                                                      service: getComicService(
                                                                        downloader
                                                                            .sourceId,
                                                                      ),
                                                                      comicId:
                                                                          downloader
                                                                              .comicId,
                                                                      metaComic:
                                                                          downloader
                                                                              .meta,
                                                                      chapterId:
                                                                          download
                                                                              .chapterId,
                                                                      chapter: comic
                                                                          .chapters
                                                                          .sortAsc
                                                                          .firstWhere(
                                                                            (
                                                                              chapter,
                                                                            ) =>
                                                                                chapter.chapterId ==
                                                                                download.chapterId,
                                                                          ),
                                                                      pages:
                                                                          download
                                                                              .pages
                                                                              .map(
                                                                                (
                                                                                  page,
                                                                                ) =>
                                                                                    page.image,
                                                                              )
                                                                              .toList(),
                                                                    );
                                                                  },
                                                                ),
                                                            ] else
                                                              Text(
                                                                filesize(
                                                                  totalByteSize,
                                                                ),
                                                                style:
                                                                    TextStyle(
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                                maxLines: 1,
                                                              ),
                                                          ],
                                                        );
                                                      })
                                                      .toList(),
                                            );
                                          }),
                                        ),
                                      );

                                      return InkWell(
                                        onTap: () {
                                          context.push(
                                            '/details_comic/${downloader.sourceId}/${downloader.comicId}',
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            header,
                                            10.0.heightBox,
                                            main,
                                          ],
                                        ).paddingSymmetric(
                                          vertical: 8.0,
                                          horizontal: 16.0,
                                        ),
                                      );
                                    }).toList(),
                              );
                            },
                            loading:
                                () =>
                                    Center(child: CircularProgressIndicator()),
                            error:
                                (error, stackTrace) => Center(
                                  child: Service.errorWidgetBuilder(
                                    context,
                                    error: snapshot.error,
                                    trace: snapshot.stackTrace,
                                    service: null,
                                    orElse:
                                        (err) => Text(
                                          'Error: $err',
                                          textAlign: TextAlign.center,
                                        ),
                                  ),
                                ),
                          ),
                    );
                  }),
                ],
              ),
            ),
      ),
    );
  }
}
