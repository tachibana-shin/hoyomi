import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'scheme/book.dart';
import 'scheme/cookie_manager.dart';
import 'scheme/history_chap.dart';
import 'scheme/settings.dart';

late Isar isar;
Future<void> initializeIsar() async {
  if (kIsWeb) {
    await Isar.initialize();
    isar = Isar.open(schemas: [
      BookSchema,
      CookieManagerSchema,
      HistoryChapSchema,
      SettingsSchema
    ], directory: Isar.sqliteInMemory, engine: IsarEngine.sqlite);
    return;
  }
  final dir = await getApplicationDocumentsDirectory();
  isar = Isar.open(
    schemas: [
      BookSchema,
      CookieManagerSchema,
      HistoryChapSchema,
      SettingsSchema
    ],
    directory: dir.path,
  );
}
