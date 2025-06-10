import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:eval_annotation/eval_annotation.dart';

part 'o_image.freezed.dart';
part 'o_image.g.dart';

@freezed
@Bind()
sealed class OImage with _$OImage {
  const factory OImage({required String src, Headers? headers, String? extra}) =
      _OImage;

  factory OImage.fromJson(Map<String, dynamic> json) => _$OImageFromJson(json);
  factory OImage.from(String src) => OImage(src: src);

  factory OImage.createFakeData() {
    return OImage(src: fake);
  }

  static final fake = "fake:";
  static final blank = 'assets/images/blank.png';
}
