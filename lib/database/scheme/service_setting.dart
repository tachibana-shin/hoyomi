import 'package:isar/isar.dart';

part 'service_setting.g.dart';

@Collection()
class ServiceSetting {
  Id? id;

  @Index(unique: true)
  late String sourceId;

  late String? settings;

  @Index()
  final DateTime createdAt;

  DateTime updatedAt;

  // Constructor
  ServiceSetting({
    required this.sourceId,
    required this.settings,
    required this.createdAt,
    required this.updatedAt,
  });
}
