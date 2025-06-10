import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eval_annotation/eval_annotation.dart';

part 'setting_field.freezed.dart';
part 'setting_field.g.dart';

@Bind()
@freezed
sealed class SettingField with _$SettingField {
  const factory SettingField({
    required String name,
    required String key,
    String? description,
  }) = _SettingField;

  factory SettingField.fromJson(Map<String, dynamic> json) =>
      _$SettingFieldFromJson(json);
}
