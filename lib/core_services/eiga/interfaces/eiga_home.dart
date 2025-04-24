import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/interfaces/carousel.dart';
import 'package:hoyomi/core_services/eiga/interfaces/home_eiga_category.dart';

part 'eiga_home.freezed.dart';
part 'eiga_home.g.dart';

@freezed
sealed class EigaHome with _$EigaHome {
  const factory EigaHome({
    Carousel? carousel,
    required List<HomeEigaCategory> categories,
  }) = _EigaHome;

  factory EigaHome.fromJson(Map<String, dynamic> json) =>
      _$EigaHomeFromJson(json);

  factory EigaHome.createFakeData() {
    return EigaHome(
      carousel: Carousel.createFakeData(),
      categories: List.generate(3, (i) => HomeEigaCategory.createFakeData()),
    );
  }
}
