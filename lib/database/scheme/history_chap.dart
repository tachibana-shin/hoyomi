import 'package:drift/drift.dart';

@DataClassName('HistoryChap')
class HistoryChaps extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get book => integer()();
  TextColumn get chapterId => text()();
  RealColumn get currentPage => real()();
  IntColumn get maxPage => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}
