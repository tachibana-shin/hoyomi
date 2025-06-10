import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eval_annotation/eval_annotation.dart';

part 'field_input.freezed.dart';
part 'field_input.g.dart';

@Bind()
@freezed
sealed class FieldInput with _$FieldInput {
  const factory FieldInput({
    required String name,
    required String key,
    String? description,
    required String placeholder,
    required String defaultValue,
    @Default(1) int maxLines,
    @Default(false) bool appear,
  }) = _FieldInput;

  factory FieldInput.fromJson(Map<String, dynamic> json) =>
      _$FieldInputFromJson(json);
}
