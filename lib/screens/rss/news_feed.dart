import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/comic/comic_service.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/utils/format_time_ago.dart';
import 'package:hoyomi/widgets/pull_refresh_page.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:xml/xml.dart';

class RssItem {
  final String title;
  final String link;
  final String? description;
  final DateTime? pubDate;
  final OImage? image;
  final OImage? avatar;
  final String? creator;
  final ComicService? service;

  factory RssItem.createFakeData() {
    return RssItem(
      title: "Fake RSS Item Title",
      link: "https://example.com/fake-rss-item",
      description: "This is a fake RSS item for testing purposes.",
      pubDate: DateTime.now().subtract(Duration(days: 1)),
      image: OImage.createFakeData(),
      avatar: OImage.createFakeData(),
      creator: "Fake Creator",
      service: null,
    );
  }

  RssItem({
    required this.title,
    required this.link,
    this.description,
    this.pubDate,
    this.image,
    this.avatar,
    this.creator,
    required this.service,
  });
}

class NewsFeedScreen extends StatefulWidget {
  final List<ComicService> services;

  const NewsFeedScreen({super.key, required this.services});

  @override
  createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  Future<List<RssItem>> fetchAndParseFeeds(List<ComicService> services) async {
    final items = <RssItem>[];

    for (final service in services) {
      try {
        final response = await http.get(Uri.parse(service.rss!));
        if (response.statusCode == 200) {
          final feed = parseRss(response.body, service: service);
          items.addAll(feed);
        }
      } catch (e) {
        showSnackBar(Text('Error while parsing $service: $e'));
        debugPrint("Error: $e");
      }
    }

    // Sort items by pubDate (from newest to oldest)
    items.sort((a, b) {
      if (a.pubDate == null || b.pubDate == null) return 0;
      return b.pubDate!.compareTo(a.pubDate!);
    });

    return items;
  }

  List<RssItem> parseRss(String xmlData, {required ComicService service}) {
    final document = XmlDocument.parse(xmlData);
    final items = <RssItem>[];

    final itemElements = document.findAllElements('item');
    for (final element in itemElements) {
      final title = element.findElements('title').single.lastChild!.value!;
      final link = element.findElements('link').single.lastChild!.value!;
      final description =
          element.findElements('description').firstOrNull?.lastChild?.value;
      final pubDateString =
          element.findElements('pubDate').firstOrNull?.lastChild?.value;
      final imageUrl =
          element
              .findElements('image')
              .firstOrNull
              ?.findElements("url")
              .single
              .lastChild
              ?.value;
      final creator =
          element.findElements('dc:creator').firstOrNull?.lastChild?.value ??
          service.name;

      // Parse pubDate string to DateTime
      DateTime? pubDate;
      if (pubDateString != null) {
        try {
          pubDate =
              DateTime.tryParse(pubDateString) ??
              DateFormat('dd-MM-yyyy').parse(pubDateString);
        } catch (e) {
          showSnackBar(Text('Error parsing pubDate: $e'));
          debugPrint("Error: $e");
        }
      }

      items.add(
        RssItem(
          title: title,
          link: link,
          description: description,
          pubDate: pubDate,
          image:
              imageUrl != null
                  ? OImage(
                    src: imageUrl,
                    headers: {"referer": Uri.parse(link).host},
                  )
                  : null,
          avatar: OImage(src: service.faviconUrl),
          creator: creator,
          service: service,
        ),
      );
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return PullRefreshPage(
      onLoadData:
          () => fetchAndParseFeeds(
            widget.services.where((service) => service.rss != null).toList(),
          ),
      onLoadFake: () => List.generate(30, (_) => RssItem.createFakeData()),
      builder:
          (items, _) => ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: InkWell(
                  onTap: () {
                    if (item.service == null) return;
                    final param = item.service!.parseURL(item.link);

                    context.push(
                      "/details_comic/${item.service!.uid}/${param.comicId}${param.chapterId == null ? '' : '/view?chap=${param.chapterId}'}",
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left side: Title and Description
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.merge(const TextStyle(height: 1.2)),
                              ),
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
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          Theme.of(context).colorScheme.surface,
                                      radius: 10.0,
                                      child: OImage.network(
                                        item.avatar!.src,
                                        sourceId: item.service?.uid ?? '',
                                        headers: item.avatar!.headers,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      item.creator ?? 'Unknown',
                                      style: const TextStyle(fontSize: 12.0),
                                    ),
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: OImage.network(
                                item.image!.src,
                                sourceId: item.service?.uid ?? '',
                                headers: item.image!.headers,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
    );
  }
}
