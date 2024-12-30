import 'package:flutter/material.dart';
import 'package:honyomi/core_services/eiga/interfaces/episode_eiga.dart';
import 'package:honyomi/core_services/eiga/interfaces/episodes_eiga.dart';
import 'package:honyomi/core_services/eiga/interfaces/meta_eiga.dart';
import 'package:honyomi/core_services/main.dart';
import 'package:honyomi/core_services/utils_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListEpisodesHorizontal extends StatefulWidget {
  final String sourceId;
  final BasicSeason season;
  final ValueNotifier<String> eigaIdNotifier;
  final ValueNotifier<String?> episodeIdNotifier;
  final EpisodesEiga? Function() initialData;
  final void Function(EpisodesEiga episodes)? onUpdate;
  final void Function({
    required int indexEpisode,
    required List<EpisodeEiga> episodes,
  }) onTap;
  final bool eager;

  const ListEpisodesHorizontal(
      {super.key,
      required this.sourceId,
      required this.season,
      required this.eigaIdNotifier,
      required this.episodeIdNotifier,
      required this.onUpdate,
      required this.onTap,
      required this.initialData,
      required this.eager});

  @override
  State<ListEpisodesHorizontal> createState() => _ListEpisodesHorizontalState();
}

class _ListEpisodesHorizontalState extends State<ListEpisodesHorizontal> {
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

          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
                height: height,
                child: Center(
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: SpinKitPouringHourGlassRefined(
                            color: Theme.of(context).colorScheme.onSurface,
                            size: height - 5))));
          }
          if (snapshot.hasError) {
            return Center(
                child: UtilsService.errorWidgetBuilder(context,
                    error: snapshot.error,
                    orElse: (error) => Text('Error: $error')));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          }

          final episodes = snapshot.data as EpisodesEiga;

          bool checkEpisodeActive(EpisodeEiga episode) {
            return widget.eigaIdNotifier.value == widget.season.eigaId &&
                (widget.episodeIdNotifier.value ??
                        episodes.episodes[0].episodeId) ==
                    episode.episodeId;
          }

          if (widget.eager) {
            for (final episode in episodes.episodes) {
              final active = checkEpisodeActive(episode);

              if (active) {
                final episodeIndex = episodes.episodes.indexOf(episode);

                widget.onTap(
                  indexEpisode: episodeIndex,
                  episodes: episodes.episodes,
                );
                break;
              }
            }
          }

          return SizedBox(
              height: height,
              child: AnimatedBuilder(
                  animation: Listenable.merge(
                      [widget.eigaIdNotifier, widget.episodeIdNotifier]),
                  builder: (context, child) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: episodes.episodes.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final episode = episodes.episodes[index];
                          final active = checkEpisodeActive(episode);

                          return Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(7),
                                  onTap: () => widget.onTap(
                                        indexEpisode: index,
                                        episodes: episodes.episodes,
                                      ),
                                  child: Container(
                                      height: height * 0.9,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: active
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .tertiaryContainer
                                              : Colors.grey.withAlpha(60),
                                        ),
                                        color: active
                                            ? Theme.of(context)
                                                .colorScheme
                                                .tertiaryContainer
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child:
                                          Center(child: Text(episode.name)))));
                        });
                  }));
        });
  }
}

class ListEpisodesHorizontalSkeleton extends StatelessWidget {
  final height = 35.0;
  final episodes = EpisodesEiga.createFakeData().episodes;

  ListEpisodesHorizontalSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(enabled: true, child: SizedBox(
        height:height,child: ListView.builder(
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
