import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:eval_annotation/eval_annotation.dart';

part 'watch_time_data.freezed.dart';
part 'watch_time_data.g.dart';

@freezed
@Bind()
sealed class WatchTimeData with _$WatchTimeData {
  const factory WatchTimeData({
    required String eigaId,
    required String episodeId,
    WatchTime? watchTime,
  }) = _WatchTimeData;

  factory WatchTimeData.fromJson(Map<String, dynamic> json) =>
      _$WatchTimeDataFromJson(json);
}
