import 'package:hoyomi/core_services/eiga/interfaces/episode_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/meta_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/watch_time.dart';
import 'package:hoyomi/core_services/mixin/base_auth_mixin.dart';

mixin EigaHistoryMixin on BaseAuthMixin {
  Future<WatchTime?> Function(
      {required String eigaId,
      required EpisodeEiga episode,
      required int episodeIndex,
      required MetaEiga metaEiga})? getWatchTime;
}
