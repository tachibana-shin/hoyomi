import 'package:drift/drift.dart';

@DataClassName('CookieManager')
class CookieManagers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get sourceId => text().unique()();
  TextColumn? get cookie => text().nullable()();
  TextColumn? get userAgent => text().nullable()();
  TextColumn? get user => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get userUpdatedAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}
