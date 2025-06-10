import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:eval_annotation/eval_annotation.dart';

part 'vtt.freezed.dart';
part 'vtt.g.dart';

@freezed
@Bind()
sealed class Vtt with _$Vtt {
  const factory Vtt({required String src, Headers? headers}) = _Vtt;

  factory Vtt.fromJson(Map<String, dynamic> json) => _$VttFromJson(json);
}
