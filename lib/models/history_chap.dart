import 'package:honyomi/models/history.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class HistoryChap {
  @Id()
  int id;

  final history = ToOne<History>();

  @Unique(onConflict: ConflictStrategy.replace)
  String uid;

  String chapterId;

  int currentPage;
  int maxPage;

  @Property(type: PropertyType.date)
  DateTime createdAt;
  @Property(type: PropertyType.date)
  DateTime updatedAt;

  HistoryChap({
    this.id = 0,
    required this.uid,
    required this.chapterId,
    required this.currentPage,
    required this.maxPage,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();
}
