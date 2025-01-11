import 'package:hoyomi/database/isar.dart';
import 'package:hoyomi/database/scheme/cookie_manager.dart';
import 'package:isar/isar.dart';

class CookieController {
  static final _cookieManagerBox = isar.cookieManagers;

  static CookieManager? get({required String sourceId}) {
    return _cookieManagerBox.where().uidEqualTo(sourceId).findFirst();
  }

  static Future<CookieManager?> getAsync({required String sourceId}) {
    return _cookieManagerBox.where().uidEqualTo(sourceId).findFirstAsync();
  }

  static Future<void> save(CookieManager data) async {
    await isar.writeAsync((isar) {
      isar.cookieManagers.put(data);
    });
  }
}
