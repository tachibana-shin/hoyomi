import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/eiga/interfaces/main.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';

mixin EigaWatchTimeMixin on AuthMixin {
  Future<List<EigaHistory>> getWatchHistory({required int page});

  Future<WatchTime> getWatchTime(EigaContext context);

  Future<Map<String, WatchTimeUpdated>> getWatchTimeEpisodes({
    required String eigaId,
    required List<EigaEpisode> episodes,
  });

  Future<void> setWatchTime(
    EigaContext context, {
    required WatchTime watchTime,
  });
}
