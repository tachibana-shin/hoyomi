import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/interfaces/episode_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/episodes_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/meta_eiga.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListEpisodes extends StatefulWidget {
  final String sourceId;
  final BasicSeason season;
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

          Widget itemBuilder(BuildContext context, int index) {
            final episode = episodes.episodes[index];
            final active = !waiting && checkEpisodeActive(episode);

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

          if (widget.scrollDirection == Axis.vertical) {
            return AnimatedBuilder(
                animation: Listenable.merge(
                    [widget.eigaIdNotifier, widget.episodeIdNotifier]),
                builder: (context, child) {
                  final child = SingleChildScrollView(
                      controller: widget.controller,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: episodes.episodes.indexed.map((entry) {
                          return itemBuilder(context, entry.$1);
                        }).toList(),
                      ));

                  if (waiting) return Skeletonizer(enabled: true, child: child);
                  return child;
                });
          }
          return SizedBox(
              height: height,
              child: AnimatedBuilder(
                  animation: Listenable.merge(
                      [widget.eigaIdNotifier, widget.episodeIdNotifier]),
                  builder: (context, child) {
                    final child = ListView.builder(
                        scrollDirection: widget.scrollDirection,
                        itemCount: episodes.episodes.length,
                        shrinkWrap: true,
                        itemBuilder: itemBuilder);

                    if (waiting) {
                      return Skeletonizer(enabled: true, child: child);
                    }
                    return child;
                  }));
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
