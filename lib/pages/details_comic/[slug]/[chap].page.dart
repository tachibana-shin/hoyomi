import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/core_services/base_service.dart';
import 'package:honyomi/core_services/interfaces/basic_image.dart';
import 'package:honyomi/core_services/interfaces/meta_book.dart';

import 'package:honyomi/core_services/main.dart';
import 'package:honyomi/globals.dart';
import 'package:honyomi/views/reader/manga_reader.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class DetailsComicReader extends StatefulWidget {
  final String sourceId;
  final String slug;
  final String chap;

  const DetailsComicReader(
      {super.key,
      required this.sourceId,
      required this.slug,
      required this.chap});

  @override
  createState() => _DetailsComicReaderState();
}

class _DetailsComicReaderState extends State<DetailsComicReader>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late Future<Iterable<BasicImage>> _pagesFuture;
  late Future<MetaBook> _metaBookFuture;
  MetaBook? _metaBook;
  late final BaseService _service;

  @override
  void initState() {
    super.initState();

    _service = getService(widget.sourceId);
    _pagesFuture = _service.getPages(widget.slug, widget.chap);
    _metaBook = null;
    _metaBookFuture = _service.getDetails(widget.slug);
    _metaBookFuture.then((book) {
      setState(() {
        _metaBook = book;
      });
    });
  }

  Chapter? get _currentChapter =>
      _metaBook?.chapters.firstWhere((element) => element.slug == widget.chap);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Stack(children: [
        FutureBuilder<List<dynamic>>(
          future: Future.wait([_pagesFuture, _metaBookFuture]),
          builder: (context2, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              if (_service.isCaptchaError(snapshot.error)) {
                return Center(child: _service.templateCaptchaResolver(context));
              }

              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData || snapshot.data![0].isEmpty) {
              return const Center(child: Text('No data available.'));
            }

            final [pages as Iterable<BasicImage>, metaBook as MetaBook] =
                snapshot.data!; //book] = snapshot.data!;

            return Stack(children: [
              MangaReader(
                  pages: pages.toList(),
                  sourceId: widget.sourceId,
                  slug: widget.slug,
                  book: metaBook,
                  chapter: widget.chap,
                  getPages: (String chap) =>
                      _service.getPages(widget.slug, chap))
            ]);
          },
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: ClipRRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: AppBar(
                    backgroundColor: Theme.of(context)
                        .scaffoldBackgroundColor
                        .withOpacity(0.8),
                    elevation: 0,
                    leading: IconButton(
                      icon: const Icon(MaterialCommunityIcons.arrow_left),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: (_metaBook != null)
                          ? [
                              Text(
                                _metaBook!.name,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 2),
                              if (_currentChapter != null)
                                Text(
                                  _currentChapter!.name,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white70),
                                ),
                            ]
                          : [],
                    ),
                    actions: [
                      IconButton(
                        icon:
                            const Icon(MaterialCommunityIcons.bookmark_outline),
                        onPressed: () {},
                      ),
                      IconButton(
                          icon: const Icon(MaterialCommunityIcons.earth),
                          onPressed: _openInBrowser),
                      IconButton(
                        icon: const Icon(Icons.share),
                        onPressed: _share,
                      ),
                    ],
                  ))),
        )
      ]),
    );
  }

  void _openInBrowser() async {
    final url = _service.getURL(widget.slug, widget.chap);
    if (!await launchUrl(Uri.parse(url))) {
      showSnackBar(
        Text('Could not launch $url'),
      );
    }
  }

  void _share() {
    final url = _service.getURL(widget.slug, widget.chap);
    final String content =
        "Check out this comic: ${_metaBook?.name}\n\nRead here: $url";

    Share.share(content);
  }
}
