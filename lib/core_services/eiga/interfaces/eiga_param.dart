import 'package:freezed_annotation/freezed_annotation.dart';

part 'eiga_param.freezed.dart';
part 'eiga_param.g.dart';

@freezed
sealed class EigaParam with _$EigaParam {
  const factory EigaParam({required String eigaId, String? episodeId}) =
      _EigaParam;

  factory EigaParam.fromJson(Map<String, dynamic> json) =>
      _$EigaParamFromJson(json);
}
