import 'package:honyomi/core_services/interfaces/basic_carousel.dart';
import 'package:honyomi/core_services/eiga/interfaces/basic_eiga_section.dart';

class BaseEigaHome {
  final BasicCarousel? carousel;
  final List<BasicEigaSection> sections;

  BaseEigaHome({this.carousel, required this.sections});
}
