import 'package:hoyomi/core_services/interfaces/setting/setting_field.dart';
import 'package:hoyomi/core_services/service.dart';

class FieldInput extends SettingField {
  final String placeholder;
  final String Function(Service service) defaultFn;

  const FieldInput({
    required super.name,
    required this.placeholder,
    required this.defaultFn,
  });
}
