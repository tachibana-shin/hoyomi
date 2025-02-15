import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hoyomi/controller/history.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic.dart';
import 'package:hoyomi/core_services/comic/interfaces/meta_comic.dart';
import 'package:hoyomi/database/scheme/comic.dart' as i_comic;
import 'package:hoyomi/widgets/comic/horizontal_comic_list.dart';

class HistoryHorizontalList extends StatefulWidget {
  const HistoryHorizontalList({super.key});

  @override
  State<HistoryHorizontalList> createState() => _HistoryHorizontalListState();
}

class _HistoryHorizontalListState extends State<HistoryHorizontalList> {
  late final Future<List<i_comic.Comic>> _itemsFuture;

  @override
  initState() {
    super.initState();
    _itemsFuture = HistoryController().getListHistory(10, offset: 0);
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalComicList(
      itemsFuture: _itemsFuture
          .then((items) async => Future.wait(items.map((item) async {
                final meta = MetaComic.fromJson(jsonDecode(item.meta));
                final comic = Comic.fromMeta(item.comicId, comic: meta);

                final current =
                    await HistoryController().getLastChapter(item.id!);

                final currentEpisodeIndex = current == null
                    ? -1
                    : meta.chapters.lastIndexWhere((chapter) {
                        return current.chapterId == chapter.chapterId;
                      });

                return ComicExtend(
                    sourceId: item.sourceId,
                    comic: comic,
                    percentRead: (meta.chapters.length - currentEpisodeIndex) /
                        meta.chapters.length);
              }))),
      more: '/library/history',
      title: 'History',
    );
  }
}
