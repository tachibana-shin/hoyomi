import 'package:honyomi/core_services/eiga/interfaces/basic_eiga.dart';

class BasicEigaSection {
  final String name;
  final String? sectionId;
  final bool? gridView;
  final List<BasicEiga> items;

  BasicEigaSection(
      {required this.items, required this.name, this.sectionId, this.gridView});

  factory BasicEigaSection.createFakeData() {
    return BasicEigaSection(
      name: 'Section Name',
      items: List.generate(10, (index) => BasicEiga.createFakeData()),
    );
  }
}
