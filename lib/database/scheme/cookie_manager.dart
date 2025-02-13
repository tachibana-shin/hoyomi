import 'package:isar/isar.dart';

part 'cookie_manager.g.dart';

@Collection()
class CookieManager {
  Id? id;


  @Index(unique: true)
  late String sourceId;

  late String? cookie;
  late String? userAgent;

  late String? user;

  @Index()
  final DateTime createdAt;

  DateTime userUpdatedAt;

  DateTime updatedAt;

  // Constructor
  CookieManager({
    required this.sourceId,
    required this.cookie,
    required this.userAgent,
    required this.user,
    required this.createdAt,
    required this.userUpdatedAt,
    required this.updatedAt,
  });
}
