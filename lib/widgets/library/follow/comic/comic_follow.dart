import 'dart:math';

import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/comic/main.dart' as types;
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';

class ComicFollow extends StatefulWidget {
  final String sourceId;
  final types.ComicFollow follow;
  final double? width;
  final Axis direction;
  final bool showService;

  const ComicFollow({
    super.key,
    required this.sourceId,
    required this.follow,
    this.width,
    this.direction = Axis.horizontal,
    required this.showService,
  });

  @override
  State<ComicFollow> createState() => _ComicFollowState();
}

class _ComicFollowState extends State<ComicFollow> {
  @override
  Widget build(context) {
    final service = getServiceOrNull(widget.sourceId);

    final comic = widget.follow.item;
    final chapter = widget.follow.lastChapter;

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
            aspectRatio: 2 / 3,
            child: OImage.oNetwork(
              comic.image,
              sourceId: widget.sourceId,
              fit: BoxFit.cover,
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
          comic.name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontSize: isVertical ? 14.0 : 16.0,
            fontWeight: FontWeight.w400,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        if (chapter != null)
          Text(
            chapter.name,
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
        if (chapter?.fullName?.isNotEmpty == true)
          Text(
            chapter!.fullName!,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontSize: isVertical ? 11.0 : 12.0),
            maxLines: 2,
          ),

        if (widget.showService)
          Row(
            children: [
              service != null
                  ? AvatarService(service, radius: isVertical ? 6.0 : 10.0)
                  : CircleAvatar(radius: isVertical ? 6.0 : 10.0),
              4.0.widthBox,
              Text(
                service?.name ?? 'Service',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: isVertical ? 11.0 : 12.0,
                ),
                maxLines: 1,
              ),
            ],
          ),
      ],
    );

    return InkWell(
      borderRadius: BorderRadius.circular(7),
      onTap: () => context.pushNamed(
        'details_comic',
        pathParameters: {
          'sourceId': widget.follow.sourceId,
          'comicId': widget.follow.item.comicId,
        },
      ),
      child: Container(
        decoration: BoxDecoration(
          color: null,
          borderRadius: BorderRadius.circular(7.0),
        ),
        padding: isVertical
            ? EdgeInsets.symmetric(horizontal: 5.0)
            : EdgeInsets.symmetric(vertical: 7.0),
        child: widget.direction == Axis.horizontal
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
