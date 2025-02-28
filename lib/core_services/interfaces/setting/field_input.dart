import 'package:hoyomi/core_services/interfaces/setting/setting_field.dart';
import 'package:hoyomi/core_services/service.dart';

class FieldInput extends SettingField {
  final String placeholder;
  final String Function(Service service) defaultFn;
  final int maxLines;

  const FieldInput({
    required super.name,
    super.description,
    required this.placeholder,
    required this.defaultFn,
    this.maxLines = 1,
  });
}
