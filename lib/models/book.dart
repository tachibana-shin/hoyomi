import 'package:objectbox/objectbox.dart';

@Entity()
class Book {
  @Id()
  int id = 0;

  @Unique(onConflict: ConflictStrategy.replace)
  String bookId;

  // @Property(type: PropertyType.byteVector)
  String meta;

  DateTime createdAt;

  Book({
    this.id = 0,
    required this.bookId,
    required this.meta,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}
