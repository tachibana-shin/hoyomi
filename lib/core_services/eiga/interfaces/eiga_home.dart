import 'package:hoyomi/core_services/interfaces/carousel.dart';
import 'package:hoyomi/core_services/eiga/interfaces/home_eiga_section.dart';

class EigaHome {
  final Carousel? carousel;
  final List<HomeEigaSection> sections;

  EigaHome({this.carousel, required this.sections});

  factory EigaHome.createFakeData() {
    return EigaHome(
        carousel: Carousel.createFakeData(),
        sections: List.generate(3, (i) => HomeEigaSection.createFakeData()));
  }
}
