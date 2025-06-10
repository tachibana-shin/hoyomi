
import 'package:hoyomi_bridge/export.dart';
// ignore: unused_import
import 'package:dart_eval/stdlib/core.dart';
// ignore: unused_import
import 'package:dart_eval/dart_eval_extensions.dart';

class ComicComments extends Paginate<ComicComment> {
  ComicComments({
    required super.items,
    required super.page,
    required super.totalItems,
    required super.totalPages,
  });

  factory ComicComments.createFakeData() {
    return ComicComments(
      items: List.generate(5, (index) => ComicComment.createFakeData()),
      page: 1,
      totalItems: 50,
      totalPages: 10,
    );
  }
}
