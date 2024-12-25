import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

import 'package:honyomi/core_services/eiga/eiga_base_service.dart';
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
      this.episodeId});

  @override
  State<DetailsEigaPage> createState() => _DetailsEigaPageState();
}

class _DetailsEigaPageState extends State<DetailsEigaPage> {
  late final EigaBaseService _service;
  late final Future<MetaEiga> _metaEigaFuture;

  @override
  void initState() {
    super.initState();
    _service = getEigaService(widget.sourceId);
    _metaEigaFuture = _service.getDetails(widget.eigaId);

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

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBasicInfo(metaEiga),
                  SizedBox(height: 10.0),
                  _buildSeasonArea(metaEiga)
                ],
              );
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

  Widget _buildSeasonArea(MetaEiga metaEiga) {
    // tab view
    return DefaultTabController(
      length: metaEiga.seasons.length,
      initialIndex: metaEiga.seasons
          .indexWhere((season) => season.eigaId == widget.eigaId),
      child: Column(children: [
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
        TabBarView(
            children: metaEiga.seasons.map((season) {
          return ListEpisodesHorizontal(
              season: season, sourceId: widget.sourceId);
        }).toList())
      ]),
    );
  }
}
