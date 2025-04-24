import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter.freezed.dart';
part 'filter.g.dart';

@freezed
sealed class Option with _$Option {
  const factory Option({
    required String name,
    required String value,
    @Default(false) bool selected,
  }) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}

@freezed
sealed class Filter with _$Filter {
  const factory Filter({
    required String name,
    required String key,
    required bool multiple,
    required List<Option> options,
  }) = _Filter;

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
}
