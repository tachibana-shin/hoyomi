import 'package:hoyomi/core_services/interfaces/setting/setting_field.dart';
import 'package:hoyomi/core_services/service.dart';

class FieldInput extends SettingField {
  final String placeholder;
  final String Function(Service service) defaultFn;
  final int maxLines;

  /// Mark this field to appear in the setting page.
  final bool appear;

  const FieldInput({
    required super.name,
    required super.key,
    super.description,
    required this.placeholder,
    required this.defaultFn,
    this.maxLines = 1,
    this.appear = true,
  });
}
