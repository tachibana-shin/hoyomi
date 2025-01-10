import 'package:isar/isar.dart';

part 'cookie_manager.g.dart';

@Collection()
class CookieManager {
  late int id = 0;

  @Index(unique: true)
  late String uid;

  late String cookie;

  late bool signed;

  @Index()
  final DateTime createdAt;

  DateTime updatedAt;

  // Constructor
  CookieManager({
    required this.uid,
    required this.cookie,
    required this.signed,
    required this.createdAt,
    required this.updatedAt,
  });
}
