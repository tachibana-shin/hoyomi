import 'package:freezed_annotation/freezed_annotation.dart';

part 'watch_page_updated.freezed.dart';
part 'watch_page_updated.g.dart';

@freezed
sealed class WatchPageUpdated with _$WatchPageUpdated {
  factory WatchPageUpdated({
    required int currentPage,
    required int totalPage,
    required DateTime updatedAt,
  }) = _WatchPageUpdated;

  factory WatchPageUpdated.fromJson(Map<String, dynamic> json) =>
      _$WatchPageUpdatedFromJson(json);
}
