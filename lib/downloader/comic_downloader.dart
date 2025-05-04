
import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:hoyomi/core_services/comic/main.dart';
import 'package:kaeru/kaeru.dart';
import 'package:retry/retry.dart';
import 'package:pool/pool.dart';

typedef DownloaderChapterReturn =
    ({Ref<bool> done, Ref<Object?> error, Ref<double> progress});

/// Design filesystem
/// 
/// comic_offline
///   truyenqq
///     meta.json (3)
///     tonikaku-kawaii-992
///       meta.json (2)
///       chapter-1-2245
///         meta.json (1)
///         page-1.jpg
///         page-2.jpg
///         page-3.jpg
///         page-4.jpg
///         page-5.jpg
///         page-6.jpg
///         page-7.jpg
///
///
///
/// Annotation 
/// 
/// meta.json (1) - the data is chapter List<OImage> but source replaced with local example page-1.jpg...
/// meta.json (2) - the json data like model { data: MetaComic; offline: [chapterId] }. chapterId example is chapter-1-2245....
/// 
///
///
class ComicDownloader {
  final _storeChaptersDownload = <String, DownloaderChapterReturn>{};

  DownloaderChapterReturn downloadChapter({
    required ABComicService service,
    required String comicId,
    required MetaComic metaComic,
    required String chapterId,
    required ComicChapter chapter,
    required List<OImage> pages,
  }) {
    final uid = '$chapterId@$comicId@${service.uid}';
    if (_storeChaptersDownload.containsKey(uid)) {
      return _storeChaptersDownload[uid]!;
    }

    final done = Ref(false);
    final $mapProgress = List.generate(pages.length, (_) => 0.0);
    final progress = Ref(0.0);
    final error = Ref<Object?>(null);

    void computeTotalProgress() {
      progress.value =
          $mapProgress.fold(0.0, (old, current) => old + current) /
          pages.length;
    }

    final pool = Pool(10);
    final retry = RetryOptions();

    Future.wait<void>(
          pages.indexed.map(
            (entry) => pool.withResource(
              retry.retry<void>(() async {
                    service.fetch(entry.$2.src, headers: entry.$2.headers);
                    late final Uint8List buffer;
                    try {
                      buffer = await service.fetchPage(entry.$2, (
                        count,
                        total,
                      ) {
                        $mapProgress[entry.$1] = count / total;
                        computeTotalProgress();
                      });
                      $mapProgress[entry.$1] = 1;
                      computeTotalProgress();
                    } on UnimplementedError {
                      buffer = Uint8List.fromList(
                        (await service.dioCache.get(
                          entry.$2.src,
                          options: Options(
                            headers: entry.$2.headers?.toMap(),
                            responseType: ResponseType.bytes,
                          ),
                          onReceiveProgress: (count, total) {
                            $mapProgress[entry.$1] = count / total;
                            computeTotalProgress();
                          },
                        )).data,
                      );
                      $mapProgress[entry.$1] = 1;
                      computeTotalProgress();
                    }

                    // save to file
                  })
                  as FutureOr Function(),
            ),
          ),
        )
        .then((_) {
          progress.value = 1;
        })
        .catchError((err) {
          error.value = err;
        });

    return _storeChaptersDownload[uid] = (
      progress: progress,
      done: done,
      error: error,
    );
  }
}
