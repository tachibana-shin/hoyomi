import 'package:hoyomi/database/scheme/service_setting.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'scheme/comic.dart';
import 'scheme/cookie_manager.dart';
import 'scheme/history_chap.dart';
import 'scheme/settings.dart';

late Isar isar;
Future<void> initializeIsar() async {
  // if (kIsWeb) {
  //   await Isar.initialize();
  //   isar = Isar.open(schemas: [
  //     ComicSchema,
  //     CookieManagerSchema,
  //     HistoryChapSchema,
  //     SettingsSchema
  //   ], directory: Isar.sqliteInMemory, engine: IsarEngine.sqlite);
  //   return;
  // }
  // await Isar.initialize();

  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open([
    ComicSchema,
    CookieManagerSchema,
    HistoryChapSchema,
    SettingsSchema,
    ServiceSettingSchema,
  ], directory: dir.path);
}
