import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<File> saveFileCache(
    {required String content, required String path}) async {
  final directory = await getTemporaryDirectory();

  final file = File('${directory.path}/$path');
  await file.writeAsString(content);

  return file;
}
