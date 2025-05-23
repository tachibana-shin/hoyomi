import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:dio/dio.dart' show BaseOptions, Dio, ResponseType;
import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/interfaces/main.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/plugins/export.dart';
import 'package:hoyomi/stores.dart';
import 'package:hoyomi/utils/export.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:kaeru/kaeru.dart';
import 'package:url_launcher/url_launcher.dart';

class _RssItem {
  final String title;
  final String link;
  final String? description;
  final DateTime? pubDate;
  final OImage? image;
  final ({String name, OImage avatar})? creator;

  factory _RssItem.createFakeData() {
    return _RssItem(
      title: "Fake RSS Item Title",
      link: "https://example.com/fake-rss-item",
      description: "This is a fake RSS item for testing purposes.",
      pubDate: DateTime.now().subtract(Duration(days: 1)),
      image: OImage.createFakeData(),
      creator: (name: "Fake Creator", avatar: OImage.createFakeData()),
    );
  }

  _RssItem({
    required this.title,
    required this.link,
    this.description,
    this.pubDate,
    this.image,
    this.creator,
  });
}

enum NewsFeedScreenType { all, comic, eiga }

class NewsFeedScreen extends StatefulWidget {
  final Ref<int> type;
  final Ref<bool> sort;

  const NewsFeedScreen({super.key, required this.type, required this.sort});

  @override
  createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final Map<String, String> _storeCache = {};

  Dio? _dio;
  Future<Dio> _createClient() async {
    if (_dio != null) return _dio!;

    return _dio = await createDioClient(
      BaseOptions(followRedirects: true, responseType: ResponseType.plain),
      followRedirects: true,
    );
  }

  Future<List<_RssItem>> _fetchAndParseFeeds(
    NewsFeedScreenType type, {
    int page = 1,
  }) async {
    final items = <_RssItem>[];

    final dio = await _createClient();

    final keywords = switch (type) {
      NewsFeedScreenType.comic => newsKeywordComic.value,
      NewsFeedScreenType.eiga => newsKeywordEiga.value,
      _ => [...newsKeywordComic.value, ...newsKeywordEiga.value],
    };

    for (final keyword in keywords) {
      try {
        final xml =
            _storeCache['$keyword-$page'] ??=
                (await dio.get(
                  'https://www.google.com/search?q=$keyword&tbm=nws&gbv=1&start=${page * 10}',
                )).data;
        final feed = _parseRss(xml);

        items.addAll(feed);
      } catch (e, stack) {
        showSnackBar(Text('Error while parsing $keyword: $e'));
        debugPrint("Error: $e");
        debugPrint('$stack');
      }
    }

    // // Sort items by pubDate (from newest to oldest)
    // items.sort((a, b) {
    //   if (a.pubDate == null || b.pubDate == null) return 0;
    //   return b.pubDate!.compareTo(a.pubDate!);
    // });

    return items;
  }

  List<_RssItem> _parseRss(String xmlData) {
    final $ = DQuery.fromDocument(parse(xmlData));

    return $("a[data-ved]").map((item) {
      final title = item.queryOne('h3').text();
      final link = item
          .attr('href')
          .replaceFirst(RegExp(r'\/url\?q='), '')
          .replaceFirst('&', '?');
      final pubDateString =
          item
              .queryOne('img')
              .parent()
              .parent()
              .next()
              .children(0)
              .queryOne('span')
              .text();
      final description = item
          .queryOne('img')
          .parent()
          .parent()
          .next()
          .children(0)
          .queryOne('span')
          .parent()
          .text()
          .replaceFirst(pubDateString, '');
      final imageUrl = OImage.from(item.queryOne('img').attr('src'));

      final source$ = item.queryOne('h3').parent().next().text();

      final creator = switch (source$.isNotEmpty) {
        true => (
          name: source$,
          avatar: OImage.from(
            'https://encrypted-tbn2.gstatic.com/faviconV2?url=${Uri.parse(link).origin}&client=NEWS_360&size=96&type=FAVICON&fallback_opts=TYPE,SIZE,URL',
          ),
        ),
        _ => null,
      };

      // Parse pubDate string to DateTime
      DateTime? pubDate;
      try {
        pubDate =
            DateTime.tryParse(pubDateString) ??
            DateFormat('dd-MM-yyyy').tryParse(pubDateString) ??
            convertTimeAgoToUtc(pubDateString);
      } catch (e, stack) {
        debugPrint("Error: $e ($stack)");
      }

      return _RssItem(
        title: title,
        link: link,
        description: description,
        pubDate: pubDate,
        image: imageUrl,
        creator: creator,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Watch(
      () => PullRefreshPage(
        key: ValueKey(widget.type.value),
        onLoadData:
            () => _fetchAndParseFeeds(
              NewsFeedScreenType.values[widget.type.value],
            ),
        onLoadFake: () => List.generate(30, (_) => _RssItem.createFakeData()),
        builder: (rawItems, _) {
          int page = 1;

          return Watch(() {
            late final List<_RssItem> items;
            if (widget.sort.value) {
              items = rawItems.sublist(0)..sort((a, b) {
                if (a.pubDate == null || b.pubDate == null) return 0;
                return b.pubDate!.compareTo(a.pubDate!);
              });
            } else {
              items = rawItems;
            }

            return InfiniteList(
              key: ValueKey(widget.sort.value),
              data: items,
              fetchData: () async {
                final items = await _fetchAndParseFeeds(
                  NewsFeedScreenType.values[widget.type.value],
                  page: ++page,
                );

                return (done: items.length < 10, data: items);
              },
              itemBuilder: (context, item, _, __) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: InkWell(
                    onTap: () {
                      launchUrl(
                        Uri.parse(item.link),
                        mode: LaunchMode.inAppBrowserView,
                        webViewConfiguration: const WebViewConfiguration(
                          enableJavaScript: true,
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium?.merge(
                            const TextStyle(height: 1.2),
                          ),
                        ),
                        5.0.heightBox,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Left side: Title and Description
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (item.description != null)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 7.0,
                                      ),
                                      child: Text(item.description!),
                                    ),
                                  const SizedBox(height: 7.0),
                                  Text(
                                    item.pubDate != null
                                        ? formatTimeAgo(item.pubDate!)
                                        : 'No date',
                                    style: const TextStyle(fontSize: 12.0),
                                  ),
                                  if (item.creator != null)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                Theme.of(context)
                                                    .colorScheme
                                                    .surfaceContainerHigh,
                                            radius: 10,
                                            backgroundImage:
                                                OImage.oImageProvider(
                                                  item.creator!.avatar,
                                                ),
                                          ),
                                          4.0.widthBox,
                                          Text(
                                            item.creator!.name,
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ).expanded(),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            // Right side: Image
                            if (item.image != null)
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: SizedBox(
                                  width: 120,
                                  height: 68,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: OImage.oNetwork(
                                      item.image!,
                                      sourceId: null,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ).paddingAll(16.0),
                  ),
                );
              },
            );
          });
        },
      ),
    );
  }
}
