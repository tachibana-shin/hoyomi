import 'dart:async';
import 'dart:math';

import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:contentsize_tabbarview/contentsize_tabbarview.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart' hide TimeOfDay;
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/apis/bottom_sheet_no_scrim.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/constraints/x_platform.dart';
import 'package:hoyomi/core_services/eiga/export.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/extensions/breakpoint_extension.dart';
import 'package:hoyomi/extensions/iterable_extension.dart';
import 'package:hoyomi/extensions/list_extension.dart';
import 'package:hoyomi/screens/export.dart';
import 'package:hoyomi/utils/export.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:kaeru/kaeru.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:url_launcher/url_launcher.dart';

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
    with TickerProviderStateMixin, KaeruMixin, KaeruListenMixin {
  late final ABEigaService _service;
  late final _metaEiga = ref(MetaEiga.createFakeData());
  late final _metaIsFake = _metaEiga.select((meta) => meta.fake);
  late final _loading = _metaIsFake;

  final _defaultAspectRatio = 16 / 9;
  double? _aspectRatio;

  final Map<String, EigaEpisodes> _cacheEpisodesStore = {};
  final Map<String, Map<String, WatchTimeUpdated>> _cacheWatchTimeStore = {};
  late final _title = computed(
    () => _metaIsFake.value ? '' : _metaEiga.value.name,
  );
  late final _subtitle = computed(
    () =>
        _metaIsFake.value || _episode.value == null
            ? ''
            : 'Episode ${_episode.value?.name}',
  );
  late final _trailerUrl = computed(() {
    if (_metaIsFake.value) return null;

    final trailer = _metaEiga.value.trailer;
    if (trailer == null) return null;

    if (trailer.contains('youtube') || trailer.contains('youtu.be')) {
      return trailer;
    }

    return null;
  });
  late final _currentEpisode = computed(() {
    return _episodes.value?.episodes.firstWhereOrNull(
      (e) => e.episodeId == _episodeId.value,
    );
  });
  late final _onPrev = computed<VoidCallback?>(() {
    final currentSeason = _currentSeason.value;
    final metaEiga = _metaEiga.value;
    final currentEpisode = _currentEpisode.value;
    final episodes = _episodes.value;

    if (!(currentSeason != null &&
        metaEiga.fake &&
        currentEpisode != null &&
        episodes != null)) {
      return null;
    }

    final prevEpisode = episodes.episodes.elementAtOrNull(
      max(
        episodes.episodes.length,
        episodes.episodes.indexOf(currentEpisode) - 1,
      ),
    );

    if (prevEpisode != null) {
      return () => _onChangeEpisode(
        episodeId: prevEpisode.episodeId,
        episodesEiga: _episodes.value!,
        season: currentSeason,
      );
    } else {
      final prevSeason = metaEiga.seasons.elementAtOrNull(
        max(
          metaEiga.seasons.length,
          metaEiga.seasons.indexOf(currentSeason) - 1,
        ),
      );

      if (prevSeason == null) return null;

      return () {
        _eigaId.value = prevSeason.eigaId;
        _episodeId.value = null;
        _schedule.value = null;
        _episodes.value = null;
      };
    }
  });
  late final _onNext = computed<VoidCallback?>(() {
    final currentSeason = _currentSeason.value;
    final metaEiga = _metaEiga.value;
    final currentEpisode = _currentEpisode.value;
    final episodes = _episodes.value;

    if (!(currentSeason != null &&
        metaEiga.fake &&
        currentEpisode != null &&
        episodes != null)) {
      return null;
    }

    final nextEpisode = episodes.episodes.elementAtOrNull(
      (episodes.episodes.indexOf(currentEpisode) >>> 0) + 1,
    );

    if (nextEpisode != null) {
      return () => _onChangeEpisode(
        episodeId: nextEpisode.episodeId,
        episodesEiga: _episodes.value!,
        season: currentSeason,
      );
    } else {
      final prevSeason = metaEiga.seasons.elementAtOrNull(
        max(
          metaEiga.seasons.length,
          (metaEiga.seasons.indexOf(currentSeason) >>> 0) + 1,
        ),
      );

      if (prevSeason == null) return null;

      return () {
        _eigaId.value = prevSeason.eigaId;
        _episodeId.value = null;
        _schedule.value = null;
        _episodes.value = null;
      };
    }
  });

  /// ================= player expose =================
  late final _serversFuture = computed<Future<List<ServerSource>?>?>(() async {
    if (_metaIsFake.value) return null;

    final episode = _episode.value;
    if (episode == null) return null;

    try {
      return await _service
          .getServers(eigaId: _eigaId.value, episode: episode)
          .then((servers) => servers.isEmpty ? null : servers);
    } on UnimplementedError {
      return null;
    } catch (error) {
      rethrow;
    }
  });
  late final _serverIdSelected = ref<String?>(null);

  /// ================= /player expose =================

  late final Ref<String> _eigaId;
  late final _episodeId = ref<String?>(null);
  late final _schedule = ref<DateTime?>(null);
  late final _episode = computed<EigaEpisode?>(() {
    return _episodes.value?.episodes.firstWhereOrNull(
      (e) => e.episodeId == _episodeId.value,
    );
  });
  late final _currentSeason = computed<Season?>(() {
    if (_metaIsFake.value) return null;

    return _metaEiga.value.seasons.firstWhereOrNull(
      (season) => season.eigaId == _eigaId.value,
    );
  });
  late final _episodes = ref<EigaEpisodes?>(null);
  late final _suggest = computed<Future<List<Eiga>?>>(() async {
    if (_metaIsFake.value) {
      return Completer<List<Eiga>>().future;
    }

    try {
      return _service.getSuggest(
        metaEiga: _metaEiga.value,
        eigaId: _eigaId.value,
      );
    } on UnimplementedError {
      return null;
    }
  });

  // state player
  late final _fullscreen = ref(false);

  final _eventBus = EventBus();

  double _initialBottomSheet = 0.5;

  @override
  void initState() {
    super.initState();

    _service = getEigaService(widget.sourceId);

    _eigaId = ref(widget.eigaId);
    _episodeId.value = widget.episodeId;

    watch([_eigaId], () => _getDetails(_eigaId.value));

    watchEffect(() {
      if (_episodeId.value case final episodeId?) {
        context.replaceNamed(
          'details_eiga',
          pathParameters: {
            'sourceId': widget.sourceId,
            'eigaId': widget.eigaId,
          },
          queryParameters: {'episodeId': episodeId},
        );
      }
    });

    listenAll([_metaEiga, _eigaId], () {
      final metaEiga = _metaEiga.value;

      if (!metaEiga.fake &&
          metaEiga.seasons.isNotEmpty &&
          metaEiga.seasons.firstWhereOrNull(
                (season) => season.eigaId == _eigaId.value,
              ) ==
              null) {
        showSnackBar(
          Text(
            'Service error: Episode not found. Please check `seasons` result in `getDetails`',
          ),
        );
      }
    });
  }

  Future<MetaEiga> _getDetails(String eigaId) async {
    return _metaEiga.value = await _service.getDetails(eigaId);
    // final data = await cacheRemember<MetaEiga>(
    //   'details_eiga/${_service.uid}/$eigaId',
    //   get: () => _service.getDetails(eigaId),
    //   fromCache: (value) => MetaEiga.fromJson(jsonDecode(value)),
    //   toCache: (value) => jsonEncode(value.toJson()),
    //   onUpdate: (newValue) => _metaEiga.value = newValue,
    // );

    // if (mounted) _metaEiga.value = data;

    // return data;
  }

  @override
  Widget build(BuildContext context) {
    if (_aspectRatio == null) {
      var aspectRatio = _defaultAspectRatio;
      final maxWidth = (context.isGtSm ? 2 / 3 : 1.0).w(context);

      final heightPlayer = maxWidth / aspectRatio;
      if (0.65.h(context) < heightPlayer) {
        aspectRatio = maxWidth / 0.65.h(context);
      }

      _aspectRatio = aspectRatio;
    }

    return SafeArea(child: Scaffold(body: _buildBody()));
  }

  Widget _buildBody() {
    final player = _buildPlayer();

    return Watch(() {
      final seasonWidgetGlobalKey = GlobalKey();

      final playerWidget = LayoutBuilder(
        builder: (context, constraints) {
          return ClipRect(
            child: SizedBox(
              height: _fullscreen.value ? 100.h(context) : null,
              child: player,
            ),
          );
        },
      );

      Widget seasonWidgetBuilder(bool verticalMode, {GlobalKey? key}) {
        return Watch(
          key: key,
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!_loading.value) _buildSchedule(),
              _buildServers(),
              if (!verticalMode) _buildSeasonHeader(),
              5.heightBox,
              if (verticalMode)
                FractionallySizedBox(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: _buildSeasonArea(
                    inModal: verticalMode,
                    scrollDirection:
                        verticalMode ? Axis.vertical : Axis.horizontal,
                  ),
                ).expanded()
              else
                _buildSeasonArea(),
            ],
          ),
        );
      }

      Widget metaWidgetBuilder(MetaEiga? data) {
        Widget builder(MetaEiga data) {
          return Watch(() {
            final left = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfo(),
                10.heightBox,
                // button group
                if (!context.isGtSm) ...[
                  _buildButtonGroup(),
                  5.heightBox,
                  seasonWidgetBuilder(false),
                ] else ...[
                  4.heightBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPoster(data, width: 125),
                      7.widthBox,
                      _buildDescription(data, tags: false).expanded(),
                    ],
                  ),
                ],
              ],
            );
            final right = _buildSuggest();

            if (context.isGtSm) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  left.expanded(flex: 9),
                  7.widthBox,
                  Column(
                    children: [
                      Watch(
                        () =>
                            _fullscreen.value
                                ? LayoutBuilder(
                                  builder:
                                      (context, constraints) => SizedBox(
                                        height: min(
                                          constraints.biggest.height,
                                          (constraints.biggest.width / 3 * 9) /
                                              _aspectRatio!,
                                        ),
                                        child: seasonWidgetBuilder(
                                          key: seasonWidgetGlobalKey,
                                          true,
                                        ),
                                      ),
                                )
                                : SizedBox.shrink(),
                      ),
                      right,
                    ],
                  ).expanded(flex: 3),
                ],
              );
            }

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Column(children: [left, right]),
            );
          });
        }

        if (data != null) {
          return builder(data);
        }

        return Watch(
          () => ClipRect(
            child: SizedBox(
              height: _fullscreen.value ? 0 : double.infinity,
              child: Offstage(
                offstage: _fullscreen.value,
                child: PullRefreshPage(
                  onLoadData: () => _getDetails(_eigaId.value),
                  onLoadFake: () => _metaEiga.value = MetaEiga.createFakeData(),
                  builderError:
                      (body) => Scaffold(
                        appBar: AppBar(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          scrolledUnderElevation: 0.0,
                          leading: HBackButton(),
                        ),
                        body: body,
                      ),
                  builder: (data, _) => builder(data),
                ),
              ),
            ),
          ),
        );
      }

      if (context.isGtSm) {
        return PullRefreshPage(
          onLoadData: () => _getDetails(_eigaId.value),
          onLoadFake: () => _metaEiga.value = MetaEiga.createFakeData(),
          builderError:
              (body) => Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  scrolledUnderElevation: 0.0,
                  leading: HBackButton(),
                ),
                body: body,
              ),
          builder:
              (data, _) => SingleChildScrollView(
                // padding:
                //     _fullscreen.value
                //         ? null
                //         : const EdgeInsets.symmetric(
                //           horizontal: 16.0,
                //           vertical: 0.0,
                //         ),
                child: Column(
                  children: [
                    Watch(
                      () => PaddingX(
                        Row(
                          children: [
                            Flexible(flex: 9, child: playerWidget),
                            Watch(
                              () =>
                                  _fullscreen.value
                                      ? SizedBox.shrink()
                                      : LayoutBuilder(
                                        builder:
                                            (context, constraints) => SizedBox(
                                              height: min(
                                                constraints.biggest.height,
                                                (constraints.biggest.width /
                                                        3 *
                                                        9) /
                                                    _aspectRatio!,
                                              ),
                                              child: seasonWidgetBuilder(
                                                key: seasonWidgetGlobalKey,
                                                true,
                                              ),
                                            ),
                                      ).expanded(flex: 3),
                            ),
                          ],
                        ),
                      ).paddingSymmetric(
                        horizontal: _fullscreen.value ? 0 : 16.0,
                      ),
                    ),
                    Watch(
                      () => PaddingX(metaWidgetBuilder(data)).paddingSymmetric(
                        horizontal: _fullscreen.value ? 0 : 16.0,
                      ),
                    ),
                  ],
                ),
              ),
        );
      }

      return Column(
        children: [playerWidget, metaWidgetBuilder(null).expanded()],
      );
    });
  }

  Widget _buildPlayer() {
    return PlayerEiga(
      key: ValueKey('player'),
      service: _service,
      eigaId: _eigaId,
      metaEiga: _metaEiga,
      episodeId: _episodeId,
      episode: _episode,
      season: _currentSeason,

      trailerUrl: _trailerUrl,

      fullscreen: _fullscreen,

      /// ===============
      title: _title,
      subtitle: _subtitle,
      onTapPlaylist: (context, isFullscreen) {
        if (isFullscreen) {
          _showModalEpisodesFullscreen(context);
          return;
        }
        _showModalEpisodes();
      },
      onWatchTimeChanged: (watchTimeData) {
        _eventBus.fire(WatchTimeDataEvent(watchTimeData));
        _cacheWatchTimeStore[_eigaId.value] = {
          ..._cacheWatchTimeStore[_eigaId.value] ?? {},
          watchTimeData.episodeId: WatchTimeUpdated(
            position: watchTimeData.watchTime!.position,
            duration: watchTimeData.watchTime!.duration,
            updatedAt: DateTime.now(),
          ),
        };
      },
      aspectRatio: _aspectRatio!,
      onPrev: _onPrev,
      onNext: _onNext,

      /// ===============
      serversFuture: _serversFuture,
      serverIdSelected: _serverIdSelected,
    );
  }

  Widget _buildInfo() {
    return Watch(() {
      final colorScheme = Theme.of(context).colorScheme;
      final metaEiga = _metaEiga.value;

      final main = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // name
          Text(
            metaEiga.name,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            verticalDirection: VerticalDirection.up,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (metaEiga.views != null ||
                  (metaEiga.authors != null && metaEiga.authors!.isNotEmpty))
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (metaEiga.views case final views?)
                      Text(
                        '${formatNumber(views)} views',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.secondary,
                          fontSize: 14.0,
                        ),
                      ),

                    SizedBox(height: 2.0),

                    // authors
                    if (metaEiga.authors != null &&
                        metaEiga.authors!.isNotEmpty)
                      Wrap(
                        children: [
                          Text(
                            'Author ',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              color: colorScheme.secondary,
                              fontSize: 14.0,
                            ),
                          ),
                          ...metaEiga.authors!.indexed.mapWithIterable((
                            entry,
                            list,
                          ) {
                            final (index, author) = entry;
                            return GestureDetector(
                              onTap:
                                  author.genreId == Genre.noId
                                      ? null
                                      : () => context.pushNamed(
                                        'category_eiga',
                                        pathParameters: {
                                          'sourceId': widget.sourceId,
                                          'categoryId': author.genreId,
                                        },
                                      ),
                              child: Text(
                                '${author.name}${index < list.length - 1 ? ', ' : ''}',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(
                                  fontSize: 14.0,
                                  color: Colors.greenAccent.shade400,
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                  ],
                ).expanded()
              else
                SizedBox.shrink(),

              if (context.isGtSm) _buildButtonGroup(),
            ],
          ),

          // studios
          if (metaEiga.studios != null && metaEiga.studios!.isNotEmpty)
            Wrap(
              children: [
                Text(
                  'Studio ',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.secondary,
                    fontSize: 14.0,
                  ),
                ),
                ...metaEiga.studios!.indexed.mapWithIterable((entry, list) {
                  final (index, author) = entry;
                  return GestureDetector(
                    onTap:
                        author.genreId == Genre.noId
                            ? null
                            : () => context.pushNamed(
                              'category_eiga',
                              pathParameters: {
                                'sourceId': widget.sourceId,
                                'categoryId': author.genreId,
                              },
                            ),
                    child: Text(
                      '${author.name}${index < list.length - 1 ? ', ' : ''}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14.0,
                        color: Colors.greenAccent.shade400,
                      ),
                    ),
                  );
                }),
              ],
            ),

          SizedBox(height: 2.0),
        ],
      );

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (context.isGtSm)
            main
          else
            InkWell(
              onTap: _showModalMetadata,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  main.expanded(),
                  Opacity(
                    opacity: 0.8,
                    child: Iconify(
                      Ion.chevron_right,
                      size: 16,
                    ).marginOnly(top: 8.0, right: 8.0),
                  ),
                ],
              ),
            ),
          SizedBox(height: 2.0),

          /////
          Wrap(
            children: [
              if (metaEiga.quality case final quality?)
                [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.shade400,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Center(
                          child: Text(
                            quality,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              fontSize: 12.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              if (metaEiga.countDub case final countDub?)
                [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(176, 227, 175, 1.0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Iconify(
                                Bi.badge_cc_fill,
                                color: Colors.black,
                                size: 12.0,
                              ),
                              Text(
                                ' $countDub',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(
                                  fontSize: 12.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              if (metaEiga.countSub case final countSub?)
                [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(185, 231, 255, 1.0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Iconify(
                                Eva.mic_fill,
                                color: Colors.black,
                                size: 12.0,
                              ),
                              Text(
                                ' $countSub',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(
                                  fontSize: 12.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              if (metaEiga.yearOf case final year?)
                [
                  Text(
                    year.toString(),
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 14.0),
                  ),
                ],
              if (metaEiga.duration case final duration?)
                [
                  Text(
                    'Updated to $duration',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 14.0),
                  ),
                ],
              if (metaEiga.countries?.isNotEmpty == true)
                metaEiga.countries!.indexed.map((entry) {
                  final index = entry.$1;
                  final country = entry.$2;

                  return Padding(
                    padding: EdgeInsets.only(right: 4.0),
                    child: GestureDetector(
                      onTap:
                          country.genreId == Genre.noId
                              ? null
                              : () => context.pushNamed(
                                'category_eiga',
                                pathParameters: {
                                  'sourceId': widget.sourceId,
                                  'categoryId': country.genreId,
                                },
                              ),
                      child: Text(
                        index < metaEiga.countries!.length - 1
                            ? '${country.name}, '
                            : country.name,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14.0,
                          color: Colors.greenAccent.shade400,
                        ),
                      ),
                    ),
                  );
                }).toList(),
            ].joinWith(const VerticalSeparator()),
          ),

          SizedBox(height: 2.0),

          Row(
            children: [
              if (metaEiga.rate case final rate?)
                [
                  Row(
                    children: [
                      Iconify(
                        Eva.star_fill,
                        color: Colors.blue.shade200,
                        size: 14.0,
                      ),
                      Text(' $rate', style: const TextStyle(fontSize: 14.0)),
                    ],
                  ),
                ],
              if (metaEiga.countRate case final cRate?)
                [
                  Text(
                    '$cRate people rated',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.secondary,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              if (metaEiga.movieSeason != null)
                [
                  GestureDetector(
                    onTap:
                        metaEiga.movieSeason!.genreId == Genre.noId
                            ? null
                            : () {
                              context.pushNamed(
                                'category_eiga',
                                pathParameters: {
                                  'sourceId': widget.sourceId,
                                  'categoryId': metaEiga.movieSeason!.genreId,
                                },
                              );
                            },
                    child: Text(
                      metaEiga.movieSeason!.name,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14.0,
                        color:
                            metaEiga.movieSeason!.genreId == Genre.noId
                                ? null
                                : Colors.greenAccent.shade400,
                      ),
                    ),
                  ),
                ],
            ].joinWith(const VerticalSeparator()),
          ),

          SizedBox(height: 2.0),

          Wrap(
            spacing: 7.0, // Space between the genre tags
            children:
                metaEiga.genres.map((genre) {
                  return GestureDetector(
                    onTap:
                        genre.genreId == Genre.noId
                            ? null
                            : () {
                              context.pushNamed(
                                'category_eiga',
                                pathParameters: {
                                  'sourceId': widget.sourceId,
                                  'categoryId': genre.genreId,
                                },
                              );
                            },
                    child: Text(
                      '#${genre.name}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14.0,
                        color:
                            genre.genreId == Genre.noId
                                ? null
                                : Colors.greenAccent.shade400,
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
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Other name: ',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.secondary,
                      fontSize: 14.0,
                    ),
                  ),
                  TextSpan(
                    text: metaEiga.originalName!,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 14.0),
                  ),
                ],
              ),
            ),
        ],
      );
    });
  }

  Widget _buildButtonGroup() {
    return Row(
      children: [
        ButtonFollowEiga(
          eigaId: _eigaId,
          metaEiga: _metaEiga,
          service: _service,
          episodes: _episodes,
        ),
        SizedBox(width: 10.0),
        ButtonShareEiga(
          eigaId: _eigaId,
          episodeName: _subtitle,
          metaEiga: _metaEiga,
          service: _service,
        ),
      ],
    );
  }

  Widget _buildSchedule() {
    return Watch(() {
      final schedule = _schedule.value;
      if (schedule == null) return SizedBox.shrink();

      return Row(
        children: [
          Iconify(
            Mdi.clock_outline,
            size: 16.0,
            color: Theme.of(context).colorScheme.secondary,
          ),
          SizedBox(width: 5.0),
          Expanded(
            child: Text(
              'Updated on day ${['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'][schedule.day]} of the week at ${schedule.hour}:${schedule.minute}',
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildSeasonHeader() {
    return GestureDetector(
      onTap: _showModalEpisodes,
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
                  child: Iconify(
                    Ion.chevron_right,
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

  Widget _buildPoster(MetaEiga metaEiga, {double width = 110.0}) {
    return Container(
      width: min(width, 50.w(context)),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade200,
        borderRadius: BorderRadius.circular(10.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: OImage.oNetwork(
          metaEiga.image,
          sourceId: widget.sourceId,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildDescription(MetaEiga metaEiga, {bool tags = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
          child: Text(
            'Description',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Text(metaEiga.description),
        if (tags)
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children:
                metaEiga.genres
                    .map<Widget>((genre) => Chip(label: Text(genre.name)))
                    .toList(),
          ),
      ],
    );
  }

  void _showModalMetadata() {
    final query = MediaQuery.of(context);
    final size = query.size;
    final heightPlayer =
        size.height -
        (XPlatform.isAndroid || XPlatform.isIOS ? query.viewPadding.top : 0) -
        (size.width * 1 / _aspectRatio!);

    _initialBottomSheet = max(0.5, heightPlayer / size.height);
    showModalBottomSheetNoScrim(
      context: context,
      isScrollControlled: true,
      // showDragHandle: true,
      useSafeArea: true,
      builder:
          (context, pop) => DraggableScrollableSheet(
            expand: false,
            snap: true,
            snapSizes: [_initialBottomSheet],
            initialChildSize: _initialBottomSheet,
            minChildSize: 0,
            maxChildSize: 1,
            builder: (context, scrollController) {
              final metaEiga = _metaEiga.value;

              return SingleChildScrollView(
                controller: scrollController,
                padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPoster(metaEiga),
                        SizedBox(width: 8),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  metaEiga.name,
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(fontSize: 16),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '${metaEiga.language ?? 'unknown'} | ${metaEiga.countries?.firstOrNull?.name ?? 'unknown'}',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Release year: ${metaEiga.yearOf}',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Episode: ${metaEiga.duration}',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    if (metaEiga.originalName != null)
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
                          Text(metaEiga.originalName!),
                        ],
                      ),
                    _buildDescription(metaEiga),
                    if (metaEiga.trailer != null)
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
                          Row(
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  if (metaEiga.trailer != null) {
                                    /// open url

                                    launchUrl(
                                      Uri.parse(metaEiga.trailer!),
                                      mode: LaunchMode.externalApplication,
                                    );
                                  }
                                },
                                icon: Iconify(Ion.play, size: 16.0),
                                label: Text('Watch Trailer'),
                              ),
                            ],
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

  void _showModalEpisodesFullscreen(BuildContext context) {
    showGeneralDialog(
      context: context,
      useRootNavigator: true,
      transitionBuilder: (context, anim, anim2, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(-1.0, 0.0),
            end: Offset(0.0, 0.0),
          ).animate(CurvedAnimation(parent: anim, curve: Curves.easeOut)),
          child: child,
        );
      },
      pageBuilder: (context, anim, anim2) {
        final padding = EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0);

        return GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: Material(
            color: Colors.transparent,
            child: Theme(
              data: ThemeData.dark(),
              child: FractionallySizedBox(
                alignment: Alignment.topLeft,
                widthFactor: 0.45,
                heightFactor: 1.0,
                child: Container(
                  color: Colors.black.withValues(alpha: 0.8),
                  padding: padding,
                  child: Column(
                    children: [
                      _buildSchedule(),
                      SizedBox(height: 7.0),
                      Expanded(
                        child: _buildSeasonArea(
                          scrollDirection: Axis.vertical,
                          inModal: true,
                          controller: ScrollController(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showModalEpisodes() {
    final query = MediaQuery.of(context);
    final size = query.size;
    final heightPlayer =
        100.h(context) -
        (XPlatform.isAndroid || XPlatform.isIOS ? query.viewPadding.top : 0) -
        (size.width * 1 / _aspectRatio!);

    _initialBottomSheet = max(0.5, heightPlayer / size.height);
    showModalBottomSheetNoScrim(
      context: context,
      isScrollControlled: true,
      // showDragHandle: true,
      useSafeArea: true,
      useRootNavigator: true,
      builder:
          (context, pop) => DraggableScrollableSheet(
            expand: false,
            snap: true,
            snapSizes: [0, _initialBottomSheet, 1],
            initialChildSize: _initialBottomSheet,
            minChildSize: 0,
            maxChildSize: 1,
            builder: (context, scrollController) {
              final padding = EdgeInsets.only(
                left: 12.0,
                right: 12.0,
                top: 16.0,
              );

              return FractionallySizedBox(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Container(
                  padding: padding,
                  child: Column(
                    children: [
                      _buildSchedule(),
                      SizedBox(height: 7.0),
                      Expanded(
                        child: _buildSeasonArea(
                          scrollDirection: Axis.vertical,
                          controller: scrollController,
                          inModal: true,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
    );
  }

  void _updateImageAndSchedule({required EigaEpisodes episodes}) {
    final metaEiga = _metaEiga.value;

    if (episodes.image != metaEiga.image && episodes.image != null) {
      _metaEiga.value = metaEiga.copyWith(image: episodes.image!);
    }
    if (episodes.poster != metaEiga.poster && episodes.poster != null) {
      _metaEiga.value = metaEiga.copyWith(poster: episodes.poster);
    }
    if (_schedule.value != episodes.schedule) {
      _schedule.value = episodes.schedule;
    }
  }

  void _onChangeEpisode({
    required String episodeId,
    required EigaEpisodes episodesEiga,
    required Season season,
  }) {
    _eigaId.value = season.eigaId;
    _episodes.value = episodesEiga;
    _episodeId.value = episodeId;

    _updateImageAndSchedule(episodes: episodesEiga);
  }

  Widget _buildServers() {
    return Watch(() {
      return FutureBuilder(
        future: _serversFuture.value,
        builder: (context, snapshot) {
          if (snapshot.hasError && snapshot.error is UnimplementedError) {
            return SizedBox.shrink();
          }

          final loading = snapshot.connectionState == ConnectionState.waiting;
          if (loading || !snapshot.hasData) return SizedBox.shrink();

          final servers = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Server',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 3.0),
              Watch(
                () => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Scrollbar(
                    child: ToggleSwitch(
                      minHeight: 30,
                      initialLabelIndex: max(
                        servers.indexWhere(
                          (server) =>
                              server.serverId == _serverIdSelected.value,
                        ),
                        0,
                      ),
                      totalSwitches: servers.length,
                      labels: servers.map((server) => server.name).toList(),
                      radiusStyle: true,
                      onToggle:
                          (index) =>
                              _serverIdSelected.value =
                                  servers.elementAt(index ?? 0).serverId,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    });
  }

  Widget _buildSeasonArea({
    Axis scrollDirection = Axis.horizontal,
    ScrollController? controller,
    bool inModal = false,
  }) {
    return Watch(() {
      final metaEiga = _metaEiga.value;

      if (metaEiga.seasons.isEmpty || metaEiga.seasons.length == 1) {
        final season = Season(eigaId: _eigaId.value, name: 'Episodes');
        return ListEpisodes(
          service: _service,
          season: season,
          metaEiga: _metaEiga,
          thumbnail: metaEiga.poster ?? metaEiga.image,
          sourceId: widget.sourceId,
          eigaId: _eigaId,
          episodeId: _episodeId,
          eventBus: _eventBus,
          cacheEpisodesStore: _cacheEpisodesStore,
          getWatchTimeEpisodes:
              (episodesEiga) async =>
                  _cacheWatchTimeStore[_eigaId.value] ??= await _service
                      .getWatchTimeEpisodes(
                        eigaId: _eigaId.value,
                        episodes: episodesEiga.episodes,
                      ),
          eager: !metaEiga.fake,
          scrollDirection: scrollDirection,
          controller: controller,
          onTapEpisode: ({required episodesEiga, required episodeId}) {
            if (metaEiga.fake) return;

            _onChangeEpisode(
              episodeId: episodeId,
              episodesEiga: episodesEiga,
              season: season,
            );
          },
        );
      }

      // tab view
      return DefaultTabController(
        key: ValueKey(metaEiga),
        length: metaEiga.seasons.length,
        initialIndex: max(
          0,
          metaEiga.seasons.indexWhere(
            (season) => season.eigaId == _eigaId.value,
          ),
        ),
        child: KaeruBuilder(
          builder: (context) {
            final tabController = DefaultTabController.of(context.context);
            final tabActive = context.ref(0);

            tabController.addListener(() {
              tabActive.value = tabController.index;
            });

            _eigaId.addListener(() {
              final index = metaEiga.seasons.indexWhere(
                (season) => season.eigaId == _eigaId.value,
              );
              if (index != tabController.index) {
                tabController.animateTo(index);
              }
            });

            final children = [
              (double? height) {
                final children =
                    metaEiga.seasons.map((season) {
                      final child = ListEpisodes(
                        service: _service,
                        season: season,
                        metaEiga: _metaEiga,
                        sourceId: widget.sourceId,
                        thumbnail: metaEiga.poster ?? metaEiga.image,
                        eigaId: _eigaId,
                        episodeId: _episodeId,
                        eventBus: _eventBus,
                        cacheEpisodesStore: _cacheEpisodesStore,
                        getWatchTimeEpisodes:
                            (episodesEiga) async =>
                                _cacheWatchTimeStore[season.eigaId] ??=
                                    await _service.getWatchTimeEpisodes(
                                      eigaId: season.eigaId,
                                      episodes: episodesEiga.episodes,
                                    ),
                        eager: !metaEiga.fake,
                        scrollDirection: scrollDirection,
                        controller: controller,
                        needLoad:
                            tabActive.value ==
                                metaEiga.seasons.indexOf(season) ||
                            inModal,
                        onTapEpisode: ({
                          required episodesEiga,
                          required episodeId,
                        }) {
                          if (metaEiga.fake) return;

                          _onChangeEpisode(
                            episodeId: episodeId,
                            episodesEiga: episodesEiga,
                            season: season,
                          );
                        },
                      );

                      return height == null
                          ? child
                          : SizedBox(height: height, child: child);
                    }).toList();

                return inModal
                    ? TabBarView(children: children)
                    : ContentSizeTabBarView(
                      controller: tabController,
                      children: children,
                    );
              },
              (void _) => TabBar(
                isScrollable: true,
                padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 0),
                labelPadding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 0,
                ),
                splashBorderRadius: BorderRadius.circular(10.0),
                labelStyle: TextStyle(fontSize: 13.0),
                indicatorColor: Theme.of(context.context).colorScheme.secondary,
                tabAlignment: TabAlignment.start,
                dividerHeight: 0,
                tabs:
                    metaEiga.seasons.map((season) {
                      return Tab(text: season.name);
                    }).toList(),
              ),
            ];

            if (inModal) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  children[1](null),
                  Expanded(
                    child: LayoutBuilder(
                      builder:
                          (context, constrains) => FractionallySizedBox(
                            heightFactor: 0.99,
                            widthFactor: 1.0,
                            child: children[0](constrains.biggest.height),
                          ),
                    ),
                  ),
                ],
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              verticalDirection:
                  scrollDirection == Axis.vertical
                      ? VerticalDirection.up
                      : VerticalDirection.down,
              children: children.map((fn) => fn(null)).toList(),
            );
          },
        ),
      );
    });
  }

  Widget _buildSuggest() {
    return Watch(() {
      final suggest = _suggest.value;
      final future = suggest.then(
        (data) =>
            data
                ?.map((item) => EigaExtend(eiga: item, sourceId: _service.uid))
                .toList() ??
            const <EigaExtend>[],
      );

      if (context.isGtSm) {
        return FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            final loading = snapshot.connectionState == ConnectionState.waiting;

            if (snapshot.hasError) {
              if (snapshot.error is UnimplementedError) {
                return SizedBox.shrink();
              }
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

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return SizedBox.shrink();
            }

            final data =
                loading
                    ? List.generate(
                      15,
                      (_) =>
                          EigaExtend(eiga: Eiga.createFakeData(), sourceId: ''),
                    )
                    : snapshot.data!;

            return ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder:
                  (context, index) => HorizontalEiga(
                    eiga: data[index].eiga,
                    sourceId: data[index].sourceId ?? '',
                  ),
            );
          },
        );
      }

      return VerticalEigaList(
        itemsFuture: future,
        title: 'Suggest',
        disableScroll: true,
        goMode: true,
        more: null,
      );
    });
  }
}
