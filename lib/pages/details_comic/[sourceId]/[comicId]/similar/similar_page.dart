import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/comic/main.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/screens/export.dart';
import 'package:hoyomi/widgets/export.dart';

class SimilarPage extends StatefulWidget {
  final String sourceId;
  final String comicId;
  final MetaComic? comic;

  const SimilarPage({
    super.key,
    required this.sourceId,
    required this.comicId,
    this.comic,
  });

  @override
  State<SimilarPage> createState() => _SimilarPageState();
}

class _SimilarPageState extends State<SimilarPage> {
  Future<String> _getKeyword() {
    if (widget.comic case final comic?) {
      return Future.value(comic.name);
    }

    return getComicService(
      widget.sourceId,
    ).getDetails(widget.comicId).then((value) => value.name);
  }

  @override
  Widget build(BuildContext context) {
    return PullRefreshPage<String>(
      onLoadData: () => _getKeyword(),
      onLoadFake: () => 'Keyword search',
      builderError: (body) => Scaffold(appBar: _buildAppBar(''), body: body),
      builder:
          (keyword, param) => Scaffold(
            appBar: _buildAppBar(keyword),
            body: _buildBody(keyword),
          ),
    );
  }

  AppBar _buildAppBar(String keyword) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      scrolledUnderElevation: 0.0,
      leading: HBackButton(),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            keyword,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2),
          Text(
            "Results search",
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(String keyword) {
    return ComicSearchResults(keyword: keyword);
  }
}
