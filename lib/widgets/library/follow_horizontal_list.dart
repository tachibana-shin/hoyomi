import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hoyomi/controller/history.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic.dart' as i_comic;
import 'package:hoyomi/core_services/comic/interfaces/meta_comic.dart';
import 'package:hoyomi/database/scheme/comic.dart';
import 'package:hoyomi/widgets/comic/horizontal_comic_list.dart';

class FollowHorizontalList extends StatefulWidget {
  const FollowHorizontalList({super.key});

  @override
  State<FollowHorizontalList> createState() => _FollowHorizontalListState();
}

class _FollowHorizontalListState extends State<FollowHorizontalList> {
  late final Future<List<Comic>> _itemsFuture;

  @override
  initState() {
    super.initState();
    _itemsFuture = HistoryController().getListFollows(10, offset: 0);
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalComicList(
        itemsFuture: _itemsFuture.then((items) => items
            .map(
              (item) => ComicExtend(
                  sourceId: item.sourceId,
                  comic: i_comic.Comic.fromMeta(item.comicId,
                      comic: MetaComic.fromJson(jsonDecode(item.meta)))),
            )
            .toList()),
        more: '/library/follow',
        title: 'Follows');
  }
}
