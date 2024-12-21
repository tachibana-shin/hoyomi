import 'package:isar/isar.dart';

part 'settings.g.dart';

@Collection()
class Settings {
  late int id;

  late bool mangaReadLazyPage;

  /// Time to seconds
  /// Default to 3 hours
  late int pollingIntervalBook = 60 * 60 * 3; // 3 hours

  Settings({
    this.mangaReadLazyPage = true,
  });
}
