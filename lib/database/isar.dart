import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'scheme/book.dart';
import 'scheme/cookie_manager.dart';
import 'scheme/history_chap.dart';
import 'scheme/settings.dart';

late Isar isar;
Future<void> initializeIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open(
    [BookSchema, CookieManagerSchema, HistoryChapSchema, SettingsSchema],
    directory: dir.path,
  );
}
