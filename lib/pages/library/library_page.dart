import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/widgets/library/history/eiga/horizontal_eiga_history_list.dart';
import 'package:hoyomi/widgets/pull_refresh_page.dart';

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
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          scrolledUnderElevation: 0.0,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return PullRefreshPage(
        onLoadData: () async {
          GoRouter.of(context).refresh();
          return [0x0];
        },
        onLoadFake: () => [0x0],
        builder: (data, _) => Scrollbar(
                child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Column(
                children: [
                  HorizontalEigaHistoryList(
                    sourceId: 'animevietsub',
                  )
                ],
              ),
            )));
  }
}
