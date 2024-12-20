import 'package:isar/isar.dart';

part 'cookie_manager.g.dart';

@Collection()
class CookieManager {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String uid;

  late String cookie;

  late bool signed;

  @Index()
  final DateTime createdAt;

  DateTime updatedAt;

  // Constructor
  CookieManager({
    this.id = Isar.autoIncrement,
    required this.uid,
    required this.cookie,
    required this.signed,
    required this.createdAt,
    required this.updatedAt,
  });
}
