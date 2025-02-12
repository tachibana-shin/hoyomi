import 'package:drift/drift.dart';
import 'package:hoyomi/database/drift.dart';

class CookieController {
  final AppDatabase _db;

  CookieController._(this._db);
  static final CookieController _instance =
      CookieController._(AppDatabase());

  static CookieController get instance => _instance;

  // Synchronously fetch the cookie manager
  Future<CookieManager?> get({required String sourceId}) async {
    final result = await _db.managers.cookieManagers
        .filter((f) => f.sourceId.equals(sourceId))
        .getSingleOrNull();
    return result;
  }

  // Asynchronously fetch the cookie manager
  Future<CookieManager?> getAsync({required String sourceId}) async {
    return await _db.managers.cookieManagers
        .filter((t) => t.sourceId.equals(sourceId))
        .getSingleOrNull();
  }

  // Save the cookie manager (insert or update)
  Future<void> save(Insertable<CookieManager> data) async {
    await _db.into(_db.cookieManagers).insertOnConflictUpdate(data);
  }
}
