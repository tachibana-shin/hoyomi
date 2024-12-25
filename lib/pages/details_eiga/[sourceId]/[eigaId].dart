import 'dart:math';

import 'package:contentsize_tabbarview/contentsize_tabbarview.dart';
import 'package:flutter/material.dart' hide TimeOfDay;
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

import 'package:honyomi/core_services/eiga/eiga_base_service.dart';
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
  late final Future<MetaEiga> _metaEigaFuture;

  final Map<String, EpisodesEiga> _cacheEpisodesStore = {};

  late String _eigaId;
  late String? _episodeId;
  TimeAndDay? _schedule;

  @override
  void initState() {
    super.initState();
    _service = getEigaService(widget.sourceId);
    _metaEigaFuture = _service.getDetails(widget.eigaId);

    _eigaId = widget.eigaId;
    _episodeId = widget.episodeId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return SingleChildScrollView(
        child: Column(children: [
      PlayerEiga(
        title: 'Title',
        subtitle: 'Subtitle',
        onBack: () {
          Navigator.pop(context);
        },
        subtitles: [
          Subtitle(code: 'en', language: 'English', url: ''),
          Subtitle(code: 'vi', language: 'Vietnamese', url: ''),
        ],
        source: SourceVideo(src: '', type: 'mp4'),
      ),
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

              final metaEiga = snapshot.data as MetaEiga;

              return StatefulBuilder(
                  builder: (context, setState2) => Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildBasicInfo(metaEiga),
                          SizedBox(height: 10.0),
                          _buildSchedule(),
                          _buildSeasonArea(metaEiga, setState2: setState2)
                        ],
                      ));
            },
          )),
    ]));
  }

  Widget _buildBasicInfo(MetaEiga metaEiga) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // name
        Text(metaEiga.name,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
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
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 12.0)),
              GestureDetector(
                  onTap: () {
                    context.push(
                        '/section_eiga/${widget.sourceId}/${metaEiga.studio!.genreId}');
                  },
                  child: Text(
                    metaEiga.studio!.name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
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
          if (metaEiga.countries?.isNotEmpty == true) VerticalSeparator(),
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
                context
                    .push('/section_eiga/${widget.sourceId}/${genre.genreId}');
              },
              child: Text(
                '#${genre.name}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 12.0,
                      color: Theme.of(context).colorScheme.tertiaryFixedDim,
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
    );
  }

  Widget _buildSchedule() {
    if (_schedule == null) return SizedBox.shrink();

    return Row(children: [
      Icon(
        MaterialCommunityIcons.clock_outline,
        size: 16.0,
        color: Theme.of(context).colorScheme.secondary,
      ),
      SizedBox(width: 5.0),
      Text(
        'Updated on day ${_schedule!.day} of the week at ${_schedule!.hour}:${_schedule!.minute}',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary, fontSize: 12.0),
      )
    ]);
  }

  Widget _buildSeasonArea(MetaEiga metaEiga,
      {required void Function(void Function()) setState2}) {
    void updateData(EpisodesEiga episodes) {
      if (episodes.image != null) {
        metaEiga.image = episodes.image!;
      }
      if (episodes.poster != null) {
        metaEiga.poster = episodes.poster;
      }
      if (episodes.schedule != null) {
        _schedule = episodes.schedule;
      }

      setState2(() {});
    }

    // tab view
    return DefaultTabController(
      length: metaEiga.seasons.length,
      initialIndex: max(
          0, metaEiga.seasons.indexWhere((season) => season.eigaId == _eigaId)),
      child: Builder(builder: (context) {
        final controller = DefaultTabController.of(context);
        controller.addListener(() {
          final episodes =
              _cacheEpisodesStore[metaEiga.seasons[controller.index].eigaId];

          if (episodes != null) {
            updateData(episodes);
          }
        });

        return Column(children: [
          TabBar(
            isScrollable: true,
            splashBorderRadius: BorderRadius.circular(35.0),
            indicatorColor: Theme.of(context).colorScheme.secondary,
            tabs: metaEiga.seasons.map((season) {
              return Tab(
                text: season.name,
              );
            }).toList(),
          ),
          ContentSizeTabBarView(
              children: metaEiga.seasons.map((season) {
            return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: ListEpisodesHorizontal(
                    season: season,
                    sourceId: widget.sourceId,
                    eigaId: _eigaId,
                    episodeId: _episodeId,
                    onUpdate: (episodes) {
                      _cacheEpisodesStore[season.eigaId] = episodes;
                      if (season.eigaId ==
                          metaEiga.seasons[controller.index].eigaId) {
                        updateData(episodes);
                      }
                    },
                    onTap: (episode) {
                      setState2(() {
                        _eigaId = season.eigaId;
                        _episodeId = episode.episodeId;
                      });
                    }));
          }).toList())
        ]);
      }),
    );
  }
}
