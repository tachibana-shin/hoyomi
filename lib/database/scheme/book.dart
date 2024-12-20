import 'package:honyomi/database/scheme/history_chap.dart';
import 'package:isar/isar.dart';

part 'book.g.dart';

@Collection()
class Book {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String uid;

  @Index()
  late String sourceId;

  @Index()
  late String bookId;

  late String status;

  late String meta;

  @Backlink(to: 'book')
  final histories = IsarLinks<HistoryChap>();

  @Index()
  DateTime? followedAt;

  @Index()
  final DateTime createdAt;

  DateTime updatedAt;

  static String genUid(String sourceId, {required String bookId}) {
    return '$sourceId#$bookId';
  }

  Book({
    this.id = Isar.autoIncrement,
    required this.sourceId,
    required this.bookId,
    required this.status,
    required this.meta,
    this.followedAt,
    required this.createdAt,
    required this.updatedAt,
  });
}
