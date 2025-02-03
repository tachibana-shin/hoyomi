import 'dart:math';

import 'package:contentsize_tabbarview/contentsize_tabbarview.dart';
import 'package:flutter/material.dart' hide TimeOfDay;
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/composable/bottom_sheet_no_scrim.dart';
import 'package:hoyomi/core_services/eiga/interfaces/basic_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/opening_ending.dart';
import 'package:hoyomi/core_services/eiga/interfaces/watch_time.dart';
import 'package:hoyomi/core_services/eiga/mixin/eiga_history_mixin.dart';
import 'package:hoyomi/core_services/interfaces/basic_image.dart';
import 'package:hoyomi/core_services/interfaces/basic_vtt.dart';
import 'package:hoyomi/widgets/eiga/button_follow_eiga.dart';
import 'package:hoyomi/widgets/eiga/button_share_eiga.dart';
import 'package:hoyomi/widgets/eiga/vertical_eiga_list.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';
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

  final ScrollController controller = ScrollController();

  double _aspectRatio = 16 / 9;

  final Map<String, EpisodesEiga> _cacheEpisodesStore = {};
  final Map<String, Map<String, WatchTime>> _cacheWatchTimeStore = {};
  final ValueNotifier<String> _titleNotifier = ValueNotifier('');
  final ValueNotifier<String> _subtitleNotifier = ValueNotifier('');
  final ValueNotifier<List<Subtitle>> _subtitlesNotifier = ValueNotifier([]);
  final ValueNotifier<SourceVideo?> _sourceNotifier = ValueNotifier(null);
  final ValueNotifier<BasicImage?> _posterNotifier = ValueNotifier(null);
  final ValueNotifier<BasicVtt?> _thumbnailVtt = ValueNotifier(null);
  final ValueNotifier<OpeningEnding?> _openingEndingNotifier =
      ValueNotifier(null);
  final ValueNotifier<WatchTime?> _watchTimeNotifier = ValueNotifier(null);
  final ValueNotifier<void Function()?> _onPrevNotifier = ValueNotifier(null);
  final ValueNotifier<void Function()?> _onNextNotifier = ValueNotifier(null);
  final ValueNotifier<Widget Function(BuildContext context)?> _overlayNotifier =
      ValueNotifier(null);

  late final ValueNotifier<String> _eigaId;
  final ValueNotifier<String?> _episodeId = ValueNotifier(null);
  final ValueNotifier<TimeAndDay?> _schedule = ValueNotifier(null);
  final ValueNotifier<EpisodeEiga?> _episode = ValueNotifier(null);
  final ValueNotifier<Future<List<BasicEiga>>?> _suggestNotifier =
      ValueNotifier(null);

  double _initialBottomSheet = 0.5;

  @override
  void initState() {
    super.initState();

    _service = getEigaService(widget.sourceId);
    _metaEigaFuture = _service.getDetails(widget.eigaId);

    if (_service.getSuggest != null) {
      _suggestNotifier.value = _metaEigaFuture.then((metaEiga) {
        return _service.getSuggest!(metaEiga: metaEiga, eigaId: widget.eigaId);
      });
    }

    _eigaId = ValueNotifier(widget.eigaId);
    _episodeId.value = widget.episodeId;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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

    _openingEndingNotifier.value = null;
    _service
        .getOpeningEnding(
            eigaId: _eigaId.value,
            episode: episode,
            episodeIndex: episodeIndex,
            metaEiga: metaEiga)
        .then((data) {
      _openingEndingNotifier.value = data;
    }).catchError((error) {
      debugPrint('Error: $error');
    });

    _watchTimeNotifier.value = null;
    if (_service is EigaHistoryMixin) {
      (_service as EigaHistoryMixin)
          .getWatchTime(
              eigaId: _eigaId.value,
              episode: episode,
              episodeIndex: episodeIndex,
              metaEiga: metaEiga)
          .then((data) {
        _watchTimeNotifier.value = data;
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

    return SafeArea(child: Scaffold(body: _buildBody()));
  }

  Widget _buildBody() {
    return Stack(children: [
      SingleChildScrollView(
          controller: controller,
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
                            metaEiga: _metaEigaNotifier.value,
                            eigaId: _eigaId.value);
                      });
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Skeletonizer(
                            enabled: !done,
                            enableSwitchAnimation: true,
                            child: _buildBasicInfo(_metaEigaNotifier)),
                        SizedBox(height: 10.0),
                        // button group
                        Skeletonizer(
                            enabled: !done,
                            enableSwitchAnimation: true,
                            child: _buildButtonGroup(_metaEigaNotifier)),
                        SizedBox(height: 5.0),
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
      watchTimeNotifier: _watchTimeNotifier,
      onBack: () {
        context.pop();
      },
      onTapPlaylist: (isFullscreen) {
        if (isFullscreen) {
          _showModalEpisodesFullscreen(_metaEigaNotifier);
          return;
        }
        _showModalEpisodes(_metaEigaNotifier);
      },
      subtitlesNotifier: _subtitlesNotifier,
      sourceNotifier: _sourceNotifier,
      posterNotifier: _posterNotifier,
      thumbnailVtt: _thumbnailVtt,
      openingEndingNotifier: _openingEndingNotifier,
      aspectRatio: _aspectRatio,
      fetchSourceContent: _service.fetchSourceContent,
      onPrev: _onPrevNotifier,
      onNext: _onNextNotifier,
      overlayNotifier: _overlayNotifier,
    );
  }

  Widget _buildBasicInfo(ValueNotifier<MetaEiga> metaEiga) {
    return ValueListenableBuilder(
        valueListenable: metaEiga,
        builder: (context, metaEiga$, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () => _showModalMetadata(metaEiga),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // name
                          Text(metaEiga$.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18.0),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                          if (metaEiga$.views != null)
                            Text('${formatNumber(metaEiga$.views!)} views',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontSize: 14.0)),

                          SizedBox(height: 2.0),

                          // author
                          Row(children: [
                            Row(children: [
                              Text('Author ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontSize: 14.0)),
                              Text(metaEiga$.author ?? 'Unknown',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontSize: 14.0)),
                            ]),
                            if (metaEiga$.studio != null) VerticalSeparator(),
                            if (metaEiga$.studio != null)
                              Row(children: [
                                Text('Studio ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            fontSize: 14.0)),
                                GestureDetector(
                                    onTap: () {
                                      context.push(
                                          '/section_eiga/${widget.sourceId}/${metaEiga$.studio!.genreId}');
                                    },
                                    child: Text(
                                      metaEiga$.studio!.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface,
                                              fontSize: 14.0),
                                    )),
                              ])
                          ]),
                        ])),
                SizedBox(height: 2.0),

                /////
                Row(children: [
                  if (metaEiga$.quality != null)
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                            color: Colors.greenAccent.shade400,
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Center(
                            child: Text(metaEiga$.quality!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontSize: 14.0)))),
                  if (metaEiga$.quality != null) VerticalSeparator(),
                  if (metaEiga$.yearOf != null)
                    Text(metaEiga$.yearOf.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 14.0)),
                  if (metaEiga$.duration != null) VerticalSeparator(),
                  if (metaEiga$.duration != null)
                    Text('Updated to ${metaEiga$.duration}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 14.0)),
                  if (metaEiga$.countries?.isNotEmpty == true)
                    VerticalSeparator(),
                  if (metaEiga$.countries?.isNotEmpty == true)
                    Row(
                        children: metaEiga$.countries!.map((country) {
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
                                          fontSize: 14.0,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiaryFixedDim))));
                    }).toList())
                ]),

                SizedBox(height: 2.0),

                Row(children: [
                  if (metaEiga$.rate != null)
                    Row(children: [
                      Icon(
                        MaterialCommunityIcons.star,
                        color: Colors.blue.shade200,
                        size: 14.0,
                      ),
                      Text(
                        ' ${metaEiga$.rate}',
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                      )
                    ]),
                  if (metaEiga$.countRate != null) VerticalSeparator(),
                  if (metaEiga$.countRate != null)
                    Text('${metaEiga$.countRate} people rated',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 14.0)),
                  if (metaEiga$.countRate != null) VerticalSeparator(),
                  if (metaEiga$.movieSeason != null)
                    GestureDetector(
                        onTap: () {
                          context.push(
                              '/section_eiga/${widget.sourceId}/${metaEiga$.movieSeason!.genreId}');
                        },
                        child: Text(metaEiga$.movieSeason!.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: 14.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiaryFixedDim)))
                ]),

                SizedBox(height: 2.0),

                Wrap(
                  spacing: 7.0, // Space between the genre tags
                  children: metaEiga$.genres.map((genre) {
                    return GestureDetector(
                      onTap: () {
                        context.push(
                            '/section_eiga/${widget.sourceId}/${genre.genreId}');
                      },
                      child: Text(
                        '#${genre.name}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14.0,
                              color: Theme.of(context)
                                  .colorScheme
                                  .tertiaryFixedDim,
                            ),
                      ),
                    );
                  }).toList(),
                ),

                if (metaEiga$.originalName != null) SizedBox(height: 5.0),

                if (metaEiga$.originalName != null)
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
                                    fontSize: 14.0)),
                        TextSpan(
                            text: metaEiga$.originalName!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontSize: 14.0))
                      ]))
              ],
            ));
  }

  Widget _buildButtonGroup(ValueNotifier<MetaEiga> metaEiga) {
    return Row(
      children: [
        ButtonFollowEiga(
            eigaId: _eigaId, metaEiga: metaEiga, service: _service),
        SizedBox(width: 10.0),
        ButtonShareEiga(
            eigaId: _eigaId,
            episodeName: _subtitleNotifier,
            metaEiga: metaEiga,
            service: _service),
      ],
    );
  }

  Widget _buildSchedule() {
    return ValueListenableBuilder(
        valueListenable: _schedule,
        builder: (context, schedule, child) {
          if (schedule == null) return SizedBox.shrink();

          return SizedBox(
              height: 16 * 1.5,
              child: Row(children: [
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
                      fontSize: 14.0),
                )
              ]));
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

  void _showModalMetadata(ValueNotifier<MetaEiga> metaEiga) {
    final query = MediaQuery.of(context);
    final size = query.size;
    final heightPlayer =
        size.height - query.padding.top - (size.width * 1 / _aspectRatio);

    _initialBottomSheet = max(0.5, heightPlayer / size.height);
    showModalBottomSheetNoScrim(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        useSafeArea: true,
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
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 12.0, right: 12.0, bottom: 8.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: min(110.0, 50.w(context)),
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey.shade200,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  clipBehavior: Clip.antiAlias,
                                  child: AspectRatio(
                                      aspectRatio: 2 / 3,
                                      child: BasicImage.network(
                                        metaEiga.value.image.src,
                                        sourceId: widget.sourceId,
                                        headers: metaEiga.value.image.headers,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          metaEiga.value.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                fontSize: 16,
                                              ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          '${metaEiga.value.language ?? 'unknown'} | ${metaEiga.value.countries?.firstOrNull?.name ?? 'unknown'}',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Release year: ${metaEiga.value.yearOf}',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Episode: ${metaEiga.value.duration}',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            if (metaEiga.value.originalName != null)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 4.0),
                                    child: Text(
                                      'Other name',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    metaEiga.value.originalName!,
                                  ),
                                ],
                              ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 4.0),
                                  child: Text(
                                    'Description',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  metaEiga.value.description,
                                ),
                                Wrap(
                                  spacing: 8.0,
                                  runSpacing: 4.0,
                                  children: metaEiga.value.genres
                                      .map<Widget>((genre) =>
                                          Chip(label: Text(genre.name)))
                                      .toList(),
                                ),
                              ],
                            ),
                            if (metaEiga.value.trailer != null)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 4.0),
                                    child: Text(
                                      'Trailer',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: InAppWebView(
                                        initialUrlRequest: URLRequest(
                                            url: WebUri.uri(Uri.parse(
                                                metaEiga.value.trailer!)))),
                                  ),
                                ],
                              ),
                          ],
                        )));
              },
            ));
  }

  void _showModalEpisodesFullscreen(ValueNotifier<MetaEiga> metaEiga) {
    if (_overlayNotifier.value == null) {
      _overlayNotifier.value = (context) {
        final size = MediaQuery.of(context).size;
        final padding = EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0);

        return Theme(
            data: ThemeData.dark(),
            child: Container(
                width: size.width * 0.45,
                color: Colors.black.withValues(alpha: 0.8),
                padding: padding,
                child: Column(children: [
                  _buildSchedule(),
                  SizedBox(height: 7.0),
                  _buildSeasonArea(metaEiga,
                      scrollDirection: Axis.vertical,
                      height: size.height -
                          padding.top -
                          padding.bottom -
                          7.0 -
                          2.0 -
                          (_schedule.value == null ? 0 : 16.0 * 1.5))
                ])));
      };
    } else {
      _overlayNotifier.value = null;
    }
  }

  void _showModalEpisodes(ValueNotifier<MetaEiga> metaEiga) {
    final query = MediaQuery.of(context);
    final size = query.size;
    final heightPlayer =
        size.height - query.padding.top - (size.width * 1 / _aspectRatio);

    _initialBottomSheet = max(0.5, heightPlayer / size.height);
    showModalBottomSheetNoScrim(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        useSafeArea: true,
        builder: (context) => DraggableScrollableSheet(
              expand: false,
              snap: true,
              snapSizes: [_initialBottomSheet],
              initialChildSize: _initialBottomSheet,
              minChildSize: 0,
              maxChildSize: 1,
              builder: (context, scrollController) {
                return LayoutBuilder(builder: (context, constraints) {
                  final padding =
                      EdgeInsets.only(left: 12.0, right: 12.0, bottom: 8.0);

                  return ClipRRect(
                      child: Container(
                          height: constraints.maxHeight,
                          padding: padding,
                          child: ListView(children: [
                            _buildSchedule(),
                            SizedBox(height: 7.0),
                            _buildSeasonArea(metaEiga,
                                scrollDirection: Axis.vertical,
                                controller: scrollController,
                                height: constraints.maxHeight -
                                    padding.top -
                                    padding.bottom -
                                    7.0 -
                                    2.0 -
                                    (_schedule.value == null ? 0 : 16.0 * 1.5)),
                          ])));
                });
              },
            ));
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
    required EpisodesEiga episodesEiga,
    required List<BasicSeason> seasons,
  }) {
    final oldEiga = _eigaId.value;
    final seasonChanged = oldEiga != seasons[indexSeason].eigaId;

    if (seasonChanged) {
      _eigaId.value = seasons[indexSeason].eigaId;
    }

    var episodeChanged = false;
    if (_episodeId.value != episodesEiga.episodes[indexEpisode].episodeId) {
      _episodeId.value = episodesEiga.episodes[indexEpisode].episodeId;
      episodeChanged = true;
    }
    if (_episode.value != episodesEiga.episodes[indexEpisode]) {
      _episode.value = episodesEiga.episodes[indexEpisode];
      episodeChanged = true;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentIndex = episodesEiga.episodes
          .indexWhere((e) => e.episodeId == _episodeId.value);
      _onPrevNotifier.value = currentIndex > 0
          ? () => _onChangeEpisode(
                metaEiga: metaEiga,
                indexEpisode: currentIndex - 1,
                indexSeason: indexSeason,
                episodesEiga: episodesEiga,
                seasons: seasons,
              )
          : null;

      _onNextNotifier.value = currentIndex < episodesEiga.episodes.length - 1
          ? () => _onChangeEpisode(
                metaEiga: metaEiga,
                indexEpisode: currentIndex + 1,
                indexSeason: indexSeason,
                episodesEiga: episodesEiga,
                seasons: seasons,
              )
          : null;
    });

    if (episodeChanged) {
      _updatePlayer(
          metaEiga.value, episodesEiga.episodes[indexEpisode], indexEpisode);
    }
    _updateData(metaEiga: metaEiga, episodes: episodesEiga);

    if (seasonChanged) {
      _service.getDetails(_eigaId.value).then((value) {
        metaEiga.value = value;
        _posterNotifier.value = value.poster;
      });
    }
  }

  Widget _buildSeasonArea(ValueNotifier<MetaEiga> metaEiga,
      {scrollDirection = Axis.horizontal,
      ScrollController? controller,
      double? height}) {
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
                      thumbnail: metaEiga$.poster ?? metaEiga$.image,
                      sourceId: widget.sourceId,
                      eigaIdNotifier: _eigaId,
                      episodeIdNotifier: _episodeId,
                      getData: () async => _cacheEpisodesStore[eigaId] ??=
                          await _service.getEpisodes(eigaId),
                      getWatchTimeEpisodes: (episodesEiga) async =>
                          _cacheWatchTimeStore[eigaId] ??=
                              _service is EigaHistoryMixin
                                  ? await (_service as EigaHistoryMixin)
                                      .getWatchTimeEpisodes(
                                          eigaId: _eigaId.value,
                                          episodes: episodesEiga.episodes)
                                  : {},
                      eager: true,
                      scrollDirection: scrollDirection,
                      controller: controller,
                      onTapEpisode: (
                          {required episodesEiga, required indexEpisode}) {
                        _onChangeEpisode(
                            metaEiga: metaEiga,
                            indexEpisode: indexEpisode,
                            indexSeason: 0,
                            episodesEiga: episodesEiga,
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

              final tabBarHeight = 35.0;

              final children = [
                ContentSizeTabBarView(
                    children: metaEiga$.seasons.asMap().entries.map((entry) {
                  final season = entry.value;
                  final index = entry.key;

                  return Container(
                      height: height == null ? null : height - tabBarHeight,
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListEpisodes(
                          season: season,
                          sourceId: widget.sourceId,
                          thumbnail: metaEiga$.poster ?? metaEiga$.image,
                          eigaIdNotifier: _eigaId,
                          episodeIdNotifier: _episodeId,
                          getData: () async =>
                              _cacheEpisodesStore[season.eigaId] ??=
                                  await _service.getEpisodes(season.eigaId),
                          getWatchTimeEpisodes: (episodesEiga) async =>
                              _cacheWatchTimeStore[season.eigaId] ??=
                                  _service is EigaHistoryMixin
                                      ? await (_service as EigaHistoryMixin)
                                          .getWatchTimeEpisodes(
                                              eigaId: season.eigaId,
                                              episodes: episodesEiga.episodes)
                                      : {},
                          eager: true,
                          scrollDirection: scrollDirection,
                          controller: controller,
                          onTapEpisode: (
                              {required episodesEiga, required indexEpisode}) {
                            _onChangeEpisode(
                                metaEiga: metaEiga,
                                indexEpisode: indexEpisode,
                                indexSeason: index,
                                episodesEiga: episodesEiga,
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
                    return Tab(text: season.name, height: tabBarHeight);
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
              controller: controller,
              title: 'Suggest',
              more: null);
        });
  }
}
