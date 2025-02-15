import 'package:isar/isar.dart';

part 'history_chap.g.dart';

@collection
class HistoryChap {
  Id? id;

  late int comic;

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
