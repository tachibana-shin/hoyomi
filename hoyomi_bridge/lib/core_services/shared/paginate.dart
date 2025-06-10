import 'package:eval_annotation/eval_annotation.dart';

@Bind()
class Paginate<T> {
  final List<T> items;
  final int page;
  final int totalItems;
  final int totalPages;

  const Paginate({
    required this.items,
    required this.page,
    required this.totalItems,
    required this.totalPages,
  });

  factory Paginate.createFakeData(T item) {
    return Paginate(
      items: List.generate(30, (_) => item),
      page: 1,
      totalItems: 30,
      totalPages: 1,
    );
  }
}
