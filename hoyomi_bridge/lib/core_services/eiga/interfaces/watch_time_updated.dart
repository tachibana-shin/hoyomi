import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eval_annotation/eval_annotation.dart';

part 'watch_time_updated.freezed.dart';
part 'watch_time_updated.g.dart';

@freezed
@Bind()
sealed class WatchTimeUpdated with _$WatchTimeUpdated {
  const factory WatchTimeUpdated({
    required Duration position,
    required Duration duration,
    required DateTime updatedAt,
  }) = _WatchTimeUpdated;

  factory WatchTimeUpdated.fromJson(Map<String, dynamic> json) =>
      _$WatchTimeUpdatedFromJson(json);
}
