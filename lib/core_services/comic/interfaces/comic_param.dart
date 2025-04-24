import 'package:freezed_annotation/freezed_annotation.dart';

part 'comic_param.freezed.dart';
part 'comic_param.g.dart';

@freezed
sealed class ComicParam with _$ComicParam {
  const factory ComicParam({
    required String comicId,
    String? chapterId,
  }) = _ComicParam;

  factory ComicParam.fromJson(Map<String, dynamic> json) =>
      _$ComicParamFromJson(json);
}
