import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/eiga/interfaces/watch_time.dart';

part 'watch_time_data.freezed.dart';
part 'watch_time_data.g.dart';

@freezed
class WatchTimeData with _$WatchTimeData {
  const factory WatchTimeData({
    required String eigaId,
    required String episodeId,
    WatchTime? watchTime,
  }) = _WatchTimeData;

  factory WatchTimeData.fromJson(Map<String, dynamic> json) =>
      _$WatchTimeDataFromJson(json);
}
