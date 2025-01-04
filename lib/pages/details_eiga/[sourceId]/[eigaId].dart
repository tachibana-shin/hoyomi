import 'dart:math';

import 'package:contentsize_tabbarview/contentsize_tabbarview.dart';
import 'package:flutter/material.dart' hide TimeOfDay;
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/interfaces/basic_image.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:hoyomi/core_services/eiga/eiga_base_service.dart';
import 'package:hoyomi/core_services/eiga/interfaces/episode_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/episodes_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/meta_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/source_video.dart';
import 'package:hoyomi/core_services/eiga/interfaces/subtitle.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/screens/details_eiga/list_episodes.dart';
import 'package:hoyomi/screens/home_eiga/player_eiga.dart';
import 'package:hoyomi/utils/format_number.dart';
import 'package:hoyomi/widgets/vertical_separator.dart';

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

class _DetailsEigaPageState extends State<DetailsEigaPage>
    with TickerProviderStateMixin {
  late final EigaBaseService _service;
  late Future<MetaEiga> _metaEigaFuture;

  final ValueNotifier<double> _backdropNotifier = ValueNotifier(0.5);
  final double _aspectRatio = 16 / 9;

  final Map<String, EpisodesEiga> _cacheEpisodesStore = {};
  final ValueNotifier<String> _titleNotifier = ValueNotifier('');
  final ValueNotifier<String> _subtitleNotifier = ValueNotifier('');
  final ValueNotifier<List<Subtitle>> _subtitlesNotifier = ValueNotifier([]);
  final ValueNotifier<SourceVideo?> _sourceNotifier = ValueNotifier(null);
  final ValueNotifier<BasicImage?> _posterNotifier = ValueNotifier(null);
  final ValueNotifier<void Function()?> _onPrevNotifier = ValueNotifier(null);
  final ValueNotifier<void Function()?> _onNextNotifier = ValueNotifier(null);

  late final ValueNotifier<String> _eigaId;
  final ValueNotifier<String?> _episodeId = ValueNotifier(null);
  final ValueNotifier<TimeAndDay?> _schedule = ValueNotifier(null);
  final ValueNotifier<EpisodeEiga?> _episode = ValueNotifier(null);

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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _subtitleNotifier.value = 'Episode ${_episode.value!.name}';
    });
    _service
        .getSubtitles(eigaId: _eigaId.value, episode: _episode.value!)
        .then((subtitles) {
      _subtitlesNotifier.value = subtitles;
    });
    _sourceNotifier.value = null;
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
    return Stack(children: [
      SingleChildScrollView(
          child: Column(children: [
        AspectRatio(
          aspectRatio: _aspectRatio,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: FutureBuilder(
              future: _metaEigaFuture,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                final done =
                    snapshot.connectionState != ConnectionState.waiting;

                final metaEiga = ValueNotifier(
                    done ? snapshot.data! : MetaEiga.createFakeData());
                if (done) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _titleNotifier.value = metaEiga.value.name;
                  });

                  metaEiga.addListener(() {
                    _titleNotifier.value = metaEiga.value.name;
                  });
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Skeletonizer(
                        enabled: !done, child: _buildBasicInfo(metaEiga)),
                    SizedBox(height: 10.0),
                    if (done) _buildSchedule(),
                    if (done) _buildSeasonHeader(metaEiga),
                    if (!done)
                      ListEpisodesHorizontalSkeleton()
                    else
                      _buildSeasonArea(metaEiga),
                  ],
                );
              },
            )),
      ])),
      Positioned(top: 0, left: 0, right: 0, child: _buildPlayer()),
    ]);
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
      posterNotifier: _posterNotifier,
      aspectRatio: _aspectRatio,
      fetchSourceContent: _service.fetchSourceContent,
      onPrev: _onPrevNotifier,
      onNext: _onNextNotifier,
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
                      Text('Studio ',
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
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
                            fontSize: 12.0)),
                  if (metaEiga.countRate != null) VerticalSeparator(),
                  if (metaEiga.movieSeason != null)
                    GestureDetector(
                        onTap: () {
                          context.push(
                              '/section_eiga/${widget.sourceId}/${metaEiga.movieSeason!.genreId}');
                        },
                        child: Text(metaEiga.movieSeason!.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: 12.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiaryFixedDim)))
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
                  RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Other name: ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: 12.0)),
                        TextSpan(
                            text: metaEiga.originalName!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontSize: 12.0))
                      ]))
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
              'Updated on day ${[
                'Sunday',
                'Monday',
                'Tuesday',
                'Wednesday',
                'Thursday',
                'Friday',
                'Saturday'
              ][schedule.day]} of the week at ${schedule.hour}:${schedule.minute}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 12.0),
            )
          ]);
        });
  }

  Widget _buildSeasonHeader(ValueNotifier<MetaEiga> metaEiga) {
    return GestureDetector(
        onTap: () => _showModalEpisodes(metaEiga),
        child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Episode', style: Theme.of(context).textTheme.titleSmall),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text('View all',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 12.0)),
                  Center(
                      child: Icon(
                    MaterialCommunityIcons.chevron_right,
                    size: 16.0,
                    color: Theme.of(context).colorScheme.secondary,
                  ))
                ])
              ],
            )));
  }

  void _showModalEpisodes(ValueNotifier<MetaEiga> metaEiga) {
    final size = MediaQuery.of(context).size;
    final heightPlayer = size.height -
        MediaQuery.of(context).padding.top -
        (size.width * 1 / _aspectRatio);
    final initial = max(0.5, heightPlayer / size.height);

    showModalBottomSheet(
      context: context,
      elevation: 0,
      barrierColor: Colors.transparent,
      // backgroundColor: Colors.transparent,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: initial,
          snapSizes: [initial],
          minChildSize: 0,
          expand: false,
          snap: true,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(children: [
                Row(children: [_buildModalEpisodes(metaEiga)])
              ]),
            );
          },
        );
      },
    );
  }

  Widget _buildModalEpisodes(ValueNotifier<MetaEiga> metaEiga) {
    return ValueListenableBuilder(
        valueListenable: metaEiga,
        builder: (context, metaEiga$, child) {
          if (metaEiga$.seasons.isEmpty) {
            return ValueListenableBuilder(
                valueListenable: _eigaId,
                builder: (context, eigaId, child) {
                  final season = BasicSeason(eigaId: eigaId, name: 'Episodes');
                  return ListEpisodes(
                      season: season,
                      sourceId: widget.sourceId,
                      eigaIdNotifier: _eigaId,
                      episodeIdNotifier: _episodeId,
                      scrollDirection: Axis.vertical,
                      initialData: () => _cacheEpisodesStore[eigaId],
                      eager: true,
                      onUpdate: (episodes) {
                        _cacheEpisodesStore[eigaId] = episodes;
                      },
                      onTap: ({required episodes, required indexEpisode}) {
                        _onChangeEpisode(
                            metaEiga: metaEiga,
                            indexEpisode: indexEpisode,
                            indexSeason: 0,
                            episodes: episodes,
                            seasons: [season]);
                      });
                });
          }

          // tab view
          return DefaultTabController(
            length: metaEiga$.seasons.length,
            initialIndex: max(
                0,
                metaEiga$.seasons
                    .indexWhere((season) => season.eigaId == _eigaId.value)),
            child: Builder(builder: (context) {
              final controller = DefaultTabController.of(context);

              _eigaId.addListener(() {
                final index = metaEiga$.seasons
                    .indexWhere((season) => season.eigaId == _eigaId.value);
                if (index != controller.index) {
                  controller.animateTo(index);
                }
              });

              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContentSizeTabBarView(
                        children:
                            metaEiga$.seasons.asMap().entries.map((entry) {
                      final season = entry.value;
                      final index = entry.key;

                      return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: ListEpisodes(
                              season: season,
                              sourceId: widget.sourceId,
                              eigaIdNotifier: _eigaId,
                              episodeIdNotifier: _episodeId,
                              scrollDirection: Axis.vertical,
                              initialData: () =>
                                  _cacheEpisodesStore[season.eigaId],
                              eager: true,
                              onUpdate: (episodes) {
                                _cacheEpisodesStore[season.eigaId] = episodes;
                              },
                              onTap: (
                                  {required episodes, required indexEpisode}) {
                                _onChangeEpisode(
                                    metaEiga: metaEiga,
                                    indexEpisode: indexEpisode,
                                    indexSeason: index,
                                    episodes: episodes,
                                    seasons: metaEiga$.seasons);
                              }));
                    }).toList()),
                    TabBar(
                      isScrollable: true,
                      splashBorderRadius: BorderRadius.circular(35.0),
                      indicatorColor: Theme.of(context).colorScheme.secondary,
                      tabAlignment: TabAlignment.start,
                      dividerHeight: 0,
                      tabs: metaEiga$.seasons.map((season) {
                        return Tab(
                          text: season.name,
                        );
                      }).toList(),
                    ),
                  ]);
            }),
          );
        });
  }

  void _updateData(
      {required ValueNotifier<MetaEiga> metaEiga,
      required EpisodesEiga episodes}) {
    var eigaChanged = false;
    if (episodes.image != metaEiga.value.image && episodes.image != null) {
      metaEiga.value.image = episodes.image!;
      eigaChanged = true;
    }
    if (episodes.poster != metaEiga.value.poster) {
      metaEiga.value.poster = episodes.poster;
      eigaChanged = true;
    }
    if (_schedule.value != episodes.schedule) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _schedule.value = episodes.schedule;
      });
    }

    if (_posterNotifier.value != metaEiga.value.poster) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _posterNotifier.value = metaEiga.value.poster;
      });
    }

    if (eigaChanged) metaEiga.value = metaEiga.value;
  }

  void _onChangeEpisode({
    required ValueNotifier<MetaEiga> metaEiga,
    required int indexEpisode,
    required int indexSeason,
    required EpisodesEiga episodes,
    required List<BasicSeason> seasons,
  }) {
    final oldEiga = _eigaId.value;
    final seasonChanged = oldEiga != seasons[indexSeason].eigaId;

    if (seasonChanged) {
      _eigaId.value = seasons[indexSeason].eigaId;
    }

    var episodeChanged = false;
    if (_episodeId.value != episodes.episodes[indexEpisode].episodeId) {
      _episodeId.value = episodes.episodes[indexEpisode].episodeId;
      episodeChanged = true;
    }
    if (_episode.value != episodes.episodes[indexEpisode]) {
      _episode.value = episodes.episodes[indexEpisode];
      episodeChanged = true;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentIndex =
          episodes.episodes.indexWhere((e) => e.episodeId == _episodeId.value);
      _onPrevNotifier.value = currentIndex > 0
          ? () => _onChangeEpisode(
                metaEiga: metaEiga,
                indexEpisode: currentIndex - 1,
                indexSeason: indexSeason,
                episodes: episodes,
                seasons: seasons,
              )
          : null;

      _onNextNotifier.value = currentIndex < episodes.episodes.length - 1
          ? () => _onChangeEpisode(
                metaEiga: metaEiga,
                indexEpisode: currentIndex + 1,
                indexSeason: indexSeason,
                episodes: episodes,
                seasons: seasons,
              )
          : null;
    });

    if (episodeChanged) _updatePlayer();
    _updateData(metaEiga: metaEiga, episodes: episodes);

    if (seasonChanged) {
      _service.getDetails(_eigaId.value).then((value) {
        metaEiga.value = value;
        _posterNotifier.value = value.poster;
      });
    }
  }

  Widget _buildSeasonArea(ValueNotifier<MetaEiga> metaEiga) {
    return ValueListenableBuilder(
        valueListenable: metaEiga,
        builder: (context, metaEiga$, child) {
          if (metaEiga$.seasons.isEmpty) {
            return ValueListenableBuilder(
                valueListenable: _eigaId,
                builder: (context, eigaId, child) {
                  final season = BasicSeason(eigaId: eigaId, name: 'Episodes');
                  return ListEpisodes(
                      season: season,
                      sourceId: widget.sourceId,
                      eigaIdNotifier: _eigaId,
                      episodeIdNotifier: _episodeId,
                      initialData: () => _cacheEpisodesStore[eigaId],
                      eager: true,
                      onUpdate: (episodes) {
                        _cacheEpisodesStore[eigaId] = episodes;
                      },
                      onTap: ({required episodes, required indexEpisode}) {
                        _onChangeEpisode(
                            metaEiga: metaEiga,
                            indexEpisode: indexEpisode,
                            indexSeason: 0,
                            episodes: episodes,
                            seasons: [season]);
                      });
                });
          }

          // tab view
          return DefaultTabController(
            length: metaEiga$.seasons.length,
            initialIndex: max(
                0,
                metaEiga$.seasons
                    .indexWhere((season) => season.eigaId == _eigaId.value)),
            child: Builder(builder: (context) {
              final controller = DefaultTabController.of(context);

              _eigaId.addListener(() {
                final index = metaEiga$.seasons
                    .indexWhere((season) => season.eigaId == _eigaId.value);
                if (index != controller.index) {
                  controller.animateTo(index);
                }
              });

              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContentSizeTabBarView(
                        children:
                            metaEiga$.seasons.asMap().entries.map((entry) {
                      final season = entry.value;
                      final index = entry.key;

                      return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: ListEpisodes(
                              season: season,
                              sourceId: widget.sourceId,
                              eigaIdNotifier: _eigaId,
                              episodeIdNotifier: _episodeId,
                              initialData: () =>
                                  _cacheEpisodesStore[season.eigaId],
                              eager: true,
                              onUpdate: (episodes) {
                                _cacheEpisodesStore[season.eigaId] = episodes;
                              },
                              onTap: (
                                  {required episodes, required indexEpisode}) {
                                _onChangeEpisode(
                                    metaEiga: metaEiga,
                                    indexEpisode: indexEpisode,
                                    indexSeason: index,
                                    episodes: episodes,
                                    seasons: metaEiga$.seasons);
                              }));
                    }).toList()),
                    TabBar(
                      isScrollable: true,
                      splashBorderRadius: BorderRadius.circular(35.0),
                      indicatorColor: Theme.of(context).colorScheme.secondary,
                      tabAlignment: TabAlignment.start,
                      dividerHeight: 0,
                      tabs: metaEiga$.seasons.map((season) {
                        return Tab(
                          text: season.name,
                        );
                      }).toList(),
                    ),
                  ]);
            }),
          );
        });
  }
}
