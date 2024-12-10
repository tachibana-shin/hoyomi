import 'package:flutter/material.dart';
import 'package:honyomi/widgets/library/follow_horizontal_list.dart';
import 'package:honyomi/widgets/library/history_horizontal_list.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LibraryPage'),
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          HistoryHorizontalList(),
          FollowHorizontalList(),
        ],
      ),
    );
  }
}
