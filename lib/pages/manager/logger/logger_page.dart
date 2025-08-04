import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kaeru/kaeru.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:open_file/open_file.dart';

class LoggerPage extends StatefulWidget {
  const LoggerPage({super.key});

  @override
  State<LoggerPage> createState() => _LoggerPageState();
}

class _LoggerPageState extends State<LoggerPage> with KaeruMixin {
  late final _logFiles = ref<List<FileSystemEntity>>([]);
  final ScrollController _scrollController = ScrollController();

  bool _isLoading = false;
  late final _hasMore = ref<bool>(true);
  late final _loadedCount = ref<int>(0);

  final int _loadBatchSize = 20;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadMoreLogs();
  }

  Future<void> _loadMoreLogs() async {
    if (_isLoading || !_hasMore.value) return;
    _isLoading = true;

    final appDir = await getApplicationDocumentsDirectory();
    final logsDir = Directory(join(appDir.path, 'logs'));
    if (!await logsDir.exists()) {
      await logsDir.create(recursive: true);
    }

    final allFiles = await logsDir.list().toList();
    allFiles.sort(
      (a, b) => b.statSync().modified.compareTo(a.statSync().modified),
    ); // sort descending

    final newItems = allFiles
        .skip(_loadedCount.value)
        .take(_loadBatchSize)
        .toList();

    _logFiles.value = [..._logFiles.value, ...newItems];
    _loadedCount.value += newItems.length;
    _hasMore.value = _loadedCount.value < allFiles.length;

    _isLoading = false;
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadMoreLogs();
    }
  }

  Future<void> _openLog(File file) async {
    final result = await OpenFile.open(file.path, type: 'text/plain');
    debugPrint('Open result: ${result.message}');
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String _fileName(FileSystemEntity file) => basename(file.path);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Logs Viewer'), centerTitle: true),
      body: Watch(
        () => ListView.builder(
          controller: _scrollController,
          itemCount: _logFiles.value.length + (_hasMore.value ? 1 : 0),
          itemBuilder: (context, index) {
            if (index >= _logFiles.value.length) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }

            final file = _logFiles.value[index];
            return ListTile(
              leading: const Icon(Icons.insert_drive_file_outlined),
              title: Text(_fileName(file)),
              subtitle: Text(
                file.statSync().modified.toString(),
                style: const TextStyle(fontSize: 12),
              ),
              onTap: () => _openLog(file as File),
            );
          },
        ),
      ),
    );
  }
}
