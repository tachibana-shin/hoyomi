import 'package:hoyomi/core_services/comic/interfaces/comic_comment.dart';
import 'package:hoyomi/core_services/interfaces/paginate.dart';

class ComicComments extends Paginate<ComicComment> {
  ComicComments(
      {required super.items,
      required super.page,
      required super.totalItems,
      required super.totalPages});
}
