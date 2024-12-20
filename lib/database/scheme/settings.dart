import 'package:isar/isar.dart';

part 'settings.g.dart';

@Collection()
class Settings {
  Id id = Isar.autoIncrement;

  late bool mangaReadLazyPage;

  /// Time to seconds
  /// Default to 3 hours
  late int pollingIntervalBook = 60 * 60 * 3; // 3 hours

  Settings({
    this.id = Isar.autoIncrement,
    this.mangaReadLazyPage = true,
  });
}
