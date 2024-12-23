import 'package:flutter/material.dart';
import 'package:honyomi/core_services/eiga/interfaces/subtitle.dart';
import 'package:honyomi/screens/home_eiga/player_eiga.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
      )
    ])));
  }
}
