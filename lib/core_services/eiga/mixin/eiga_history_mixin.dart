import 'package:hoyomi/core_services/eiga/interfaces/episode_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/meta_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/watch_time.dart';
import 'package:hoyomi/core_services/mixin/base_auth_mixin.dart';

mixin EigaHistoryMixin on BaseAuthMixin {
  Future<WatchTime> getWatchTime(
      {required String eigaId,
      required EpisodeEiga episode,
      required int episodeIndex,
      required MetaEiga metaEiga});

  Future<Map<String, WatchTime>> getWatchTimeEpisodes(
      {required String eigaId, required List<EpisodeEiga> episodes}) async {
    return {};
  }

  Future<void> setWatchTime(
      {required String eigaId,
      required EpisodeEiga episode,
      required int episodeIndex,
      required MetaEiga metaEiga,
      required BasicSeason season,
      required WatchTime watchTime});
}
