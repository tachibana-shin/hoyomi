import 'package:hoyomi/core_services/interfaces/filter.dart';
import 'package:hoyomi/core_services/interfaces/paginate.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';

class EigaSection extends Paginate<Eiga> {
  final String name;
  final String url;
  final String? description;
  final List<Filter>? filters;

  const EigaSection({
    required this.name,
    required this.url,
    this.description,
    required super.items,
    required super.page,
    required super.totalItems,
    required super.totalPages,
    this.filters,
  });
}
