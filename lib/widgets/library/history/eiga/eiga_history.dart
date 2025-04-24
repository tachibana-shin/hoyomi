import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_history.dart'
    as types;
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/utils/format_duration.dart';
import 'package:hoyomi/widgets/blurred_part_background.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';

class EigaHistory extends StatefulWidget {
  final String sourceId;
  final types.EigaHistory history;
  final double? width;
  final Axis direction;

  const EigaHistory({
    super.key,
    required this.sourceId,
    required this.history,
    this.width,
    this.direction = Axis.horizontal,
  });

  @override
  State<EigaHistory> createState() => _EigaHistoryState();
}

class _EigaHistoryState extends State<EigaHistory> {
  @override
  Widget build(context) {
    final eiga = widget.history.item;
    final episode = widget.history.lastEpisode;
    final watchTime = widget.history.watchTime;

    final isVertical = widget.direction == Axis.vertical;

    final poster = Container(
      width: widget.width ?? min(180.0, 30.w(context)),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade200,
        borderRadius: BorderRadius.circular(10.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: OImage.network(
              eiga.image.src,
              sourceId: widget.sourceId,
              headers: eiga.image.headers,
              fit: BoxFit.cover,
            ),
          ),
          BlurredPartBackground(),

          ///
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                LinearProgressIndicator(
                  value:
                      watchTime.position.inMilliseconds /
                      watchTime.duration.inMilliseconds,
                  backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00C234)),
                  minHeight: 3.0,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ],
            ),
          ),

          ///
          Positioned(
            bottom: 5,
            right: 5,
            child: Text(
              '${formatDuration(watchTime.position)} / ${formatDuration(watchTime.duration)}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
    final titleAndSubtitle = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 3.0),
        Text(
          eiga.name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontSize: isVertical ? 14.0 : 16.0,
            fontWeight: FontWeight.w400,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        Text(
          'Episode ${episode.name}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontSize: isVertical ? 12.0 : 14.0,
            fontWeight: FontWeight.w400,
            color: Theme.of(
              context,
            ).textTheme.titleMedium?.color?.withValues(alpha: 0.8),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        SizedBox(height: 2.0),

        ///
        SizedBox(height: 5.0),
        if (episode.description?.isNotEmpty == true)
          Text(
            episode.description!,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontSize: isVertical ? 11.0 : 12.0),
            maxLines: 2,
          ),
      ],
    );

    return InkWell(
      borderRadius: BorderRadius.circular(7),
      child: Container(
        decoration: BoxDecoration(
          color: null,
          borderRadius: BorderRadius.circular(7.0),
        ),
        padding:
            isVertical
                ? EdgeInsets.symmetric(horizontal: 5.0)
                : EdgeInsets.symmetric(vertical: 7.0),
        child:
            widget.direction == Axis.horizontal
                ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    poster,
                    SizedBox(width: 7.0),
                    Expanded(child: titleAndSubtitle),
                  ],
                )
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [poster, titleAndSubtitle],
                ),
      ),
    );
  }
}
