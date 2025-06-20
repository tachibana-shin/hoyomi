import 'package:json_annotation/json_annotation.dart';

part 'setting_field.g.dart';

@JsonSerializable()
class SettingField {
  final String name;
  final String key;
  final String? description;

  const SettingField({
    required this.name,
    required this.key,
    required this.description,
  });

  factory SettingField.fromJson(Map<String, dynamic> json) =>
      _$SettingFieldFromJson(json);
  Map<String, dynamic> toJson() => _$SettingFieldToJson(this);
}
