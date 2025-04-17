import 'dart:math';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_episode.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_episodes.dart';
import 'package:hoyomi/core_services/eiga/interfaces/meta_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/watch_time.dart';
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/pages/details_eiga/[sourceId]/[eigaId].page.dart';
import 'package:hoyomi/stores.dart';
import 'package:hoyomi/utils/format_duration.dart';
import 'package:hoyomi/widgets/iconify.dart';
import 'package:iconify_flutter/icons/majesticons.dart';
import 'package:kaeru/kaeru.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListEpisodes extends StatefulWidget {
  final String sourceId;
  final Season season;
  final OImage thumbnail;
  final Ref<String> eigaIdNotifier;
  final Ref<String?> episodeIdNotifier;
  final Axis scrollDirection;
  final ScrollController? controller;
  final Future<EigaEpisodes> Function(void Function(EigaEpisodes newValue))
      getData;
  final void Function({
    required int indexEpisode,
    required EigaEpisodes episodesEiga,
  }) onTapEpisode;
  final Future<Map<String, WatchTime>> Function(EigaEpisodes episodesEiga)
      getWatchTimeEpisodes;
  final EventBus eventBus;
  final bool eager;

  const ListEpisodes({
    super.key,
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
    this.controller,
  });

  @override
  State<ListEpisodes> createState() => _ListEpisodesState();
}

class _ListEpisodesState extends State<ListEpisodes>
    with KaeruMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late final _episodesEiga = computed<Future<EigaEpisodes>>(() async {
    try {
      final episodes = await widget.getData(_updateEpisodesEiga);
      if (!mounted) throw Exception('Page destroyed');

      widget.getWatchTimeEpisodes(episodes).then((watchTimes) {
        if (mounted) _watchTimeEpisodes.value = watchTimes;
      }).catchError((error) {
        if (error is! UserNotFoundException) {
          debugPrint('Error: $error (${StackTrace.current})');
        }
      });

      if (widget.eager) {
        final indexActive = episodes.episodes.indexWhere(
          (episode) => _checkEpisodeActive(episode, episodes),
        );
        if (indexActive != -1) {
          widget.onTapEpisode(
            indexEpisode: indexActive,
            episodesEiga: episodes,
          );
        }
      }

      return episodes;
    } catch (error) {
      if (mounted) _watchTimeEpisodes.value = null;

      rethrow;
    }
  });
  late final _watchTimeEpisodes = ref<Map<String, WatchTime>?>(null);

  final Map<int, void Function()> _disposes = {};

  void _updateEpisodesEiga(EigaEpisodes newValue) {
    _episodesEiga.force(Future.value(newValue));
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
    super.build(context);

    final height = 35.0;

    return Watch(() {
      final episodesEiga = _episodesEiga.value;

      return FutureBuilder(
          future: episodesEiga,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Service.errorWidgetBuilder(
                  context,
                  error: snapshot.error,
                  service: null,
                  orElse: (error) => Text('Error: $error'),
                ),
              );
            }

            final waiting = snapshot.connectionState == ConnectionState.waiting;
            if (!snapshot.hasData && !waiting) {
              return const Center(child: Text('No data available'));
            }

            final episodesEiga =
                waiting ? EigaEpisodes.createFakeData() : snapshot.data!;

            final isVertical = widget.scrollDirection == Axis.vertical;

            Widget child = Watch(() {
              if (showListEpisodeWithGrid.value) {
                return ResponsiveGridList(
                  horizontalGridSpacing: 16,
                  verticalGridSpacing: 16,
                  horizontalGridMargin: 0,
                  verticalGridMargin: 0,
                  minItemWidth: 16.0 * 5,
                  minItemsPerRow: 2,
                  maxItemsPerRow: 12,
                  listViewBuilderOptions:
                      ListViewBuilderOptions(controller: widget.controller),
                  children: episodesEiga.episodes.indexed.map((entry) {
                    return _itemBuilder(
                      context,
                      index: entry.$1,
                      episodesEiga: episodesEiga,
                      waiting: waiting,
                      isVertical: false,
                      height: height,
                    );
                  }).toList(),
                );
              }

              return ListView.builder(
                scrollDirection: widget.scrollDirection,
                itemCount: episodesEiga.episodes.length,
                shrinkWrap: true,
                controller: widget.controller,
                itemBuilder: (context, index) => _itemBuilder(
                  context,
                  index: index,
                  episodesEiga: episodesEiga,
                  waiting: waiting,
                  isVertical: isVertical,
                  height: height,
                ),
              );
            });

            if (waiting) {
              child = Skeletonizer(
                enabled: true,
                enableSwitchAnimation: true,
                child: child,
              );
            }
            return switch (isVertical) {
              true => Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Episodes'),
                        Watch(() => IconButton(
                              onPressed: () {
                                showListEpisodeWithGrid.value =
                                    !showListEpisodeWithGrid.value;
                              },
                              icon: Iconify(
                                showListEpisodeWithGrid.value
                                    ? Majesticons.checkbox_list_detail_line
                                    : Majesticons.applications_line,
                                // Mingcute.grid_line
                              ),
                            )),
                      ]),
                  Expanded(child: child),
                ]),
              false => SizedBox(height: height, child: child),
            };
          });
    });
  }

  bool _checkEpisodeActive(EigaEpisode episode, EigaEpisodes episodesEiga) {
    return widget.eigaIdNotifier.value == widget.season.eigaId &&
        (widget.episodeIdNotifier.value ??
                episodesEiga.episodes.first.episodeId) ==
            episode.episodeId;
  }

  Widget _itemBuilder(
    BuildContext context, {
    required int index,
    required EigaEpisodes episodesEiga,
    required bool waiting,
    required bool isVertical,
    required double height,
  }) {
    return Watch(() {
      final episode = episodesEiga.episodes[index];
      final active = !waiting && _checkEpisodeActive(episode, episodesEiga);

      return StatefulBuilder(
        builder: (context, setState2) {
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
                  borderRadius: BorderRadius.circular(7.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: min(100.0, MediaQuery.of(context).size.width / 2),
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
                              episode.image?.src ?? widget.thumbnail.src,
                              sourceId: widget.sourceId,
                              headers: episodesEiga.image?.headers ??
                                  widget.thumbnail.headers,
                              fit: BoxFit.cover,
                            ),
                          ),
                          if (watchTime != null)
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Column(
                                children: [
                                  LinearProgressIndicator(
                                    value: watchTime.position.inMilliseconds /
                                        watchTime.duration.inMilliseconds,
                                    backgroundColor:
                                        Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Color.fromRGBO(0, 0, 0, 0.6)
                                            : Color.fromRGBO(
                                                255,
                                                255,
                                                255,
                                                0.6,
                                              ),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      active
                                          ? Color(0xFF2196F3)
                                          : Color(0xFF00C234),
                                    ),
                                    minHeight: 3.0,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(width: 7.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 3.0),
                          Text(
                            'Episode ${episode.name}',
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium?.copyWith(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (watchTime != null)
                            Text(
                              'Last time watch ${formatDuration(watchTime.position)} / ${formatDuration(watchTime.duration)}',
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium?.copyWith(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.color
                                        ?.withValues(alpha: 0.8),
                                  ),
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
                                  ?.copyWith(
                                      fontSize: 12.0,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                              maxLines: 2,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
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
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    Center(
                        child: Container(
                      height: height * 0.9,
                      constraints: const BoxConstraints(minWidth: 40),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Align(
                        widthFactor: 1.0,
                        child: Text(episode.name, textAlign: TextAlign.center),
                      ),
                    )),
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
                            active ? Color(0xFF2196F3) : Color(0xFF00C234),
                          ),
                          minHeight: 3.0,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}

class ListEpisodesSkeleton extends StatelessWidget {
  final height = 35.0;
  final episodes = EigaEpisodes.createFakeData().episodes;

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
                  border: Border.all(color: Colors.grey.withAlpha(60)),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(7),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(child: Text(episode.name)),
              ),
            );
          },
        ),
      ),
    );
  }
}
