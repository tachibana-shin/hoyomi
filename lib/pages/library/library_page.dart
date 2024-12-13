import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/widgets/library/follow_horizontal_list.dart';
import 'package:honyomi/widgets/library/history_horizontal_list.dart';
import 'package:honyomi/widgets/pull_to_refresh.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LibraryPage'),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          scrolledUnderElevation: 0.0,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return PullToRefresh(
        controller: _refreshController,
        onRefresh: () async {
          GoRouter.of(context).refresh();
        },
        initialData: null,
        builder: (data) => Scrollbar(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  HistoryHorizontalList(),
                  FollowHorizontalList(),
                ],
              ),
            )));
  }
}
