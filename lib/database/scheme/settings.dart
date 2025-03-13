import 'package:isar/isar.dart';

part 'settings.g.dart';

@Collection()
class Settings {
  Id? id;

  late bool mangaReadLazyPage;
  late String? lastCheckUpdateApp;

  /// Time to seconds
  /// Default to 3 hours
  late int pollingIntervalComic = 60 * 60 * 3; // 3 hours

  Settings({this.mangaReadLazyPage = true, this.lastCheckUpdateApp});
}
