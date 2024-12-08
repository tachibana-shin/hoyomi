import 'package:honyomi/models/history_chap.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Book {
  @Id()
  int id = 0;

  @Unique(onConflict: ConflictStrategy.replace)
  String uid;

  @Index()
  String sourceId;

  @Index()
  String bookId;

  // @Property(type: PropertyType.byteVector)
  String meta;

  @Backlink('book')
  final histories = ToMany<HistoryChap>();

  static String genUid(String sourceId, {required String bookId}) {
    return '$sourceId#$bookId';
  }

  Book(
      {this.id = 0,
      required this.sourceId,
      required this.bookId,
      required this.meta})
      : uid = Book.genUid(sourceId, bookId: bookId);
}
