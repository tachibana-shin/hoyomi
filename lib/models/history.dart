import 'package:honyomi/models/book.dart';
import 'package:honyomi/models/history_chap.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class History {
  @Id()
  int id;

  final book = ToOne<Book>();

  @Backlink('history')
  final chapters = ToMany<HistoryChap>();

  @Property(type: PropertyType.date)
  DateTime createdAt;
  @Property(type: PropertyType.date)
  DateTime updatedAt;

  History({
    this.id = 0,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();
}
