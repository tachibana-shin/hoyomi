import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/comic/interfaces/meta_comic.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/screens/search/comic_search_results.dart';

class SimilarPage extends StatefulWidget {
  final String sourceId;
  final String comicId;
  final MetaComic? comic;

  const SimilarPage(
      {super.key, required this.sourceId, required this.comicId, this.comic});

  @override
  State<SimilarPage> createState() => _SimilarPageState();
}

class _SimilarPageState extends State<SimilarPage> {
  late final Future<String> _keyword;

  @override
  void initState() {
    if (widget.comic != null) {
      _keyword = Future.value(widget.comic!.name);
    } else {
      _keyword = getComicService(widget.sourceId)
          .getDetails(widget.comicId)
          .then((value) => value.name);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      scrolledUnderElevation: 0.0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context.pop();
        },
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(
              future: _keyword,
              builder: (context, snapshot) {
                return Text(
                  snapshot.data ?? "",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                );
              }),
          SizedBox(height: 2),
          Text(
            "Results search",
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return FutureBuilder(
        future: _keyword,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No news items found'));
          }

          return ComicSearchResults(keyword: snapshot.data!);
        });
  }
}
