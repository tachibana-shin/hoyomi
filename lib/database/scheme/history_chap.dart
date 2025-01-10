import 'package:isar/isar.dart';

part 'history_chap.g.dart';

@collection
class HistoryChap {
  late int id = 0;

  late int book;

  @Index()
  late String chapterId;

  late double currentPage;
  late int maxPage;

  @Index()
  final DateTime createdAt;

  DateTime updatedAt;

  HistoryChap({
    required this.chapterId,
    required this.currentPage,
    required this.maxPage,
    required this.createdAt,
    required this.updatedAt,
  });
}

