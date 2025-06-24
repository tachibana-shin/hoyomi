import 'package:hoyomi/core_services/interfaces/setting/setting_field.dart';
import 'package:json_annotation/json_annotation.dart';

part 'field_input.g.dart';

@JsonSerializable()
class FieldInput extends SettingField {
  final String placeholder;
  final String defaultValue;
  final int maxLines;

  /// Mark this field to appear in the setting page.
  final bool appear;

  const FieldInput({
    required super.name,
    required super.key,
    super.description,
    required this.placeholder,
    required this.defaultValue,
    this.maxLines = 1,
    this.appear = false,
  });

  factory FieldInput.fromJson(Map<String, dynamic> json) =>
      _$FieldInputFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FieldInputToJson(this);
}
