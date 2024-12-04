import 'package:objectbox/objectbox.dart';

@Entity()
class CookieManager {
  @Id()
  int id = 0;

  @Unique()
  String uid;

  @Property()
  String cookie;

  bool signed;

  @Property(type: PropertyType.date)
  DateTime createdAt;

  @Property(type: PropertyType.date)
  DateTime updatedAt;

  // Constructor
  CookieManager({
    this.id = 0,
    required this.uid,
    required this.cookie,
    required this.signed,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();
}
