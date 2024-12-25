import 'package:flutter/material.dart';
import 'package:honyomi/core_services/eiga/interfaces/meta_eiga.dart';

class ListEpisodesHorizontal extends StatefulWidget {
  final String sourceId;
  final BasicSeason season;
  
  const ListEpisodesHorizontal({super.key, required this.sourceId, required this.season});

  @override
  State<ListEpisodesHorizontal> createState() => _ListEpisodesHorizontalState();
}

class _ListEpisodesHorizontalState extends State<ListEpisodesHorizontal>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'ListEpisodesHorizontal is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
