import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/router/extensions/to_router.dart';
import 'package:hoyomi/utils/format_time_ago.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';

class CardHorzItem extends StatelessWidget {
  final ToRouter to;
  final bool replace;

  final String sourceId;

  final double? rate;
  final OImage image;
  final String? notice;
  final double? progress;
  final bool pending;
  final DateTime? preRelease;
  final String title;
  final String? subtitle2;
  final String? subtitle;
  final DateTime? lastUpdate;
  final List<Widget> extend;

  const CardHorzItem({
    super.key,
    required this.to,
    required this.replace,
    required this.sourceId,
    required this.rate,
    required this.image,
    required this.notice,
    required this.progress,
    required this.pending,
    required this.preRelease,
    required this.title,
    required this.subtitle2,
    required this.subtitle,
    required this.lastUpdate,
    required this.extend,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
      color: Colors.transparent,
      elevation: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image + overlay
          Stack(
            children: [
              Container(
                width: min(98.0, 23.w(context)),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade200,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: OImage.network(
                      image.src,
                      sourceId: sourceId,
                      headers: image.headers,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // progress
              if (progress != null)
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: CircularProgress(
                    value: progress!,
                    strokeWidth: 7.0,
                    textStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    borderColor: AlwaysStoppedAnimation<Color>(
                      Colors.blueGrey.shade100,
                    ),
                    backgroundBorder: Colors.transparent,
                    backgroundColor: Colors.blueGrey.shade800,
                    size: 25,
                  ),
                ),
              // pending/preRelease overlay
              if (pending)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withValues(alpha: 0.5),
                    child: Center(
                      child: Text(
                        preRelease != null
                            ? formatTimeAgo(preRelease!)
                            : 'Pre-release',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              // extend widgets (top right)
              if (extend.isNotEmpty)
                Positioned(
                  top: 4,
                  right: 4,
                  child: Wrap(spacing: 2, children: extend),
                ),
            ],
          ),
          const SizedBox(width: 8.0),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Eiga name
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle2 != null)
                  Text(
                    subtitle2!,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                const SizedBox(height: 4.0),

                // Last chapter
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey.shade500,
                    ),
                  ),

                if (rate != null || notice != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (notice != null)
                        Text(
                          notice!,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      if (notice != null && rate != null) VerticalSeparator(),
                      if (rate != null)
                        Row(
                          children: [
                            Iconify(
                              Eva.star_fill,
                              color: Colors.blue.shade200,
                              size: 16.0,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              rate!.toString(),
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),

                // Bottom: Time Ago
                if (lastUpdate != null)
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
                        formatTimeAgo(lastUpdate!),
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

    content = InkWell(
      borderRadius: BorderRadius.circular(8.0),
      onTap: () {
        if (replace) {
          context.replaceRouter(to);
        } else {
          context.pushRouter(to);
        }
      },
      child: content,
    );

    return content;
  }
}
