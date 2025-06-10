import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eval_annotation/eval_annotation.dart';
import 'package:hoyomi_bridge/export.dart';

part 'filter.freezed.dart';
part 'filter.g.dart';

@freezed
@Bind()
sealed class Filter with _$Filter {
  const factory Filter({
    required String name,
    required String key,
    required bool multiple,
    required List<Option> options,
  }) = _Filter;

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
}
