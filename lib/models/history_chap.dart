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

  @Index()
  DateTime createdAt;

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
