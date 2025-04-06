import 'package:freezed_annotation/freezed_annotation.dart';

part 'vtt.freezed.dart';
part 'vtt.g.dart';

@freezed
class Vtt with _$Vtt {
  const factory Vtt({
    required String src,
    Map<String, String>? headers,
  }) = _Vtt;

  factory Vtt.fromJson(Map<String, dynamic> json) => _$VttFromJson(json);
}
