import 'dart:async';
import 'dart:math';

import 'package:awesome_extensions/awesome_extensions_flutter.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/interfaces/main.dart';
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
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
  final Ref<String> eigaId;
  final Ref<String?> episodeId;
  final Axis scrollDirection;
  final ScrollController? controller;
  final Future<EigaEpisodes> Function(void Function(EigaEpisodes newValue))
  getData;
  final void Function({
    required int indexEpisode,
    required EigaEpisodes episodesEiga,
  })
  onTapEpisode;
  final Future<Map<String, WatchTimeUpdated>> Function(
    EigaEpisodes episodesEiga,
  )
  getWatchTimeEpisodes;
  final EventBus eventBus;
  final bool eager;

  const ListEpisodes({
    super.key,
    required this.sourceId,
    required this.season,
    required this.thumbnail,
    required this.eigaId,
    required this.episodeId,
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
    with
        KaeruMixin,
        KaeruLifeMixin,
        AutomaticKeepAliveClientMixin,
        TickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  late final _episodesEiga = computed<Future<EigaEpisodes>>(() async {
    try {
      final episodes = await widget.getData(_updateEpisodesEiga);
      if (!mounted) throw Exception('Page destroyed');

      widget
          .getWatchTimeEpisodes(episodes)
          .then((watchTimes) {
            if (mounted) _watchTimeEpisodes.value = watchTimes;
          })
          .catchError((error) {
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
  late final _watchTimeEpisodes = ref<Map<String, WatchTimeUpdated>?>(null);

  @override
  void initState() {
    super.initState();
    onBeforeUnmount(
      widget.eventBus.on<WatchTimeDataEvent>().listen((
        WatchTimeDataEvent event,
      ) {
        if (event.watchTimeData.eigaId == widget.season.eigaId &&
            event.watchTimeData.watchTime != null) {
          _watchTimeEpisodes.value ??= {};
          _watchTimeEpisodes.value = {
            ..._watchTimeEpisodes.value!,
            event.watchTimeData.episodeId: WatchTimeUpdated(
              position: event.watchTimeData.watchTime!.position,
              duration: event.watchTimeData.watchTime!.duration,
              updatedAt: DateTime.now(),
            ),
          };
        }
      }).cancel,
    );
  }

  void _updateEpisodesEiga(EigaEpisodes newValue) {
    if (mounted) {
      _episodesEiga.force(Future.value(newValue));
    }
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
                trace: snapshot.stackTrace,
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

          Widget generateGroup(int start, [int? stop]) {
            stop ??= episodesEiga.episodes.length;
            final itemCount = stop - start;

            final indexActive = switch (widget.eigaId.value ==
                    widget.season.eigaId &&
                widget.episodeId.value != null) {
              true => episodesEiga.episodes.indexWhere(
                (episode) => episode.episodeId == widget.episodeId.value,
              ),
              false => 0,
            };

            final child = Watch(key: ValueKey(isVertical), () {
              final activeKey = GlobalKey();

              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Timer(Duration(milliseconds: 70), () {
                  if (widget.controller != null &&
                      activeKey.currentContext != null) {
                    Scrollable.ensureVisible(
                      activeKey.currentContext!,
                      duration: Duration(milliseconds: 200),
                    );
                  }
                });
              });

              if (isVertical && showListEpisodeWithGrid.value) {
                return ResponsiveGridList(
                  horizontalGridSpacing: 16,
                  verticalGridSpacing: 16,
                  horizontalGridMargin: 0,
                  verticalGridMargin: 0,
                  minItemWidth: 16.0 * 5,
                  minItemsPerRow: 2,
                  maxItemsPerRow: 12,
                  listViewBuilderOptions: ListViewBuilderOptions(
                    controller: widget.controller,
                  ),
                  children: List.generate(
                    itemCount,
                    (index) => _itemBuilder(
                      context,
                      key: indexActive == index + start ? activeKey : null,
                      index: index + start,
                      episodesEiga: episodesEiga,
                      waiting: waiting,
                      isVertical: false,
                      height: height,
                      inGridMode: true,
                    ),
                  ),
                );
              }

              return ListView.builder(
                scrollDirection: widget.scrollDirection,
                addRepaintBoundaries: false,
                itemCount: itemCount,
                controller: widget.controller,
                itemBuilder:
                    (context, index) => _itemBuilder(
                      context,
                      key: indexActive == index + start ? activeKey : null,
                      index: index + start,
                      episodesEiga: episodesEiga,
                      waiting: waiting,
                      isVertical: isVertical,
                      height: height,
                      inGridMode: false,
                    ),
              );
            });
            return waiting
                ? Skeletonizer(
                  enabled: true,
                  enableSwitchAnimation: true,
                  child: child,
                )
                : child;
          }

          const sizeGroup = 50;
          final lengthGroup = (episodesEiga.episodes.length / sizeGroup).ceil();

          final initialIndex = switch (widget.eigaId.value ==
                  widget.season.eigaId &&
              widget.episodeId.value != null) {
            true => max(
              0,
              (episodesEiga.episodes.indexWhere(
                        (episode) =>
                            episode.episodeId == widget.episodeId.value,
                      ) /
                      sizeGroup)
                  .floor(),
            ),
            false => 0,
          };
          final tabController = TabController(
            initialIndex: initialIndex,
            length: lengthGroup,
            vsync: this,
          );

          // Watch(() {
          //   final index = switch (
          //       widget.eigaId.value == widget.season.eigaId &&
          //           widget.episodeId.value != null) {
          //     true => episodesEiga.episodes.indexWhere(
          //         (episode) => episode.episodeId == widget.episodeId.value),
          //     false => 0,
          //   };

          //   if (tabController.index != index) {
          //     tabController.animateTo(index);
          //   }

          //   return nil;
          // });

          return switch (isVertical) {
            true => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Episodes').fontSize(16.0),
                    Watch(
                      () => IconButton(
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
                      ),
                    ),
                  ],
                ),
                if (lengthGroup > 1)
                  ButtonsTabBar(
                    controller: tabController,
                    height: 40,
                    backgroundColor: Colors.green[600],
                    unselectedBackgroundColor: Colors.transparent,
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: TextStyle(
                      color: Colors.green[600],
                      fontWeight: FontWeight.bold,
                    ),
                    borderWidth: 1,
                    unselectedBorderColor: Colors.green.shade600,
                    radius: 100,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    tabs: List.generate(lengthGroup, (index) {
                      return Tab(
                        child: Text(
                          'EP.${index * sizeGroup + 1}-${min((index + 1) * sizeGroup, episodesEiga.episodes.length)}',
                        ).fontSize(12.0),
                      );
                    }),
                  ),
                if (lengthGroup > 1)
                  TabBarView(
                    controller: tabController,
                    children: List.generate(lengthGroup, (indexGroup) {
                      return generateGroup(
                        indexGroup * sizeGroup,
                        min(
                          episodesEiga.episodes.length,
                          (indexGroup + 1) * sizeGroup,
                        ),
                      );
                    }),
                  ).expanded()
                else
                  generateGroup(0).expanded(),
              ],
            ),
            false => SizedBox(height: height, child: generateGroup(0)),
          };
        },
      );
    });
  }

  bool _checkEpisodeActive(EigaEpisode episode, EigaEpisodes episodesEiga) {
    return widget.eigaId.value == widget.season.eigaId &&
        (widget.episodeId.value ?? episodesEiga.episodes.first.episodeId) ==
            episode.episodeId;
  }

  Widget _itemBuilder(
    BuildContext context, {
    Key? key,
    required int index,
    required EigaEpisodes episodesEiga,
    required bool waiting,
    required bool isVertical,
    required double height,
    required bool inGridMode,
  }) {
    return Watch(key: key, () {
      final episode = episodesEiga.episodes[index];
      final active = !waiting && _checkEpisodeActive(episode, episodesEiga);

      final watchTime =
          usePick(
            _watchTimeEpisodes,
            (value) => value?[episode.episodeId],
          ).value;

      if (isVertical) {
        return InkWell(
          borderRadius: BorderRadius.circular(7),
          onTap:
              () => widget.onTapEpisode(
                indexEpisode: index,
                episodesEiga: episodesEiga,
              ),
          child: Container(
            decoration: BoxDecoration(
              color:
                  active
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
                          headers:
                              episodesEiga.image?.headers ??
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
                                value:
                                    watchTime.position.inMilliseconds /
                                    watchTime.duration.inMilliseconds,
                                backgroundColor:
                                    Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Color.fromRGBO(0, 0, 0, 0.6)
                                        : Color.fromRGBO(255, 255, 255, 0.6),
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
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(
                            fontSize: 12.0,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
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

      final text = Container(
        height: height * 0.9,
        constraints: const BoxConstraints(minWidth: 40),
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Align(
          widthFactor: 1.0,
          child: Text(episode.name, textAlign: TextAlign.center),
        ),
      );
      return Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(7),
          onTap:
              () => widget.onTapEpisode(
                indexEpisode: index,
                episodesEiga: episodesEiga,
              ),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    active
                        ? Theme.of(context).colorScheme.tertiaryContainer
                        : Colors.grey.withAlpha(60),
              ),
              color:
                  active
                      ? Theme.of(context).colorScheme.tertiaryContainer
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(7),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                if (inGridMode) Center(child: text) else text,
                if (watchTime != null)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: LinearProgressIndicator(
                      value:
                          watchTime.position.inMilliseconds /
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
          addRepaintBoundaries: false,
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
