import 'package:freezed_annotation/freezed_annotation.dart';

part 'watch_page.freezed.dart';
part 'watch_page.g.dart';

@freezed
sealed class WatchPage with _$WatchPage {
  factory WatchPage({required int currentPage, required int totalPage}) =
      _WatchPage;

  factory WatchPage.fromJson(Map<String, dynamic> json) =>
      _$WatchPageFromJson(json);
}
