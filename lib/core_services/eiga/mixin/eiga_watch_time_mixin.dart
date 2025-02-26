import 'package:hoyomi/core_services/eiga/interfaces/eiga_episode.dart';
import 'package:hoyomi/core_services/eiga/interfaces/meta_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/watch_time.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';

mixin EigaWatchTimeMixin on AuthMixin {
  Future<WatchTime> getWatchTime({
    required String eigaId,
    required EigaEpisode episode,
    required int episodeIndex,
    required MetaEiga metaEiga,
  });

  Future<Map<String, WatchTime>> getWatchTimeEpisodes({
    required String eigaId,
    required List<EigaEpisode> episodes,
  }) async {
    return {};
  }

  Future<void> setWatchTime({
    required String eigaId,
    required EigaEpisode episode,
    required int episodeIndex,
    required MetaEiga metaEiga,
    required Season season,
    required WatchTime watchTime,
  });
}
