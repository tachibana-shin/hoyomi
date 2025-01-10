import 'package:isar/isar.dart';

part 'book.g.dart';

@collection
class Book {
  late int id = 0;

  @Index(unique: true)
  late String uid;

  @Index()
  late String sourceId;

  @Index()
  late String bookId;

  late String status;

  late String meta;

  @Index()
  DateTime? followedAt;

  @Index()
  final DateTime createdAt;

  DateTime updatedAt;

  static String genUid(String sourceId, {required String bookId}) {
    return '$sourceId#$bookId';
  }

  Book({
    required this.sourceId,
    required this.bookId,
    required this.status,
    required this.meta,
    this.followedAt,
    required this.createdAt,
    required this.updatedAt,
  });
}
