import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate_value.freezed.dart';
part 'rate_value.g.dart';

@freezed
class RateValue with _$RateValue {
  const factory RateValue({
    required int best,
    required int count,
    required double value,
  }) = _RateValue;

  factory RateValue.fromJson(Map<String, dynamic> json) =>
      _$RateValueFromJson(json);

  factory RateValue.createFakeData() {
    return RateValue(best: 5, count: 1000, value: 4.5);
  }
}
