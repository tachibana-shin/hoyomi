import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/interfaces/episode_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/episodes_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/meta_eiga.dart';
import 'package:hoyomi/core_services/interfaces/basic_image.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListEpisodes extends StatefulWidget {
  final String sourceId;
  final BasicSeason season;
  final BasicImage thumbnail;
  final ValueNotifier<String> eigaIdNotifier;
  final ValueNotifier<String?> episodeIdNotifier;
  final Axis scrollDirection;
  final ScrollController? controller;
  final EpisodesEiga? Function() initialData;
  final void Function(EpisodesEiga episodes)? onUpdate;
  final void Function({
    required int indexEpisode,
    required EpisodesEiga episodes,
  }) onTap;
  final bool eager;

  const ListEpisodes(
      {super.key,
      required this.sourceId,
      required this.season,
      required this.thumbnail,
      required this.eigaIdNotifier,
      required this.episodeIdNotifier,
      required this.onUpdate,
      required this.onTap,
      required this.initialData,
      required this.eager,
      this.scrollDirection = Axis.horizontal,
      this.controller});

  @override
  State<ListEpisodes> createState() => _ListEpisodesState();
}

class _ListEpisodesState extends State<ListEpisodes> {
  late final Future<EpisodesEiga> _seasonFuture;

  @override
  initState() {
    final service = getEigaService(widget.sourceId);
    final initial = widget.initialData();
    _seasonFuture = initial != null
        ? Future.value(initial)
        : service.getEpisodes(widget.season.eigaId);
    if (widget.onUpdate != null) _seasonFuture.then(widget.onUpdate!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _seasonFuture,
        builder: (context, snapshot) {
          final height = 35.0;

          if (snapshot.hasError) {
            return Center(
                child: UtilsService.errorWidgetBuilder(context,
                    error: snapshot.error,
                    orElse: (error) => Text('Error: $error')));
          }

          final waiting = snapshot.connectionState == ConnectionState.waiting;
          if (!waiting && !snapshot.hasData) {
            return const Center(child: Text('No data available'));
          }

          late final EpisodesEiga episodes;
          if (waiting) {
            episodes = EpisodesEiga.createFakeData();
          } else {
            episodes = snapshot.data as EpisodesEiga;
          }

          bool checkEpisodeActive(EpisodeEiga episode) {
            return widget.eigaIdNotifier.value == widget.season.eigaId &&
                (widget.episodeIdNotifier.value ??
                        episodes.episodes[0].episodeId) ==
                    episode.episodeId;
          }

          if (!waiting && widget.eager) {
            for (final episode in episodes.episodes) {
              final active = checkEpisodeActive(episode);

              if (active) {
                final episodeIndex = episodes.episodes.indexOf(episode);

                widget.onTap(
                  indexEpisode: episodeIndex,
                  episodes: episodes,
                );
                break;
              }
            }
          }

          final isVertical = widget.scrollDirection == Axis.vertical;
          Widget itemBuilder(BuildContext context, int index) {
            final episode = episodes.episodes[index];
            final active = !waiting && checkEpisodeActive(episode);

            if (isVertical) {
              return InkWell(
                  borderRadius: BorderRadius.circular(7),
                  onTap: () => widget.onTap(
                        indexEpisode: index,
                        episodes: episodes,
                      ),
                  child: Container(
                      decoration: BoxDecoration(
                          color: active
                              ? Theme.of(context).colorScheme.tertiaryContainer
                              : null,
                          borderRadius: BorderRadius.circular(7.0)),
                      padding:
                          EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: min(
                                  100.0, MediaQuery.of(context).size.width / 2),
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey.shade200,
                                  borderRadius: BorderRadius.circular(10.0)),
                              clipBehavior: Clip.antiAlias,
                              child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: BasicImage.network(
                                    episode.image?.src ?? widget.thumbnail.src,
                                    sourceId: widget.sourceId,
                                    headers: episodes.image?.headers ??
                                        widget.thumbnail.headers,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            SizedBox(width: 7.0),
                            Expanded(
                                child: Column(
                              children: [
                                SizedBox(
                                  height: 3.0,
                                ),
                                Text(
                                  'Episode ${episode.name}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5.0),
                                if (episode.description?.isNotEmpty == true)
                                  Text(
                                    episode.description!,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    maxLines: 2,
                                  )
                              ],
                            ))
                          ])));
            }

            return Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(7),
                onTap: () => widget.onTap(
                  indexEpisode: index,
                  episodes: episodes,
                ),
                child: Ink(
                  height: height * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: active
                          ? Theme.of(context).colorScheme.tertiaryContainer
                          : Colors.grey.withAlpha(60),
                    ),
                    color: active
                        ? Theme.of(context).colorScheme.tertiaryContainer
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(child: Text(episode.name)),
                ),
              ),
            );
          }

          final child = AnimatedBuilder(
              animation: Listenable.merge(
                  [widget.eigaIdNotifier, widget.episodeIdNotifier]),
              builder: (context, child) {
                final child = ListView.builder(
                    scrollDirection: widget.scrollDirection,
                    itemCount: episodes.episodes.length,
                    shrinkWrap: true,
                    controller: widget.controller,
                    itemBuilder: itemBuilder);

                if (waiting) {
                  return Skeletonizer(
                      enabled: true, enableSwitchAnimation: true, child: child);
                }
                return child;
              });
          return isVertical ? child : SizedBox(height: height, child: child);
        });
  }
}

class ListEpisodesSkeleton extends StatelessWidget {
  final height = 35.0;
  final episodes = EpisodesEiga.createFakeData().episodes;

  ListEpisodesSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        enabled: true,
        enableSwitchAnimation: true,
        child: SizedBox(
            height: height,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: episodes.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final episode = episodes[index];

                  return Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Container(
                          height: height * 0.9,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.withAlpha(60),
                            ),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Center(child: Text(episode.name))));
                })));
  }
}
