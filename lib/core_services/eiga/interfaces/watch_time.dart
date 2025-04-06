import 'package:freezed_annotation/freezed_annotation.dart';

part 'watch_time.freezed.dart';
part 'watch_time.g.dart';

@freezed
class WatchTime with _$WatchTime {
  const factory WatchTime({
    required Duration position,
    required Duration duration,
  }) = _WatchTime;

  factory WatchTime.fromJson(Map<String, dynamic> json) =>
      _$WatchTimeFromJson(json);
}
