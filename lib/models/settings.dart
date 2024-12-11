import 'package:honyomi/models/history_chap.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Settings {
  @Id()
  int id = 0;

  bool mangaReadLazyPage;

  Settings({
    this.id = 0,
    this.mangaReadLazyPage = true,
  });
}
