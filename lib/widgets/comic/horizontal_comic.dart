import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/utils/format_time_ago.dart';

class HorizontalComic extends StatelessWidget {
  final Comic comic;
  final String sourceId;

  const HorizontalComic({
    super.key,
    required this.comic,
    required this.sourceId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
      color: Colors.transparent,
      elevation: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          AspectRatio(
            aspectRatio: 2 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: OImage.network(
                comic.image.src,
                sourceId: sourceId,
                headers: comic.image.headers,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 8.0),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top: Notice and Rating
                if (comic.notice != null || comic.rate != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (comic.notice != null)
                        Chip(
                          label: Text(
                            comic.notice!,
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.orange,
                            ),
                          ),
                          backgroundColor: Colors.black.withValues(alpha: 0.6),
                        ),
                      if (comic.rate != null)
                        Row(
                          children: [
                            Icon(
                              MaterialCommunityIcons.star,
                              color: Colors.blue.shade200,
                              size: 16.0,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              comic.rate!.toString(),
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),

                const SizedBox(height: 8.0),

                // Comic name
                Text(
                  comic.name,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (comic.originalName != null)
                  Text(
                    comic.originalName!,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                const SizedBox(height: 4.0),

                // Last chapter
                if (comic.lastChap != null)
                  Text(
                    comic.lastChap?.name ?? 'N/A',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey.shade500,
                    ),
                  ),

                // Bottom: Time Ago
                if (comic.timeAgo != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withValues(alpha: 0.8),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        formatTimeAgo(comic.timeAgo!),
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.blueGrey.shade50,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
