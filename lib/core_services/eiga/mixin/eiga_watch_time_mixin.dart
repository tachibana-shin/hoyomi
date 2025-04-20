import 'package:hoyomi/core_services/eiga/interfaces/main.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';

mixin EigaWatchTimeMixin on AuthMixin {
  Future<List<EigaHistory>> getWatchHistory({required int page});

  Future<WatchTime> getWatchTime({
    required String eigaId,
    required EigaEpisode episode,
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
    required MetaEiga metaEiga,
    required Season season,
    required WatchTime watchTime,
  });
}
