import 'package:hoyomi/core_services/comic/interfaces/comic_comment.dart';
import 'package:hoyomi/core_services/interfaces/paginate.dart';

class ComicComments implements Paginate<ComicComment> {
  @override
  final List<ComicComment> items;
  @override
  final int page;
  @override
  final int totalItems;
  @override
  final int totalPages;

  ComicComments({
    required this.items,
    required this.page,
    required this.totalItems,
    required this.totalPages,
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
