import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/core_services/base_service.dart';
import 'package:honyomi/core_services/interfaces/basic_image.dart';
import 'package:honyomi/utils/format_time_ago.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:xml/xml.dart';

class RssItem {
  final String title;
  final String link;
  final String? description;
  final DateTime? pubDate;
  final BasicImage? image;
  final BasicImage? avatar;
  final String? creator;
  final BaseService service;

  RssItem({
    required this.title,
    required this.link,
    this.description,
    this.pubDate,
    this.image,
    this.avatar,
    this.creator,
    required this.service
  });
}

class NewsFeedScreen extends StatefulWidget {
  final List<BaseService> services;

  const NewsFeedScreen({super.key, required this.services});

  @override
  _NewsFeedScreenState createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  late Future<List<RssItem>> _newsItems;

  @override
  void initState() {
    super.initState();
    _newsItems = fetchAndParseFeeds(
        widget.services.where((service) => service.rss != null).toList());
  }

  Future<List<RssItem>> fetchAndParseFeeds(List<BaseService> services) async {
    final items = <RssItem>[];

    for (final service in services) {
      try {
        final response = await http.get(Uri.parse(service.rss!));
        if (response.statusCode == 200) {
          final feed = parseRss(response.body, service: service);
          items.addAll(feed);
        }
      } catch (e) {
        print('Error while parsing $service: $e');
      }
    }

    // Sort items by pubDate (from newest to oldest)
    items.sort((a, b) {
      if (a.pubDate == null || b.pubDate == null) return 0;
      return b.pubDate!.compareTo(a.pubDate!);
    });

    return items;
  }

  List<RssItem> parseRss(String xmlData, {required BaseService service}) {
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
      final imageUrl = element
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
          pubDate = DateTime.tryParse(pubDateString) ??
              DateFormat('dd-MM-yyyy').parse(pubDateString);
        } catch (e) {
          print('Error parsing pubDate: $e');
        }
      }

      items.add(RssItem(
        title: title,
        link: link,
        description: description,
        pubDate: pubDate,
        image: BasicImage(
            src: imageUrl!, headers: {"referer": Uri.parse(link).host}),
        avatar: BasicImage(src: service.faviconUrl),
        creator: creator,
        service: service,
      ));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<RssItem>>(
        future: _newsItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No news items found'));
          }

          final items = snapshot.data!;

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: InkWell(
                    onTap: () {
                      final param = item.service. parseURL(item.link);

                      context.push("/details_comic/${item.service.uid}/${param.bookId}");
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
                                Text(item.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.merge(TextStyle(height: 1.2))),
                                if (item.description != null)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 7.0),
                                    child: Text(item.description!),
                                  ),
                                SizedBox(height: 7.0),
                                Text(
                                    item.pubDate != null
                                        ? formatTimeAgo(item.pubDate!)
                                        : 'No date',
                                    style: TextStyle(fontSize: 12.0)),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          Theme.of(context).colorScheme.surface,
                                      radius: 10.0,
                                      child: Image.network(
                                        item.avatar!.src,
                                        headers: item.avatar!.headers,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(item.creator ?? 'Unknown',
                                        style: TextStyle(fontSize: 12.0))
                                  ]),
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
                                child: Image.network(
                                  item.image!.src,
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
                  ));
            },
          );
        },
      ),
    );
  }
}
