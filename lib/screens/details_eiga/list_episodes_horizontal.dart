import 'package:flutter/material.dart';
import 'package:honyomi/core_services/eiga/interfaces/episode_eiga.dart';
import 'package:honyomi/core_services/eiga/interfaces/episodes_eiga.dart';
import 'package:honyomi/core_services/eiga/interfaces/meta_eiga.dart';
import 'package:honyomi/core_services/main.dart';
import 'package:honyomi/core_services/utils_service.dart';

class ListEpisodesHorizontal extends StatefulWidget {
  final String sourceId;
  final BasicSeason season;
  final String eigaId;
  final String? episodeId;
  final EpisodesEiga? Function() initialData;
  final void Function(EpisodesEiga episodes)? onUpdate;
  final void Function(EpisodeEiga episode) onTap;

  const ListEpisodesHorizontal(
      {super.key,
      required this.sourceId,
      required this.season,
      required this.eigaId,
      required this.episodeId,
      required this.onUpdate,
      required this.onTap,
      required this.initialData});

  @override
  State<ListEpisodesHorizontal> createState() => _ListEpisodesHorizontalState();
}

class _ListEpisodesHorizontalState extends State<ListEpisodesHorizontal>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

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
    super.build(context);
    return FutureBuilder(
        future: _seasonFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: CircularProgressIndicator()));
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
          final height = 30.0;

          return SizedBox(
              height: height,
              child: Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: episodes.episodes.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final episode = episodes.episodes[index];
                        final active = widget.eigaId == widget.season.eigaId &&
                            (widget.episodeId ??
                                    episodes.episodes[0].episodeId) ==
                                episode.episodeId;

                        return Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: InkWell(
                                borderRadius: BorderRadius.circular(7),
                                onTap: () => widget.onTap(episode),
                                child: AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    height: height,
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
                                    child: Center(child: Text(episode.name)))));
                      })));
        });
  }
}
