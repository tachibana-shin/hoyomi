import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/eiga/interfaces/main.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';

part 'eiga_watch_time_mixin.freezed.dart';

@freezed
sealed class EigaWatchContext with _$EigaWatchContext {
  const factory EigaWatchContext({
    required String eigaId,
    required EigaEpisode episode,
    required MetaEiga metaEiga,
    Season? season,
  }) = _EigaWatchContext;
}

mixin EigaWatchTimeMixin on AuthMixin {
  Future<List<EigaHistory>> getWatchHistory({required int page});

  Future<WatchTime> getWatchTime(EigaWatchContext context);

  Future<Map<String, WatchTimeUpdated>> getWatchTimeEpisodes({
    required String eigaId,
    required List<EigaEpisode> episodes,
  }) async {
    return {};
  }

  Future<void> setWatchTime(
    EigaWatchContext context, {
    required WatchTime watchTime,
  });
}
