import 'package:freezed_annotation/freezed_annotation.dart';

part 'opening_ending.freezed.dart';
part 'opening_ending.g.dart';

@freezed
class DurationRange with _$DurationRange {
  const factory DurationRange({
    required Duration start,
    required Duration end,
  }) = _DurationRange;

  factory DurationRange.fromJson(Map<String, dynamic> json) =>
      _$DurationRangeFromJson(json);
}

@freezed
class OpeningEnding with _$OpeningEnding {
  const factory OpeningEnding({
    DurationRange? opening,
    DurationRange? ending,
  }) = _OpeningEnding;

  factory OpeningEnding.fromJson(Map<String, dynamic> json) =>
      _$OpeningEndingFromJson(json);
}
