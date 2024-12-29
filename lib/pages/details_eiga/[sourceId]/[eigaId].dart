import 'dart:math';

import 'package:contentsize_tabbarview/contentsize_tabbarview.dart';
import 'package:flutter/material.dart' hide TimeOfDay;
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

import 'package:honyomi/core_services/eiga/eiga_base_service.dart';
import 'package:honyomi/core_services/eiga/interfaces/episode_eiga.dart';
import 'package:honyomi/core_services/eiga/interfaces/episodes_eiga.dart';
import 'package:honyomi/core_services/eiga/interfaces/meta_eiga.dart';
import 'package:honyomi/core_services/eiga/interfaces/source_video.dart';
import 'package:honyomi/core_services/eiga/interfaces/subtitle.dart';
import 'package:honyomi/core_services/main.dart';
import 'package:honyomi/screens/details_eiga/list_episodes_horizontal.dart';
import 'package:honyomi/screens/home_eiga/player_eiga.dart';
import 'package:honyomi/utils/format_number.dart';
import 'package:honyomi/widgets/vertical_separator.dart';

class DetailsEigaPage extends StatefulWidget {
  final String sourceId;
  final String eigaId;
  final String? episodeId;

  const DetailsEigaPage(
      {super.key,
      required this.sourceId,
      required this.eigaId,
      required this.episodeId});

  @override
  State<DetailsEigaPage> createState() => _DetailsEigaPageState();
}

class _DetailsEigaPageState extends State<DetailsEigaPage> {
  late final EigaBaseService _service;
  late Future<MetaEiga> _metaEigaFuture;

  final Map<String, EpisodesEiga> _cacheEpisodesStore = {};
  ValueNotifier<String> _titleNotifier = ValueNotifier('');
  final ValueNotifier<String> _subtitleNotifier = ValueNotifier('');
  final ValueNotifier<List<Subtitle>> _subtitlesNotifier = ValueNotifier([]);
  final ValueNotifier<SourceVideo?> _sourceNotifier = ValueNotifier(null);

  late final ValueNotifier<String> _eigaId;
  final ValueNotifier<String?> _episodeId = ValueNotifier(null);
  final ValueNotifier<TimeAndDay?> _schedule = ValueNotifier(null);
  final ValueNotifier<EpisodeEiga?> _episode = ValueNotifier(null);
  Listenable? _mergeMetaListeners;

  @override
  void initState() {
    super.initState();
    _service = getEigaService(widget.sourceId);
    _metaEigaFuture = _service.getDetails(widget.eigaId);

    _eigaId = ValueNotifier(widget.eigaId);
    _episodeId.value = widget.episodeId;
  }

  void _updatePlayer() {
    assert(_episode.value != null);

    _service
        .getSubtitles(eigaId: _eigaId.value, episode: _episode.value!)
        .then((subtitles) {
      _subtitlesNotifier.value = subtitles;
    });
    _service
        .getSource(eigaId: _eigaId.value, episode: _episode.value!)
        .then((source) {
      _sourceNotifier.value = source;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return SingleChildScrollView(
        child: Column(children: [
      _buildPlayer(),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: FutureBuilder(
            future: _metaEigaFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              final metaEiga = ValueNotifier(snapshot.data as MetaEiga);
              _titleNotifier = ValueNotifier(metaEiga.value.name);
              _mergeMetaListeners =
                  Listenable.merge([metaEiga, _eigaId, _episodeId]);
              metaEiga.addListener(() {
                _titleNotifier.value = metaEiga.value.name;
              });

              return Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBasicInfo(metaEiga),
                  SizedBox(height: 10.0),
                  _buildSchedule(),
                  _buildSeasonArea(metaEiga),
                ],
              );
            },
          )),
    ]));
  }

  Widget _buildPlayer() {
    return PlayerEiga(
      titleNotifier: _titleNotifier,
      subtitleNotifier: _subtitleNotifier,
      onBack: () {
        context.pop();
      },
      subtitlesNotifier: _subtitlesNotifier,
      sourceNotifier: _sourceNotifier,
      fetchSourceContent: _service.fetchSourceContent,
    );
  }

  Widget _buildBasicInfo(ValueNotifier<MetaEiga> metaEiga) {
    return ValueListenableBuilder(
        valueListenable: metaEiga,
        builder: (context, metaEiga, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // name
                Text(metaEiga.name,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
                if (metaEiga.views != null)
                  Text('${formatNumber(metaEiga.views!)} views',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 11.0)),

                SizedBox(height: 2.0),

                // author
                Row(children: [
                  Row(children: [
                    Text('Author ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 12.0)),
                    Text(metaEiga.author ?? 'Unknown',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 12.0)),
                  ]),
                  if (metaEiga.studio != null) VerticalSeparator(),
                  if (metaEiga.studio != null)
                    Row(children: [
                      Text('Studio by ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: 12.0)),
                      GestureDetector(
                          onTap: () {
                            context.push(
                                '/section_eiga/${widget.sourceId}/${metaEiga.studio!.genreId}');
                          },
                          child: Text(
                            metaEiga.studio!.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    fontSize: 12.0),
                          )),
                    ])
                ]),

                SizedBox(height: 2.0),

                /////
                Row(children: [
                  if (metaEiga.quality != null)
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                            color: Colors.greenAccent.shade400,
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Center(
                            child: Text(metaEiga.quality!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontSize: 12.0)))),
                  if (metaEiga.quality != null) VerticalSeparator(),
                  if (metaEiga.yearOf != null)
                    Text(metaEiga.yearOf.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 12.0)),
                  if (metaEiga.duration != null) VerticalSeparator(),
                  if (metaEiga.duration != null)
                    Text('Updated to ${metaEiga.duration}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 12.0)),
                  if (metaEiga.countries?.isNotEmpty == true)
                    VerticalSeparator(),
                  if (metaEiga.countries?.isNotEmpty == true)
                    Row(
                        children: metaEiga.countries!.map((country) {
                      return Padding(
                          padding: EdgeInsets.only(right: 4.0),
                          child: GestureDetector(
                              onTap: () {
                                context.push(
                                    '/section_eiga/${widget.sourceId}/${country.genreId}');
                              },
                              child: Text(country.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontSize: 12.0,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiaryFixedDim))));
                    }).toList())
                ]),

                SizedBox(height: 2.0),

                Row(children: [
                  if (metaEiga.rate != null)
                    Row(children: [
                      Icon(
                        MaterialCommunityIcons.star,
                        color: Colors.blue.shade200,
                        size: 14.0,
                      ),
                      Text(
                        ' ${metaEiga.rate}',
                        style: const TextStyle(
                          fontSize: 12.0,
                        ),
                      )
                    ]),
                  if (metaEiga.countRate != null) VerticalSeparator(),
                  if (metaEiga.countRate != null)
                    Text('${metaEiga.countRate} people rated',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 12.0))
                ]),

                SizedBox(height: 2.0),

                Wrap(
                  spacing: 7.0, // Space between the genre tags
                  children: metaEiga.genres.map((genre) {
                    return GestureDetector(
                      onTap: () {
                        context.push(
                            '/section_eiga/${widget.sourceId}/${genre.genreId}');
                      },
                      child: Text(
                        '#${genre.name}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 12.0,
                              color: Theme.of(context)
                                  .colorScheme
                                  .tertiaryFixedDim,
                            ),
                      ),
                    );
                  }).toList(),
                ),

                if (metaEiga.originalName != null) SizedBox(height: 5.0),

                if (metaEiga.originalName != null)
                  Wrap(children: [
                    Text('Other name ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 12.0)),
                    Text(metaEiga.originalName!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 12.0))
                  ])
              ],
            ));
  }

  Widget _buildSchedule() {
    return ValueListenableBuilder(
        valueListenable: _schedule,
        builder: (context, schedule, child) {
          if (schedule == null) return SizedBox.shrink();

          return Row(children: [
            Icon(
              MaterialCommunityIcons.clock_outline,
              size: 16.0,
              color: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(width: 5.0),
            Text(
              'Updated on day ${schedule.day} of the week at ${schedule.hour}:${schedule.minute}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 12.0),
            )
          ]);
        });
  }

  Widget _buildSeasonArea(ValueNotifier<MetaEiga> metaEiga) {
    void updateData(EpisodesEiga episodes) {
      if (episodes.image != null) {
        metaEiga.value.image = episodes.image!;
      }
      if (episodes.poster != null) {
        metaEiga.value.poster = episodes.poster;
      }
      if (episodes.schedule != null) {
        _schedule.value = episodes.schedule;
      }

      metaEiga.value = metaEiga.value;
    }

    return AnimatedBuilder(
        animation: _mergeMetaListeners!,
        builder: (context, child) {
          if (metaEiga.value.seasons.isEmpty) {
            return ListEpisodesHorizontal(
                season: BasicSeason(eigaId: _eigaId.value, name: 'Episodes'),
                sourceId: widget.sourceId,
                eigaId: _eigaId.value,
                episodeId: _episodeId.value,
                initialData: () => _cacheEpisodesStore[_eigaId.value],
                eager: true,
                onUpdate: (episodes) {
                  _cacheEpisodesStore[_eigaId.value] = episodes;
                },
                onTap: (episode) {
                  _episodeId.value = episode.episodeId;
                  _updatePlayer();
                });
          }

          // tab view
          return DefaultTabController(
            length: metaEiga.value.seasons.length,
            initialIndex: max(
                0,
                metaEiga.value.seasons
                    .indexWhere((season) => season.eigaId == _eigaId.value)),
            child: Builder(builder: (context) {
              final controller = DefaultTabController.of(context);
              controller.addListener(() {
                final episodes = _cacheEpisodesStore[
                    metaEiga.value.seasons[controller.index].eigaId];

                if (episodes != null) {
                  updateData(episodes);
                }
              });

              return Column(children: [
                TabBar(
                  isScrollable: true,
                  splashBorderRadius: BorderRadius.circular(35.0),
                  indicatorColor: Theme.of(context).colorScheme.secondary,
                  tabs: metaEiga.value.seasons.map((season) {
                    return Tab(
                      text: season.name,
                    );
                  }).toList(),
                ),
                ContentSizeTabBarView(
                    children: metaEiga.value.seasons.map((season) {
                  return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListEpisodesHorizontal(
                          season: season,
                          sourceId: widget.sourceId,
                          eigaId: _eigaId.value,
                          episodeId: _episodeId.value,
                          initialData: () => _cacheEpisodesStore[season.eigaId],
                          eager: true,
                          onUpdate: (episodes) {
                            _cacheEpisodesStore[season.eigaId] = episodes;
                            if (season.eigaId ==
                                metaEiga
                                    .value.seasons[controller.index].eigaId) {
                              updateData(episodes);
                            }
                          },
                          onTap: (episode) {
                            final oldEiga = _eigaId;
                            _eigaId.value = season.eigaId;
                            _episodeId.value = episode.episodeId;
                            _episode.value = episode;
                            _subtitleNotifier.value = episode.name;
                            _updatePlayer();

                            if (oldEiga != _eigaId) {
                              _service.getDetails(_eigaId.value).then((value) {
                                metaEiga.value = value;
                              });
                            }
                          }));
                }).toList())
              ]);
            }),
          );
        });
  }
}
