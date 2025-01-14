import 'dart:math';

import 'package:contentsize_tabbarview/contentsize_tabbarview.dart';
import 'package:flutter/material.dart' hide TimeOfDay;
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/eiga/interfaces/basic_eiga.dart';
import 'package:hoyomi/core_services/interfaces/basic_image.dart';
import 'package:hoyomi/core_services/interfaces/basic_vtt.dart';
import 'package:hoyomi/widgets/eiga/vertical_eiga_list.dart';
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
  late ValueNotifier<MetaEiga> _metaEigaNotifier;

  late final AnimationController _bottomSheetAnimationController;

  double _aspectRatio = 16 / 9;

  final Map<String, EpisodesEiga> _cacheEpisodesStore = {};
  final ValueNotifier<String> _titleNotifier = ValueNotifier('');
  final ValueNotifier<String> _subtitleNotifier = ValueNotifier('');
  final ValueNotifier<List<Subtitle>> _subtitlesNotifier = ValueNotifier([]);
  final ValueNotifier<SourceVideo?> _sourceNotifier = ValueNotifier(null);
  final ValueNotifier<BasicImage?> _posterNotifier = ValueNotifier(null);
  final ValueNotifier<BasicVtt?> _thumbnailVtt = ValueNotifier(null);
  final ValueNotifier<void Function()?> _onPrevNotifier = ValueNotifier(null);
  final ValueNotifier<void Function()?> _onNextNotifier = ValueNotifier(null);

  late final ValueNotifier<String> _eigaId;
  final ValueNotifier<String?> _episodeId = ValueNotifier(null);
  final ValueNotifier<TimeAndDay?> _schedule = ValueNotifier(null);
  final ValueNotifier<EpisodeEiga?> _episode = ValueNotifier(null);
  final ValueNotifier<Future<List<BasicEiga>>?> _suggestNotifier =
      ValueNotifier(null);
  final ValueNotifier<Widget Function()?> _bottomSheetNotifier =
      ValueNotifier(null);

  double _initialBottomSheet = 0.5;

  @override
  void initState() {
    super.initState();
    _bottomSheetAnimationController = AnimationController(vsync: this);

    _service = getEigaService(widget.sourceId);
    _metaEigaFuture = _service.getDetails(widget.eigaId);

    if (_service.getSuggest != null) {
      _suggestNotifier.value = _metaEigaFuture.then((metaEiga) {
        return _service.getSuggest!(eiga: metaEiga, eigaId: widget.eigaId);
      });
    }

    _eigaId = ValueNotifier(widget.eigaId);
    _episodeId.value = widget.episodeId;
  }

  void _updatePlayer(MetaEiga metaEiga, EpisodeEiga episode, int episodeIndex) {
    assert(_episode.value != null);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _subtitleNotifier.value = 'Episode ${episode.name}';
    });
    _subtitlesNotifier.value = [];
    _service
        .getSubtitles(eigaId: _eigaId.value, episode: episode)
        .then((subtitles) {
      _subtitlesNotifier.value = subtitles;
    }).catchError((error) {
      debugPrint('Error: $error');
    });
    _sourceNotifier.value = null;
    _service.getSource(eigaId: _eigaId.value, episode: episode).then((source) {
      _sourceNotifier.value = source;
    }).catchError((error) {
      debugPrint('Error: $error');
    });
    _thumbnailVtt.value = null;
    if (_service.getThumbnail != null) {
      _service.getThumbnail!(
              eigaId: _eigaId.value,
              episode: episode,
              episodeIndex: episodeIndex,
              metaEiga: metaEiga)
          .then((thumbnail) {
        _thumbnailVtt.value = thumbnail;
      }).catchError((error) {
        debugPrint('Error: $error');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    var aspectRatio = 16 / 9;

    final heightPlayer = 1 / aspectRatio /* = width / height */ * size.width;
    if (size.height * 0.65 < heightPlayer) {
      aspectRatio = size.width / (size.height * 0.65);
    }

    _aspectRatio = aspectRatio;

    return ValueListenableBuilder(
        valueListenable: _bottomSheetNotifier,
        child: _buildBody(),
        builder: (context, callback, child) => Scaffold(
            body: child, bottomSheet: callback == null ? null : callback()));
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

                _metaEigaNotifier = ValueNotifier(
                    done ? snapshot.data! : MetaEiga.createFakeData());
                if (done) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _titleNotifier.value = _metaEigaNotifier.value.name;
                  });

                  _metaEigaNotifier.addListener(() {
                    _titleNotifier.value = _metaEigaNotifier.value.name;

                    _suggestNotifier.value = _service.getSuggest!(
                        eiga: _metaEigaNotifier.value, eigaId: _eigaId.value);
                  });
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Skeletonizer(
                        enabled: !done,
                        child: _buildBasicInfo(_metaEigaNotifier)),
                    SizedBox(height: 10.0),
                    if (done) _buildSchedule(),
                    if (done) _buildSeasonHeader(_metaEigaNotifier),
                    SizedBox(height: 5.0),
                    if (!done)
                      ListEpisodesSkeleton()
                    else
                      _buildSeasonArea(_metaEigaNotifier),
                    SizedBox(height: 12.0),
                    _buildSuggest()
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
      sourceId: widget.sourceId,
      titleNotifier: _titleNotifier,
      subtitleNotifier: _subtitleNotifier,
      onBack: () {
        context.pop();
      },
      subtitlesNotifier: _subtitlesNotifier,
      sourceNotifier: _sourceNotifier,
      posterNotifier: _posterNotifier,
      thumbnailVtt: _thumbnailVtt,
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
                          fontSize: 12.0)),

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
                Text('Episode',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w400)),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text('View all',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0)),
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
    final query = MediaQuery.of(context);
    final size = query.size;
    final heightPlayer =
        size.height - query.padding.top - (size.width * 1 / _aspectRatio);

    _initialBottomSheet = max(0.5, heightPlayer / size.height);
    _bottomSheetNotifier.value = () => BottomSheet(
          showDragHandle: true,
          animationController: _bottomSheetAnimationController,
          builder: (context) => DraggableScrollableSheet(
            expand: false,
            snap: true,
            snapSizes: [_initialBottomSheet],
            initialChildSize: _initialBottomSheet,
            minChildSize: 0,
            maxChildSize: 1,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                  controller: scrollController,
                  child: Column(children: [_buildSchedule(), _buildSeasonArea(metaEiga,
                      scrollDirection: Axis.vertical,
                      controller: scrollController)]) );
            },
          ),
          onClosing: () {
            _bottomSheetNotifier.value = null;
          },
        );
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

    if (episodeChanged) {
      _updatePlayer(
          metaEiga.value, episodes.episodes[indexEpisode], indexEpisode);
    }
    _updateData(metaEiga: metaEiga, episodes: episodes);

    if (seasonChanged) {
      _service.getDetails(_eigaId.value).then((value) {
        metaEiga.value = value;
        _posterNotifier.value = value.poster;
      });
    }
  }

  Widget _buildSeasonArea(ValueNotifier<MetaEiga> metaEiga,
      {scrollDirection = Axis.horizontal, ScrollController? controller}) {
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
                      thumbnail: metaEiga$.poster,
                      sourceId: widget.sourceId,
                      eigaIdNotifier: _eigaId,
                      episodeIdNotifier: _episodeId,
                      initialData: () => _cacheEpisodesStore[eigaId],
                      eager: true,
                      scrollDirection: scrollDirection,
                      controller: controller,
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
              final tabController = DefaultTabController.of(context);

              _eigaId.addListener(() {
                final index = metaEiga$.seasons
                    .indexWhere((season) => season.eigaId == _eigaId.value);
                if (index != tabController.index) {
                  tabController.animateTo(index);
                }
              });

              final children = [
                ContentSizeTabBarView(
                    children: metaEiga$.seasons.asMap().entries.map((entry) {
                  final season = entry.value;
                  final index = entry.key;

                  return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListEpisodes(
                          season: season,
                          sourceId: widget.sourceId,
                          thumbnail: metaEiga$.poster,
                          eigaIdNotifier: _eigaId,
                          episodeIdNotifier: _episodeId,
                          initialData: () => _cacheEpisodesStore[season.eigaId],
                          eager: true,
                          scrollDirection: scrollDirection,
                          controller: controller,
                          onUpdate: (episodes) {
                            _cacheEpisodesStore[season.eigaId] = episodes;
                          },
                          onTap: ({required episodes, required indexEpisode}) {
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
                  padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 0),
                  labelPadding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                  splashBorderRadius: BorderRadius.circular(10.0),
                  labelStyle: TextStyle(fontSize: 13.0),
                  indicatorColor: Theme.of(context).colorScheme.secondary,
                  tabAlignment: TabAlignment.start,
                  dividerHeight: 0,
                  tabs: metaEiga$.seasons.map((season) {
                    return Tab(text: season.name, height: 35.0);
                  }).toList(),
                ),
              ];

              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  verticalDirection: scrollDirection == Axis.vertical
                      ? VerticalDirection.up
                      : VerticalDirection.down,
                  children: children);
            }),
          );
        });
  }

  Widget _buildSuggest() {
    return ValueListenableBuilder(
        valueListenable: _suggestNotifier,
        builder: (context, suggest, child) {
          if (suggest == null) return SizedBox.shrink();

          return VerticalEigaList(
              itemsFuture: suggest,
              items: null,
              service: _service,
              title: 'Suggest',
              more: null);
        });
  }
}
