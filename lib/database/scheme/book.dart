import 'package:drift/drift.dart';

@DataClassName('Book')
class Books extends Table {
  late final id = integer().autoIncrement()();
  
  TextColumn get sourceId => text()();
  TextColumn get bookId => text()();
  TextColumn get status => text()();
  TextColumn get meta => text()();
  DateTimeColumn? get followedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}
