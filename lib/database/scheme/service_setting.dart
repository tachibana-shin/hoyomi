import 'package:isar/isar.dart';

part 'service_setting.g.dart';

@Collection()
class ServiceSetting {
  Id? id;

  @Index(unique: true)
  late String sourceId;

  /// This field save all field: cookie, user agent...
  late String? settings;

  /// Cache user data
  late String? userDataCache;

  @Index()
  final DateTime createdAt;

  DateTime updatedAt;

  // Constructor
  ServiceSetting({
    required this.sourceId,
    required this.settings,
    required this.userDataCache,
    required this.createdAt,
    required this.updatedAt,
  });
}
