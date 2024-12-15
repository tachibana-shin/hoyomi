class Paginate<T> {
  final List<T> items;
  final int page;
  final int totalItems;
  final int totalPages;

  const Paginate(
      {required this.items,
      required this.page,
      required this.totalItems,
      required this.totalPages});
}
