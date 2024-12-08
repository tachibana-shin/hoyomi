import 'package:honyomi/models/book.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class HistoryChap {
  @Id()
  int id;

  final book = ToOne<Book>();

  @Index()
  String chapterId;

  double currentPage;
  int maxPage;

  @Property(type: PropertyType.date)
  @Index()
  DateTime createdAt;

  @Property(type: PropertyType.date)
  DateTime updatedAt;

  HistoryChap({
    this.id = 0,
    required this.chapterId,
    required this.currentPage,
    required this.maxPage,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();
}
