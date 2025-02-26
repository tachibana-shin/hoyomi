import 'package:hoyomi/core_services/eiga/interfaces/watch_time.dart';

class WatchTimeData {
  final String eigaId;
  final String episodeId;
  final WatchTime? watchTime;

  const WatchTimeData({
    required this.eigaId,
    required this.episodeId,
    required this.watchTime,
  });
}
