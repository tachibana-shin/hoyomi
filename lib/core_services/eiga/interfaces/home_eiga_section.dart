import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';

class HomeEigaSection {
  final String name;
  final String? sectionId;
  final bool? gridView;
  final List<Eiga> items;

  HomeEigaSection(
      {required this.items, required this.name, this.sectionId, this.gridView});

  factory HomeEigaSection.createFakeData() {
    return HomeEigaSection(
      name: 'Section Name',
      items: List.generate(10, (index) => Eiga.createFakeData()),
    );
  }
}
