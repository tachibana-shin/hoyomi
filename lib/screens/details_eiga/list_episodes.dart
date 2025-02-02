import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/interfaces/episode_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/episodes_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/meta_eiga.dart';
import 'package:hoyomi/core_services/interfaces/basic_image.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:signals/signals_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListEpisodes extends StatefulWidget {
  final String sourceId;
  final BasicSeason season;
  final BasicImage thumbnail;
  final ValueNotifier<String> eigaIdNotifier;
  final ValueNotifier<String?> episodeIdNotifier;
  final Axis scrollDirection;
  final ScrollController? controller;
  final Future<EpisodesEiga> Function() getData;
  final void Function({
    required int indexEpisode,
    required EpisodesEiga episodes,
  }) onTapEpisode;
  final bool eager;

  const ListEpisodes(
      {super.key,
      required this.sourceId,
      required this.season,
      required this.thumbnail,
      required this.eigaIdNotifier,
      required this.episodeIdNotifier,
      required this.onTapEpisode,
      required this.getData,
      required this.eager,
      this.scrollDirection = Axis.horizontal,
      this.controller});

  @override
  State<ListEpisodes> createState() => _ListEpisodesState();
}

class _ListEpisodesState extends State<ListEpisodes> with SignalsMixin {
  late final _episodesEiga =
      createAsyncSignal<EpisodesEiga>(AsyncState.loading());

  @override
  initState() {
    widget.getData().then((data) {
      _episodesEiga.value = AsyncState.data(data);
    }).catchError((error) {
      _episodesEiga.value = AsyncState.error(error);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = 35.0;

    if (_episodesEiga.value.hasError) {
      return Center(
          child: UtilsService.errorWidgetBuilder(context,
              error: _episodesEiga.value.error,
              orElse: (error) => Text('Error: $error')));
    }

    if (!_episodesEiga.value.isLoading && !_episodesEiga.value.hasValue) {
      return const Center(child: Text('No data available'));
    }

    final waiting = _episodesEiga.value.isLoading;

    final episodesEiga = waiting
        ? EpisodesEiga.createFakeData()
        : _episodesEiga.value.requireValue;

    if (!waiting && widget.eager) {
      for (final episode in episodesEiga.episodes) {
        final active = checkEpisodeActive(episode, episodesEiga);

        if (active) {
          final episodeIndex = episodesEiga.episodes.indexOf(episode);

          widget.onTapEpisode(
            indexEpisode: episodeIndex,
            episodes: episodesEiga,
          );
          break;
        }
      }
    }

    final isVertical = widget.scrollDirection == Axis.vertical;

    final child = AnimatedBuilder(
        animation:
            Listenable.merge([widget.eigaIdNotifier, widget.episodeIdNotifier]),
        builder: (context, child) {
          final child = ListView.builder(
              scrollDirection: widget.scrollDirection,
              itemCount: episodesEiga.episodes.length,
              shrinkWrap: true,
              controller: widget.controller,
              itemBuilder: (context, index) => itemBuilder(context,
                  index: index,
                  episodesEiga: episodesEiga,
                  waiting: waiting,
                  isVertical: isVertical,
                  height: height));

          if (waiting) {
            return Skeletonizer(
                enabled: true, enableSwitchAnimation: true, child: child);
          }
          return child;
        });
    return isVertical ? child : SizedBox(height: height, child: child);
  }

  bool checkEpisodeActive(EpisodeEiga episode, EpisodesEiga episodesEiga) {
    return widget.eigaIdNotifier.value == widget.season.eigaId &&
        (widget.episodeIdNotifier.value ??
                episodesEiga.episodes[0].episodeId) ==
            episode.episodeId;
  }

  Widget itemBuilder(BuildContext context,
      {required int index,
      required EpisodesEiga episodesEiga,
      required bool waiting,
      required bool isVertical,
      required double height}) {
    final episode = episodesEiga.episodes[index];
    final active = !waiting && checkEpisodeActive(episode, episodesEiga);

    if (isVertical) {
      return InkWell(
          borderRadius: BorderRadius.circular(7),
          onTap: () => widget.onTapEpisode(
                indexEpisode: index,
                episodes: episodesEiga,
              ),
          child: Container(
              decoration: BoxDecoration(
                  color: active
                      ? Theme.of(context).colorScheme.tertiaryContainer
                      : null,
                  borderRadius: BorderRadius.circular(7.0)),
              padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: min(100.0, MediaQuery.of(context).size.width / 2),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade200,
                      borderRadius: BorderRadius.circular(10.0)),
                  clipBehavior: Clip.antiAlias,
                  child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: BasicImage.network(
                        episode.image?.src ?? widget.thumbnail.src,
                        sourceId: widget.sourceId,
                        headers: episodesEiga.image?.headers ??
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
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 14.0, fontWeight: FontWeight.w400),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5.0),
                    if (episode.description?.isNotEmpty == true)
                      Text(
                        episode.description!,
                        style: Theme.of(context).textTheme.bodySmall,
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
        onTap: () => widget.onTapEpisode(
          indexEpisode: index,
          episodes: episodesEiga,
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
