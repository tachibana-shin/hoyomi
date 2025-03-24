import 'package:hoyomi/core_services/interfaces/carousel.dart';
import 'package:hoyomi/core_services/eiga/interfaces/home_eiga_category.dart';

class EigaHome {
  final Carousel? carousel;
  final List<HomeEigaCategory> categorys;

  EigaHome({this.carousel, required this.categorys});

  factory EigaHome.createFakeData() {
    return EigaHome(
      carousel: Carousel.createFakeData(),
      categorys: List.generate(3, (i) => HomeEigaCategory.createFakeData()),
    );
  }
}
