import 'dart:convert';
import 'dart:math';

import 'package:contentsize_tabbarview/contentsize_tabbarview.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart' hide TimeOfDay;
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/apis/bottom_sheet_no_scrim.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/opening_ending.dart';
import 'package:hoyomi/core_services/eiga/interfaces/watch_time.dart';
import 'package:hoyomi/core_services/eiga/interfaces/watch_time_data.dart';
import 'package:hoyomi/core_services/eiga/mixin/eiga_watch_time_mixin.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/interfaces/vtt.dart';
import 'package:hoyomi/notifier+/computed_notifier.dart';
import 'package:hoyomi/notifier+/watch_computed.dart';
import 'package:hoyomi/utils/cache_remember.dart';
import 'package:hoyomi/widgets/eiga/button_follow_eiga.dart';
import 'package:hoyomi/widgets/eiga/button_share_eiga.dart';
import 'package:hoyomi/widgets/eiga/horizontal_eiga_list.dart';
import 'package:hoyomi/widgets/eiga/vertical_eiga_list.dart';
import 'package:hoyomi/widgets/pull_refresh_page.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';
import 'package:signals/signals_flutter.dart';

import 'package:hoyomi/core_services/eiga/eiga_service.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_episode.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_episodes.dart';
import 'package:hoyomi/core_services/eiga/interfaces/meta_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/source_video.dart';
import 'package:hoyomi/core_services/eiga/interfaces/subtitle.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/screens/details_eiga/list_episodes.dart';
import 'package:hoyomi/screens/home_eiga/player_eiga.dart';
import 'package:hoyomi/utils/format_number.dart';
import 'package:hoyomi/widgets/vertical_separator.dart';

class WatchTimeDataEvent {
  final WatchTimeData watchTimeData;

  const WatchTimeDataEvent(this.watchTimeData);
}

class DetailsEigaPage extends StatefulWidget {
  final String sourceId;
  final String eigaId;
  final String? episodeId;

  const DetailsEigaPage({
    super.key,
    required this.sourceId,
    required this.eigaId,
    required this.episodeId,
  });

  @override
  State<DetailsEigaPage> createState() => _DetailsEigaPageState();
}

class _DetailsEigaPageState extends State<DetailsEigaPage>
    with TickerProviderStateMixin, SignalsMixin {
  late final EigaService _service;
  final ValueNotifier<MetaEiga> _metaEiga = ValueNotifier(
    MetaEiga.createFakeData(),
  );
  late final ComputedNotifier<bool> _loading;

  double _aspectRatio = 16 / 9;

  final Map<String, EigaEpisodes> _cacheEpisodesStore = {};
  final Map<String, Map<String, WatchTime>> _cacheWatchTimeStore = {};
  late final ComputedNotifier<String> _title;
  final ValueNotifier<String> _subtitle = ValueNotifier('');
  final ValueNotifier<List<Subtitle>> _subtitlesNotifier = ValueNotifier([]);
  final ValueNotifier<SourceVideo?> _sourceNotifier = ValueNotifier(null);
  final ValueNotifier<OImage?> _posterNotifier = ValueNotifier(null);
  final ValueNotifier<Vtt?> _thumbnailVtt = ValueNotifier(null);
  final ValueNotifier<OpeningEnding?> _openingEndingNotifier = ValueNotifier(
    null,
  );
  final ValueNotifier<WatchTimeData?> _watchTimeDataNotifier = ValueNotifier(
    null,
  );
  final ValueNotifier<void Function()?> _onPrevNotifier = ValueNotifier(null);
  final ValueNotifier<void Function()?> _onNextNotifier = ValueNotifier(null);
  final ValueNotifier<Widget Function(BuildContext context)?> _overlayNotifier =
      ValueNotifier(null);

  late final ValueNotifier<String> _eigaId;
  final ValueNotifier<String?> _episodeId = ValueNotifier(null);
  final ValueNotifier<TimeAndDay?> _schedule = ValueNotifier(null);
  final ValueNotifier<EigaEpisode?> _episode = ValueNotifier(null);
  final ValueNotifier<int?> _episodeIndex = ValueNotifier(null);
  final ValueNotifier<Season?> _currentSeason = ValueNotifier(null);
  late final ComputedNotifier<Future<List<Eiga>>?> _suggestNotifier;

  final _eventBus = EventBus();

  double _initialBottomSheet = 0.5;

  @override
  void initState() {
    super.initState();

    _service = getEigaService(widget.sourceId);

    _eigaId = ValueNotifier(widget.eigaId);
    _episodeId.value = widget.episodeId;

    _loading = ComputedNotifier(
      () => _metaEiga.value.fake,
      depends: [_metaEiga],
    );
    _title = ComputedNotifier(() => _metaEiga.value.name, depends: [_metaEiga]);
    _suggestNotifier = ComputedNotifier<Future<List<Eiga>>?>(() {
      if (_service.getSuggest == null) return null;

      if (_metaEiga.value.fake) {
        return Future.value(List.generate(30, (_) => Eiga.createFakeData()));
      }

      return _service.getSuggest!(
        metaEiga: _metaEiga.value,
        eigaId: widget.eigaId,
      );
    }, depends: [_metaEiga]);
  }

  void _updatePlayer(MetaEiga metaEiga, EigaEpisode episode, int episodeIndex) {
    assert(_episode.value != null);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _subtitle.value = 'Episode ${episode.name}';
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
        metaEiga: metaEiga,
      )
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
      metaEiga: metaEiga,
    )
        .then((data) {
      _openingEndingNotifier.value = data;
    }).catchError((error) {
      debugPrint('Error: $error');
    });

    _watchTimeDataNotifier.value = null;
    if (_service is EigaWatchTimeMixin) {
      final eigaId = _eigaId.value;
      final episodeId = episode.episodeId;

      (_service as EigaWatchTimeMixin)
          .getWatchTime(
        eigaId: eigaId,
        episode: episode,
        episodeIndex: episodeIndex,
        metaEiga: metaEiga,
      )
          .then((data) {
        _watchTimeDataNotifier.value = WatchTimeData(
          eigaId: eigaId,
          episodeId: episodeId,
          watchTime: data,
        );
      }).catchError((error) {
        _watchTimeDataNotifier.value = WatchTimeData(
          eigaId: eigaId,
          episodeId: episodeId,
          watchTime: null,
        );

        debugPrint('Error: $error');
      });
    }
  }

  Future<MetaEiga> _getDetails(String eigaId) async {
    return await cacheRemember(
      'details_eiga/${_service.uid}/$eigaId',
      get: () => _service.getDetails(eigaId),
      fromCache: (value) => MetaEiga.fromJson(jsonDecode(value)),
      toCache: (value) => jsonEncode(value.toJson()),
      onUpdate: (newValue) => _metaEiga.value = newValue,
    );
  }

  Future<EigaEpisodes> _getEpisodes(
    String eigaId,
    void Function(EigaEpisodes newValue) update,
  ) async {
    return await cacheRemember(
      'episodes_eiga/${_service.uid}/$eigaId',
      get: () => _service.getEpisodes(eigaId),
      fromCache: (value) => EigaEpisodes.fromJson(jsonDecode(value)),
      toCache: (value) => jsonEncode(value.toJson()),
      onUpdate: update,
    );
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
    return Stack(
      children: [
        Column(
          children: [
            AspectRatio(aspectRatio: _aspectRatio),
            Expanded(
              child: PullRefreshPage(
                onLoadData: () async {
                  _getDetails(_eigaId.value).then((data) {
                    if (!mounted) throw Exception('Page destroyed');
                    return _metaEiga.value = data;
                  });
                },
                onLoadFake: () => _metaEiga.value = MetaEiga.createFakeData(),
                builder: (data, param) {
                  return WatchComputed(
                    computed: _loading,
                    builder: (context, loading) {
                      return SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 8.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfo(_metaEiga),
                            SizedBox(height: 10.0),
                            // button group
                            _buildButtonGroup(_metaEiga),
                            SizedBox(height: 5.0),
                            if (!loading) _buildSchedule(),
                            if (!loading) _buildSeasonHeader(_metaEiga),
                            SizedBox(height: 5.0),
                            if (loading)
                              ListEpisodesSkeleton()
                            else
                              _buildSeasonArea(_metaEiga),
                            SizedBox(height: 12.0),
                            _buildSuggest(),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        Positioned(top: 0, left: 0, right: 0, child: _buildPlayer()),
      ],
    );
  }

  Widget _buildPlayer() {
    return PlayerEiga(
      sourceId: widget.sourceId,
      eigaId: _eigaId,
      episodeId: _episodeId,
      title: _title,
      subtitleNotifier: _subtitle,
      watchTimeDataNotifier: _watchTimeDataNotifier,
      onBack: () {
        context.pop();
      },
      onTapPlaylist: (isFullscreen) {
        if (isFullscreen) {
          _showModalEpisodesFullscreen(_metaEiga);
          return;
        }
        _showModalEpisodes(_metaEiga);
      },
      onWatchTimeUpdate: ({required position, required duration}) {
        if (_service is EigaWatchTimeMixin) {
          final eigaId = _eigaId.value;
          final watchTime = WatchTime(position: position, duration: duration);

          if (_episode.value == null || _currentSeason.value == null) return;

          _eventBus.fire(
            WatchTimeDataEvent(
              WatchTimeData(
                eigaId: eigaId,
                episodeId: _episode.value!.episodeId,
                watchTime: watchTime,
              ),
            ),
          );
          (_service as EigaWatchTimeMixin).setWatchTime(
            eigaId: eigaId,
            episode: _episode.value!,
            episodeIndex: _episodeIndex.value!,
            metaEiga: _metaEiga.value,
            season: _currentSeason.value!,
            watchTime: watchTime,
          );
        }
      },
      subtitlesNotifier: _subtitlesNotifier.toSignal(),
      sourceNotifier: _sourceNotifier,
      posterNotifier: _posterNotifier,
      thumbnailVtt: _thumbnailVtt.toSignal(),
      openingEndingNotifier: _openingEndingNotifier.toSignal(),
      aspectRatio: _aspectRatio,
      fetchSourceContent: _service.fetchSourceContent,
      onPrev: _onPrevNotifier.toSignal(),
      onNext: _onNextNotifier.toSignal(),
      overlayNotifier: _overlayNotifier,
    );
  }

  Widget _buildInfo(ValueNotifier<MetaEiga> metaEiga) {
    return ValueListenableBuilder(
      valueListenable: metaEiga,
      builder: (_, metaEiga$, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => _showModalMetadata(metaEiga),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // name
                  Text(
                    metaEiga$.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (metaEiga$.views != null)
                    Text(
                      '${formatNumber(metaEiga$.views!)} views',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 14.0,
                          ),
                    ),

                  SizedBox(height: 2.0),

                  // author
                  Wrap(
                    children: [
                      Text(
                        'Author ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 14.0,
                            ),
                      ),
                      Text(
                        metaEiga$.author ?? 'Unknown',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(fontSize: 14.0),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (metaEiga$.studio != null) VerticalSeparator(),
                      if (metaEiga$.studio != null) ...[
                        Text(
                          'Studio ',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 14.0,
                              ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.push(
                              '/section_eiga/${widget.sourceId}/${metaEiga$.studio!.genreId}',
                            );
                          },
                          child: Text(
                            metaEiga$.studio!.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  fontSize: 14.0,
                                ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.0),

            /////
            Row(
              children: [
                if (metaEiga$.quality != null)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.shade400,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Center(
                      child: Text(
                        metaEiga$.quality!,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(fontSize: 14.0),
                      ),
                    ),
                  ),
                if (metaEiga$.quality != null) VerticalSeparator(),
                if (metaEiga$.yearOf != null)
                  Text(
                    metaEiga$.yearOf.toString(),
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 14.0),
                  ),
                if (metaEiga$.duration != null) VerticalSeparator(),
                if (metaEiga$.duration != null)
                  Text(
                    'Updated to ${metaEiga$.duration}',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 14.0),
                  ),
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
                              '/section_eiga/${widget.sourceId}/${country.genreId}',
                            );
                          },
                          child: Text(
                            country.name,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                                  fontSize: 14.0,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.tertiaryFixedDim,
                                ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
              ],
            ),

            SizedBox(height: 2.0),

            Row(
              children: [
                if (metaEiga$.rate != null)
                  Row(
                    children: [
                      Icon(
                        MaterialCommunityIcons.star,
                        color: Colors.blue.shade200,
                        size: 14.0,
                      ),
                      Text(
                        ' ${metaEiga$.rate}',
                        style: const TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                if (metaEiga$.countRate != null) VerticalSeparator(),
                if (metaEiga$.countRate != null)
                  Text(
                    '${metaEiga$.countRate} people rated',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 14.0,
                        ),
                  ),
                if (metaEiga$.countRate != null) VerticalSeparator(),
                if (metaEiga$.movieSeason != null)
                  GestureDetector(
                    onTap: () {
                      context.push(
                        '/section_eiga/${widget.sourceId}/${metaEiga$.movieSeason!.genreId}',
                      );
                    },
                    child: Text(
                      metaEiga$.movieSeason!.name,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 14.0,
                            color:
                                Theme.of(context).colorScheme.tertiaryFixedDim,
                          ),
                    ),
                  ),
              ],
            ),

            SizedBox(height: 2.0),

            Wrap(
              spacing: 7.0, // Space between the genre tags
              children: metaEiga$.genres.map((genre) {
                return GestureDetector(
                  onTap: () {
                    context.push(
                      '/section_eiga/${widget.sourceId}/${genre.genreId}',
                    );
                  },
                  child: Text(
                    '#${genre.name}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14.0,
                          color: Theme.of(context).colorScheme.tertiaryFixedDim,
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
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Other name: ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 14.0,
                          ),
                    ),
                    TextSpan(
                      text: metaEiga$.originalName!,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildButtonGroup(ValueNotifier<MetaEiga> metaEiga) {
    return Row(
      children: [
        ButtonFollowEiga(
          eigaId: _eigaId,
          metaEiga: metaEiga,
          service: _service,
        ),
        SizedBox(width: 10.0),
        ButtonShareEiga(
          eigaId: _eigaId,
          episodeName: _subtitle,
          metaEiga: metaEiga,
          service: _service,
        ),
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
          child: Row(
            children: [
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
                      fontSize: 14.0,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSeasonHeader(ValueNotifier<MetaEiga> metaEiga) {
    return GestureDetector(
      onTap: () => _showModalEpisodes(metaEiga),
      child: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Episode',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'View all',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                ),
                Center(
                  child: Icon(
                    MaterialCommunityIcons.chevron_right,
                    size: 16.0,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
      builder: (context, pop) => DraggableScrollableSheet(
        expand: false,
        snap: true,
        snapSizes: [_initialBottomSheet],
        initialChildSize: _initialBottomSheet,
        minChildSize: 0,
        maxChildSize: 1,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            padding: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 8.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: min(110.0, 50.w(context)),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade200,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: AspectRatio(
                        aspectRatio: 2 / 3,
                        child: OImage.network(
                          metaEiga.value.image.src,
                          sourceId: widget.sourceId,
                          headers: metaEiga.value.image.headers,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              metaEiga.value.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 16),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 8),
                            Text(
                              '${metaEiga.value.language ?? 'unknown'} | ${metaEiga.value.countries?.firstOrNull?.name ?? 'unknown'}',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Release year: ${metaEiga.value.yearOf}',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Episode: ${metaEiga.value.duration}',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
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
                          top: 8.0,
                          bottom: 4.0,
                        ),
                        child: Text(
                          'Other name',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(metaEiga.value.originalName!),
                    ],
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(metaEiga.value.description),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: metaEiga.value.genres
                          .map<Widget>(
                            (genre) => Chip(label: Text(genre.name)),
                          )
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
                          top: 8.0,
                          bottom: 4.0,
                        ),
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
                            url: WebUri.uri(
                              Uri.parse(metaEiga.value.trailer!),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
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
            child: Column(
              children: [
                _buildSchedule(),
                SizedBox(height: 7.0),
                _buildSeasonArea(
                  metaEiga,
                  scrollDirection: Axis.vertical,
                  height: size.height -
                      padding.top -
                      padding.bottom -
                      7.0 -
                      2.0 -
                      12.0 -
                      (_schedule.value == null ? 0 : 16.0 * 1.5),
                ),
              ],
            ),
          ),
        );
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
      builder: (context, pop) => DraggableScrollableSheet(
        expand: false,
        snap: true,
        snapSizes: [_initialBottomSheet],
        initialChildSize: _initialBottomSheet,
        minChildSize: 0,
        maxChildSize: 1,
        builder: (context, scrollController) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final padding = EdgeInsets.only(
                left: 12.0,
                right: 12.0,
                bottom: 8.0,
              );

              final heightChild = constraints.maxHeight -
                  padding.top -
                  padding.bottom -
                  7.0 -
                  2.0 -
                  (_schedule.value == null ? 0 : 16.0 * 1.5);

              if (heightChild <= 0 || constraints.maxHeight <= 0) {
                pop();
              }
              return ClipRect(
                child: Container(
                  height: constraints.maxHeight,
                  padding: padding,
                  child: ListView(
                    children: [
                      _buildSchedule(),
                      SizedBox(height: 7.0),
                      _buildSeasonArea(
                        metaEiga,
                        scrollDirection: Axis.vertical,
                        controller: scrollController,
                        height: heightChild,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _updateImageAndSchedule({
    required ValueNotifier<MetaEiga> metaEiga,
    required EigaEpisodes episodes,
  }) {
    if (episodes.image != metaEiga.value.image && episodes.image != null) {
      metaEiga.value.image = episodes.image!;
    }
    if (episodes.poster != metaEiga.value.poster) {
      metaEiga.value.poster = episodes.poster;
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
  }

  void _onChangeEpisode({
    required ValueNotifier<MetaEiga> metaEiga,
    required int indexEpisode,
    required int indexSeason,
    required EigaEpisodes episodesEiga,
    required List<Season> seasons,
  }) {
    final seasonChanged = _eigaId.value != seasons[indexSeason].eigaId;
    final currentEpisode = episodesEiga.episodes[indexEpisode];

    if (seasonChanged) {
      _eigaId.value = seasons[indexSeason].eigaId;
    }

    var episodeChanged = false;
    if (_episodeId.value != currentEpisode.episodeId) {
      _episodeId.value = currentEpisode.episodeId;
      episodeChanged = true;
    }
    if (_episode.value != currentEpisode) {
      _episode.value = currentEpisode;
      _episodeIndex.value = indexEpisode;
      episodeChanged = true;
    }

    if (_currentSeason.value != seasons[indexSeason]) {
      _currentSeason.value = seasons[indexSeason];
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentIndex = episodesEiga.episodes.indexWhere(
        (e) => e.episodeId == _episodeId.value,
      );
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
      _updatePlayer(metaEiga.value, currentEpisode, indexEpisode);
    }
    _updateImageAndSchedule(metaEiga: metaEiga, episodes: episodesEiga);

    if (seasonChanged) {
      _getDetails(_eigaId.value).then((value) {
        if (!mounted) return;
        metaEiga.value = value;
        _posterNotifier.value = value.poster;
      });
    }
  }

  Widget _buildSeasonArea(
    ValueNotifier<MetaEiga> metaEiga, {
    scrollDirection = Axis.horizontal,
    ScrollController? controller,
    double? height,
  }) {
    return ValueListenableBuilder(
      valueListenable: metaEiga,
      builder: (_, metaEiga$, child) {
        if (metaEiga$.seasons.isEmpty) {
          return ValueListenableBuilder(
            valueListenable: _eigaId,
            builder: (context, eigaId, child) {
              final season = Season(eigaId: eigaId, name: 'Episodes');
              return ListEpisodes(
                season: season,
                thumbnail: metaEiga$.poster ?? metaEiga$.image,
                sourceId: widget.sourceId,
                eigaIdNotifier: _eigaId,
                episodeIdNotifier: _episodeId,
                eventBus: _eventBus,
                getData: (update) async =>
                    _cacheEpisodesStore[eigaId] ??= await _getEpisodes(
                  eigaId,
                  update,
                ),
                getWatchTimeEpisodes: (episodesEiga) async =>
                    _cacheWatchTimeStore[eigaId] ??=
                        _service is EigaWatchTimeMixin
                            ? await (_service as EigaWatchTimeMixin)
                                .getWatchTimeEpisodes(
                                eigaId: _eigaId.value,
                                episodes: episodesEiga.episodes,
                              )
                            : {},
                eager: true,
                scrollDirection: scrollDirection,
                controller: controller,
                onTapEpisode: ({required episodesEiga, required indexEpisode}) {
                  _onChangeEpisode(
                    metaEiga: metaEiga,
                    indexEpisode: indexEpisode,
                    indexSeason: 0,
                    episodesEiga: episodesEiga,
                    seasons: [season],
                  );
                },
              );
            },
          );
        }

        // tab view
        return DefaultTabController(
          length: metaEiga$.seasons.length,
          initialIndex: max(
            0,
            metaEiga$.seasons.indexWhere(
              (season) => season.eigaId == _eigaId.value,
            ),
          ),
          child: Builder(
            builder: (context) {
              final tabController = DefaultTabController.of(context);

              _eigaId.addListener(() {
                final index = metaEiga$.seasons.indexWhere(
                  (season) => season.eigaId == _eigaId.value,
                );
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
                        eventBus: _eventBus,
                        getData: (update) async =>
                            _cacheEpisodesStore[season.eigaId] ??=
                                await _getEpisodes(
                          season.eigaId,
                          update,
                        ),
                        getWatchTimeEpisodes: (episodesEiga) async =>
                            _cacheWatchTimeStore[season.eigaId] ??=
                                _service is EigaWatchTimeMixin
                                    ? await (_service as EigaWatchTimeMixin)
                                        .getWatchTimeEpisodes(
                                        eigaId: season.eigaId,
                                        episodes: episodesEiga.episodes,
                                      )
                                    : {},
                        eager: true,
                        scrollDirection: scrollDirection,
                        controller: controller,
                        onTapEpisode: ({
                          required episodesEiga,
                          required indexEpisode,
                        }) {
                          _onChangeEpisode(
                            metaEiga: metaEiga,
                            indexEpisode: indexEpisode,
                            indexSeason: index,
                            episodesEiga: episodesEiga,
                            seasons: metaEiga$.seasons,
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),
                TabBar(
                  isScrollable: true,
                  padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 0),
                  labelPadding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 0,
                  ),
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
                children: children,
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildSuggest() {
    return WatchComputed(
      computed: _suggestNotifier,
      builder: (_, suggest) {
        if (suggest == null) return SizedBox.shrink();

        return VerticalEigaList(
          itemsFuture: suggest.then(
            (data) => data
                .map(
                  (item) => EigaExtend(eiga: item, sourceId: _service.uid),
                )
                .toList(),
          ),
          title: 'Suggest',
          disableScroll: true,
          more: null,
        );
      },
    );
  }
}
