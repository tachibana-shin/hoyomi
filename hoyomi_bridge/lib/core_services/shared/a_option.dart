import 'package:eval_annotation/eval_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'a_option.freezed.dart';
part 'a_option.g.dart';

@freezed
@Bind()
sealed class Option with _$Option {
  const factory Option({
    required String name,
    required String value,
    @Default(false) bool selected,
  }) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}
