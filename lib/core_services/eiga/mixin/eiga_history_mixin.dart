import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/core_services/interfaces/history_item.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';

mixin EigaHistoryMixin on AuthMixin {
  Future<List<HistoryItem<Eiga>>> getWatchHistory({required int page});
}
