import 'package:drift/drift.dart';

@DataClassName('Setting')
class Settings extends Table {
  late final id = integer().autoIncrement()();
  late final mangaReadLazyPage = boolean().withDefault(const Constant(true))();
  late final pollingIntervalBook =
      integer().withDefault(Constant(60 * 60 * 3))();
}
