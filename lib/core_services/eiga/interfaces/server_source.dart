import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_source.freezed.dart';
part 'server_source.g.dart';

@freezed
sealed class ServerSource with _$ServerSource {
  factory ServerSource({
    required String name,
    required String serverId,
  }) = _ServerSource;

  factory ServerSource.fromJson(Map<String, dynamic> json) =>
      _$ServerSourceFromJson(json);
}
