import 'package:objectbox/objectbox.dart';

@Entity()
class Settings {
  @Id()
  int id = 0;

  bool mangaReadLazyPage;

  /// Time to seconds
  /// Default to 3 hours
  int pollingIntervalBook = 60 * 60 * 3; // 30 hours

  Settings({
    this.id = 0,
    this.mangaReadLazyPage = true,
  });
}
