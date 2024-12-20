import 'package:honyomi/database/scheme/book.dart';
import 'package:isar/isar.dart';

part 'history_chap.g.dart';

@Collection()
class HistoryChap {
  Id id = Isar.autoIncrement;

  final book = IsarLink<Book>();

  @Index()
  late String chapterId;

  late double currentPage;
  late int maxPage;

  @Index()
  final DateTime createdAt;

  DateTime updatedAt;

  HistoryChap({
    this.id = Isar.autoIncrement,
    required this.chapterId,
    required this.currentPage,
    required this.maxPage,
    required this.createdAt,
    required this.updatedAt,
  });
}
