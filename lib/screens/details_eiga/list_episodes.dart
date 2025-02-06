import 'dart:math';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/interfaces/episode_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/episodes_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/meta_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/watch_time.dart';
import 'package:hoyomi/core_services/interfaces/basic_image.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:hoyomi/pages/details_eiga/[sourceId]/[eigaId].page.dart';
import 'package:hoyomi/utils/format_duration.dart';
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
    required EpisodesEiga episodesEiga,
  }) onTapEpisode;
  final Future<Map<String, WatchTime>> Function(
    EpisodesEiga episodesEiga,
  ) getWatchTimeEpisodes;
  final EventBus eventBus;
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
      required this.getWatchTimeEpisodes,
      required this.eager,
      required this.eventBus,
      this.scrollDirection = Axis.horizontal,
      this.controller});

  @override
  State<ListEpisodes> createState() => _ListEpisodesState();
}

class _ListEpisodesState extends State<ListEpisodes> with SignalsMixin {
  late final _episodesEiga =
      createAsyncSignal<EpisodesEiga>(AsyncState.loading());
  late final _watchTimeEpisodes = createSignal<Map<String, WatchTime>?>(null);

  final Map<int, void Function()> _disposes = {};

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    try {
      final episodes = await widget.getData();

      _episodesEiga.value = AsyncState.data(episodes);
      final watchTimes = await widget.getWatchTimeEpisodes(episodes);
      _watchTimeEpisodes.value = watchTimes;
    } catch (error) {
      _episodesEiga.value = AsyncState.error(error);
      _watchTimeEpisodes.value = null;
    }
  }

  @override
  void dispose() {
    for (var dispose in _disposes.values) {
      dispose();
    }
    super.dispose();
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
            episodesEiga: episodesEiga,
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
                episodesEiga.episodes.first.episodeId) ==
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

    return StatefulBuilder(builder: (context, setState2) {
      final watchTime = _watchTimeEpisodes.value == null
          ? null
          : _watchTimeEpisodes.value![episode.episodeId];

      if (_disposes[index] != null) {
        _disposes[index]!();
      }

      void handler(WatchTimeDataEvent event) {
        if (event.watchTimeData.eigaId == widget.season.eigaId &&
            event.watchTimeData.episodeId == episode.episodeId &&
            event.watchTimeData.watchTime != null) {
          _watchTimeEpisodes.value ??= {};
          _watchTimeEpisodes.value![episode.episodeId] =
              event.watchTimeData.watchTime!;

          setState2(() {});
        }
      }

      _disposes[index] =
          widget.eventBus.on<WatchTimeDataEvent>().listen(handler).cancel;

      if (isVertical) {
        return InkWell(
            borderRadius: BorderRadius.circular(7),
            onTap: () => widget.onTapEpisode(
                  indexEpisode: index,
                  episodesEiga: episodesEiga,
                ),
            child: Container(
                decoration: BoxDecoration(
                    color: active
                        ? Theme.of(context).colorScheme.tertiaryContainer
                        : null,
                    borderRadius: BorderRadius.circular(7.0)),
                padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width:
                              min(100.0, MediaQuery.of(context).size.width / 2),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.shade200,
                              borderRadius: BorderRadius.circular(10.0)),
                          clipBehavior: Clip.antiAlias,
                          child: Stack(children: [
                            AspectRatio(
                                aspectRatio: 16 / 9,
                                child: BasicImage.network(
                                  episode.image?.src ?? widget.thumbnail.src,
                                  sourceId: widget.sourceId,
                                  headers: episodesEiga.image?.headers ??
                                      widget.thumbnail.headers,
                                  fit: BoxFit.cover,
                                )),
                            if (watchTime != null)
                              Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Column(children: [
                                    LinearProgressIndicator(
                                      value: watchTime.position.inMilliseconds /
                                          watchTime.duration.inMilliseconds,
                                      backgroundColor:
                                          Color.fromRGBO(255, 255, 255, 0.6),
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          active
                                              ? Color(0xFF2196F3)
                                              : Color(0xFF00C234)),
                                      minHeight: 3.0,
                                      borderRadius: BorderRadius.circular(10.0),
                                    )
                                  ])),
                          ])),
                      SizedBox(width: 7.0),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          if (watchTime != null)
                            Text(
                              'Last time watch ${formatDuration(watchTime.position)} / ${formatDuration(watchTime.duration)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.color
                                          ?.withValues(alpha: 0.8)),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          SizedBox(height: 5.0),
                          if (episode.description?.isNotEmpty == true)
                            Text(
                              episode.description!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontSize: 12.0),
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
                  episodesEiga: episodesEiga,
                ),
            child: Container(
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
                child: Stack(children: [
                  Ink(
                    height: height * 0.9,
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Center(child: Text(episode.name)),
                  ),
                  if (watchTime != null)
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: LinearProgressIndicator(
                          value: watchTime.position.inMilliseconds /
                              watchTime.duration.inMilliseconds,
                          backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
                          valueColor: AlwaysStoppedAnimation<Color>(
                              active ? Color(0xFF2196F3) : Color(0xFF00C234)),
                          minHeight: 3.0,
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                ]))),
      );
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
