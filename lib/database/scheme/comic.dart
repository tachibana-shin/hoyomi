import 'package:isar/isar.dart';

part 'comic.g.dart';

@collection
class Comic {
  Id? id;

  @Index(unique: true)
  late String uid;

  @Index()
  late String sourceId;

  @Index()
  late String comicId;

  late String status;

  late String meta;

  @Index()
  DateTime? followedAt;

  @Index()
  final DateTime createdAt;

  DateTime updatedAt;

  static String genUid(String sourceId, {required String comicId}) {
    return '$sourceId#$comicId';
  }

  Comic({
    required this.sourceId,
    required this.comicId,
    required this.uid,
    required this.status,
    required this.meta,
    this.followedAt,
    required this.createdAt,
    required this.updatedAt,
  });
}
