import 'package:honyomi/models/history.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Book {
  @Id()
  int id = 0;

  @Unique(onConflict: ConflictStrategy.replace)
  String bookId;

  String sourceId;

  // @Property(type: PropertyType.byteVector)
  String meta;

  final history = ToOne<History>();

  Book(
      {this.id = 0,
      required this.bookId,
      required this.sourceId,
      required this.meta});
}
