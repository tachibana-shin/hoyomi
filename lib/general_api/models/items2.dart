// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'items2.freezed.dart';
part 'items2.g.dart';

@Freezed()
abstract class Items2 with _$Items2 {
  const factory Items2({
    @JsonKey(name: 'created_at')
    required String createdAt,
    @JsonKey(name: 'eiga_text_id')
    required String eigaTextId,
    required String name,
    required String poster,
    @JsonKey(name: 'season_name')
    required String? seasonName,
    @JsonKey(name: 'source_id')
    required String sourceId,
    @JsonKey(name: 'episode_name')
    required String episodeName,
    @JsonKey(name: 'episode_id')
    required String episodeId,
    @JsonKey(name: 'episode_time')
    required String? episodeTime,
  }) = _Items2;
  
  factory Items2.fromJson(Map<String, Object?> json) => _$Items2FromJson(json);
}
