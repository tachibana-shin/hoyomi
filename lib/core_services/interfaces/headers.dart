import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/constraints/x_platform.dart';

part 'headers.freezed.dart';
part 'headers.g.dart';

const _headersIgnoreWeb = ['accept', 'cookie', 'set-cookie', 'user-agent', 'referer', 'host', 'cache-control', 'pragma', 'connection', 'content-length', 'origin'];

@freezed
sealed class Headers with _$Headers {
  const factory Headers._({
    @JsonKey() @Default({}) Map<String, List<String>> headers,
  }) = _Headers;

  factory Headers(Map<String, String>? initial) {
    final map = <String, List<String>>{};
    if (initial != null) {
      for (final entry in initial.entries) {
        map[entry.key.toLowerCase()] = [entry.value];
      }
    }
    return Headers._(headers: map);
  }

  factory Headers.fromMap(Map<String, String> map) => Headers(map);

  factory Headers.fromJson(Map<String, dynamic> json) =>
      _$HeadersFromJson(json);
}

extension HeadersExtension on Headers {
  /// 新しい値で上書きする（Headers を返す）
  Headers set(String name, String value) {
    final key = name.toLowerCase();
    final updated = Map<String, List<String>>.from(headers);
    updated[key] = [value];
    return Headers._(headers: updated);
  }

  /// 既存の値に追加する（なければ新規作成）
  Headers append(String name, String value) {
    final key = name.toLowerCase();
    final updated = Map<String, List<String>>.from(headers);
    updated.putIfAbsent(key, () => []).add(value);
    return Headers._(headers: updated);
  }

  /// 値を取得する
  String? get(String name) {
    return headers[name.toLowerCase()]?.first;
  }

  /// 複数の値を取得する
  List<String>? getAll(String name) {
    return headers[name.toLowerCase()];
  }

  /// 指定したヘッダを削除
  Headers delete(String name) {
    final key = name.toLowerCase();
    final updated = Map<String, List<String>>.from(headers);
    updated.remove(key);
    return Headers._(headers: updated);
  }

  /// ヘッダが存在するかどうか
  bool has(String name) {
    return headers.containsKey(name.toLowerCase());
  }

  /// ヘッダをシリアライズ
  Map<String, String> toMap() {
    return {
      for (final entry in headers.entries)
        if (XPlatform.isWeb ? !_headersIgnoreWeb.contains(entry.key) : true)
          entry.key: entry.value.join(', '),
    };
  }

  /// ヘッダを JSON に変換
  Map<String, dynamic> toJson() {
    return toMap();
  }
}
