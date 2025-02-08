import 'package:hoyomi/database/isar.dart';
import 'package:hoyomi/database/scheme/cookie_manager.dart';
import 'package:isar/isar.dart';

class CookieController {
  static final _cookieManagerBox = isar.cookieManagers;
  static final Map<String, Future<CookieManager?>> _dataStore = {};

  static CookieManager? get({required String sourceId}) {
    final data =
        _cookieManagerBox.where().sourceIdEqualTo(sourceId).findFirst();
    if (data == null) return null;
    return data;
  }

  static Future<CookieManager?> getAsync({required String sourceId}) {
    return _dataStore[sourceId] ??=
        _cookieManagerBox.where().sourceIdEqualTo(sourceId).findFirstAsync();
  }

  static Future<void> save(CookieManager data) async {
    await isar.writeAsync((isar) {
      _dataStore[data.sourceId] = Future.value(data);
      isar.cookieManagers.put(data);
    });
  }
}
