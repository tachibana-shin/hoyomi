import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:eval_annotation/eval_annotation.dart';

part 'eiga_home.freezed.dart';
part 'eiga_home.g.dart';

@freezed
@Bind()
sealed class EigaHome with _$EigaHome {
  const factory EigaHome({
    EigaCarousel? carousel,
    required List<HomeEigaCategory> categories,
  }) = _EigaHome;

  factory EigaHome.fromJson(Map<String, dynamic> json) =>
      _$EigaHomeFromJson(json);

  factory EigaHome.createFakeData() {
    return EigaHome(
      carousel: EigaCarousel.createFakeData(),
      categories: List.generate(3, (i) => HomeEigaCategory.createFakeData()),
    );
  }
}
